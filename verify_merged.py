#!/usr/bin/env python3
"""
Verify the merged DuckDB database and prepare for analysis
"""

import duckdb
import pandas as pd
import numpy as np

# Connect to database
con = duckdb.connect('nis2023.duckdb')

print("=" * 70)
print("NIS 2023 - Data Verification")
print("=" * 70)

# 1. Basic counts
print("\n Basic Statistics:")
result = con.execute("""
    SELECT 
        COUNT(*) as total_rows,
        COUNT(DISTINCT HOSP_NIS) as unique_hospitals,
        COUNT(DISTINCT KEY_NIS) as unique_discharges,
        SUM(CASE WHEN DISCWT IS NOT NULL THEN 1 ELSE 0 END) as has_weight,
        MIN(CAST(AGE AS INTEGER)) as min_age,
        MAX(CAST(AGE AS INTEGER)) as max_age,
        AVG(CAST(AGE AS DOUBLE)) as mean_age
    FROM merged
    WHERE AGE IS NOT NULL AND AGE != ''
""").fetchdf()

print(result.to_string(index=False))

# 2. Check key variables
print("\n Key Variable Quality:")
result = con.execute("""
    SELECT 
        'AGE' as variable,
        COUNT(*) as total,
        SUM(CASE WHEN AGE IS NOT NULL AND AGE != '' THEN 1 ELSE 0 END) as non_null,
        ROUND(100.0 * SUM(CASE WHEN AGE IS NOT NULL AND AGE != '' THEN 1 ELSE 0 END) / COUNT(*), 1) as pct_valid
    FROM merged
    UNION ALL
    SELECT 
        'FEMALE',
        COUNT(*),
        SUM(CASE WHEN FEMALE IS NOT NULL AND FEMALE != '' THEN 1 ELSE 0 END),
        ROUND(100.0 * SUM(CASE WHEN FEMALE IS NOT NULL AND FEMALE != '' THEN 1 ELSE 0 END) / COUNT(*), 1)
    FROM merged
    UNION ALL
    SELECT 
        'DIED',
        COUNT(*),
        SUM(CASE WHEN DIED IS NOT NULL AND DIED != '' THEN 1 ELSE 0 END),
        ROUND(100.0 * SUM(CASE WHEN DIED IS NOT NULL AND DIED != '' THEN 1 ELSE 0 END) / COUNT(*), 1)
    FROM merged
    UNION ALL
    SELECT 
        'LOS',
        COUNT(*),
        SUM(CASE WHEN LOS IS NOT NULL AND LOS != '' THEN 1 ELSE 0 END),
        ROUND(100.0 * SUM(CASE WHEN LOS IS NOT NULL AND LOS != '' THEN 1 ELSE 0 END) / COUNT(*), 1)
    FROM merged
    UNION ALL
    SELECT 
        'DISCWT',
        COUNT(*),
        SUM(CASE WHEN DISCWT IS NOT NULL AND DISCWT != '' AND CAST(DISCWT AS DOUBLE) > 0 THEN 1 ELSE 0 END),
        ROUND(100.0 * SUM(CASE WHEN DISCWT IS NOT NULL AND DISCWT != '' AND CAST(DISCWT AS DOUBLE) > 0 THEN 1 ELSE 0 END) / COUNT(*), 1)
    FROM merged
""").fetchdf()

print(result.to_string(index=False))

# 3. Weighted national estimates
print("\n" + "=" * 70)
print(" WEIGHTED NATIONAL ESTIMATES (Using DISCWT)")
print("=" * 70)

weighted_stats = con.execute("""
    WITH valid_data AS (
        SELECT 
            CAST(AGE AS INTEGER) as age,
            CAST(FEMALE AS INTEGER) as female,
            CAST(DIED AS INTEGER) as died,
            CAST(LOS AS INTEGER) as los,
            CAST(TOTCHG AS DOUBLE) as totchg,
            CAST(DISCWT AS DOUBLE) as weight
        FROM merged
        WHERE DISCWT IS NOT NULL 
          AND DISCWT != '' 
          AND CAST(DISCWT AS DOUBLE) > 0
          AND AGE IS NOT NULL AND AGE != ''
    )
    SELECT 
        SUM(weight) as total_discharges,
        SUM(weight * age) / SUM(weight) as weighted_mean_age,
        SUM(weight * female) / SUM(weight) * 100 as weighted_pct_female,
        SUM(weight * died) / SUM(weight) * 100 as weighted_mortality_rate,
        SUM(weight * los) / SUM(weight) as weighted_mean_los,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY los) as median_los
    FROM valid_data
""").fetchdf()

print(f"\nTotal national discharges: {weighted_stats['total_discharges'].iloc[0]:,.0f}")
print(f"Mean age (weighted): {weighted_stats['weighted_mean_age'].iloc[0]:.1f} years")
print(f"Female (weighted): {weighted_stats['weighted_pct_female'].iloc[0]:.1f}%")
print(f"In-hospital mortality (weighted): {weighted_stats['weighted_mortality_rate'].iloc[0]:.2f}%")
print(f"Mean LOS (weighted): {weighted_stats['weighted_mean_los'].iloc[0]:.1f} days")
print(f"Median LOS: {weighted_stats['median_los'].iloc[0]:.0f} days")

# 4. Create analysis-ready table with derived variables
print("\n" + "=" * 70)
print(" Creating Analysis-Ready Table with Derived Variables")
print("=" * 70)

# Create a new table with derived variables
con.execute("""
    CREATE OR REPLACE TABLE merged_analysis AS
    SELECT 
        -- Original identifiers
        HOSP_NIS,
        KEY_NIS,
        
        -- Demographics
        CAST(AGE AS INTEGER) as age,
        CASE 
            WHEN CAST(AGE AS INTEGER) BETWEEN 0 AND 17 THEN '0-17'
            WHEN CAST(AGE AS INTEGER) BETWEEN 18 AND 39 THEN '18-39'
            WHEN CAST(AGE AS INTEGER) BETWEEN 40 AND 64 THEN '40-64'
            WHEN CAST(AGE AS INTEGER) BETWEEN 65 AND 79 THEN '65-79'
            WHEN CAST(AGE AS INTEGER) >= 80 THEN '80+'
            ELSE 'Unknown'
        END as age_category,
        
        CAST(FEMALE AS INTEGER) as female,
        CASE WHEN CAST(FEMALE AS INTEGER) = 1 THEN 'Female' ELSE 'Male' END as sex,
        
        -- Socioeconomic (using ZIP code income as proxy)
        CAST(ZIPINC_QRTL AS INTEGER) as income_quartile,
        CASE 
            WHEN CAST(ZIPINC_QRTL AS INTEGER) = 1 THEN 'Q1 (Lowest)'
            WHEN CAST(ZIPINC_QRTL AS INTEGER) = 2 THEN 'Q2'
            WHEN CAST(ZIPINC_QRTL AS INTEGER) = 3 THEN 'Q3'
            WHEN CAST(ZIPINC_QRTL AS INTEGER) = 4 THEN 'Q4 (Highest)'
            ELSE 'Unknown'
        END as income_group,
        
        -- Payer
        CAST(PAY1 AS INTEGER) as payer,
        CASE 
            WHEN CAST(PAY1 AS INTEGER) = 1 THEN 'Medicare'
            WHEN CAST(PAY1 AS INTEGER) = 2 THEN 'Medicaid'
            WHEN CAST(PAY1 AS INTEGER) = 3 THEN 'Private'
            WHEN CAST(PAY1 AS INTEGER) = 4 THEN 'Self-pay'
            WHEN CAST(PAY1 AS INTEGER) = 5 THEN 'No charge'
            ELSE 'Other'
        END as payer_group,
        
        -- Outcomes
        CAST(DIED AS INTEGER) as died,
        CAST(LOS AS INTEGER) as los,
        CAST(TOTCHG AS DOUBLE) as total_charges,
        
        -- Hospital characteristics
        HOSP_BEDSIZE,
        CASE 
            WHEN HOSP_BEDSIZE = '1' THEN 'Small'
            WHEN HOSP_BEDSIZE = '2' THEN 'Medium'
            WHEN HOSP_BEDSIZE = '3' THEN 'Large'
            ELSE 'Unknown'
        END as bed_size,
        
        HOSP_LOCTEACH,
        CASE 
            WHEN HOSP_LOCTEACH = '0' THEN 'Rural'
            WHEN HOSP_LOCTEACH = '1' THEN 'Urban non-teaching'
            WHEN HOSP_LOCTEACH = '2' THEN 'Urban teaching'
            ELSE 'Unknown'
        END as teaching_status,
        
        HOSP_REGION,
        CASE 
            WHEN HOSP_REGION = '1' THEN 'Northeast'
            WHEN HOSP_REGION = '2' THEN 'Midwest'
            WHEN HOSP_REGION = '3' THEN 'South'
            WHEN HOSP_REGION = '4' THEN 'West'
            ELSE 'Unknown'
        END as region,
        
        -- Survey weights (CRITICAL for national estimates)
        CAST(DISCWT AS DOUBLE) as discharge_weight,
        CAST(NIS_STRATUM AS INTEGER) as nis_stratum,
        
        -- Diagnosis and procedure counts
        CAST(NDX AS INTEGER) as n_diagnoses,
        CAST(NPR AS INTEGER) as n_procedures,
        CAST(ORPROC AS INTEGER) as major_OR_procedure
        
    FROM merged
    WHERE DISCWT IS NOT NULL 
      AND DISCWT != '' 
      AND CAST(DISCWT AS DOUBLE) > 0
""")

print("✓ Created merged_analysis table with derived variables")

# 5. Check the new table
result = con.execute("SELECT COUNT(*) FROM merged_analysis").fetchone()[0]
print(f"   Analysis table rows: {result:,}")

# 6. Sample data preview
print("\n📋 Sample of analysis-ready data:")
sample = con.execute("""
    SELECT age, age_category, sex, income_group, payer_group, 
           died, los, teaching_status, region, discharge_weight
    FROM merged_analysis
    LIMIT 10
""").fetchdf()
print(sample.to_string(index=False))

# 7. Quick disparity analysis (unadjusted)
print("\n" + "=" * 70)
print(" PRELIMINARY DISPARITY ANALYSIS (Income-Based)")
print("=" * 70)

disparity = con.execute("""
    SELECT 
        income_group,
        COUNT(*) as n,
        ROUND(AVG(died) * 100, 2) as mortality_pct,
        ROUND(AVG(los), 1) as mean_los,
        ROUND(AVG(total_charges), 0) as mean_charges,
        ROUND(AVG(age), 1) as mean_age,
        ROUND(100 * AVG(female), 1) as pct_female
    FROM merged_analysis
    WHERE income_group != 'Unknown'
    GROUP BY income_group
    ORDER BY income_group
""").fetchdf()

print(disparity.to_string(index=False))

print("\n" + "=" * 70)
print(" VERIFICATION COMPLETE!")
print("=" * 70)

print("\n Your DuckDB database 'nis2023.duckdb' contains:")
print("   - merged: Original merged table (6,743,716 rows)")
print("   - merged_analysis: Analysis-ready table with derived variables")
print("\n For your paper, remember to use discharge_weight for national estimates!")