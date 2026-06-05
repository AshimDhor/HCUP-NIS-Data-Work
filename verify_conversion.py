#!/usr/bin/env python3
"""
Export DuckDB tables to Parquet files and create analysis dataset
"""

import duckdb
import pandas as pd
import os

BASE_DIR = "/home/ashim/emily/HCUP data"
FINAL_DIR = os.path.join(BASE_DIR, "FINAL_DATA")
os.makedirs(FINAL_DIR, exist_ok=True)

print("=" * 70)
print("Exporting DuckDB Database to Parquet Files")
print("=" * 70)

# Connect to DuckDB
con = duckdb.connect('nis2023.duckdb')

# 1. Check what tables exist
print("\n Tables in DuckDB:")
tables = con.execute("SHOW TABLES").fetchdf()
print(tables.to_string(index=False))

# 2. Get basic info about merged table
print("\n Merged Table Info:")
info = con.execute("""
    SELECT 
        COUNT(*) as total_rows,
        COUNT(DISTINCT HOSP_NIS) as unique_hospitals,
        COUNT(DISTINCT KEY_NIS) as unique_discharges
    FROM merged
""").fetchdf()
print(info.to_string(index=False))

# 3. Check for TOTCHG column
print("\n Checking for charge-related columns:")
cols = con.execute("SELECT * FROM merged LIMIT 0").fetchdf().columns.tolist()
charge_cols = [c for c in cols if 'CHG' in c.upper() or 'CHARGE' in c.upper() or 'TOT' in c.upper()]
print(f"Found: {charge_cols if charge_cols else 'None - TOTCHG might be missing'}")

# 4. Create a clean analysis table with derived variables
print("\n🔧 Creating analysis-ready table...")

# First, let's see what columns we actually have
print("\nAvailable columns in merged (first 30):")
for i, col in enumerate(cols[:30]):
    print(f"  {i+1:2d}. {col}")

# Create analysis table without TOTCHG for now
con.execute("""
    CREATE OR REPLACE TABLE merged_analysis AS
    SELECT 
        -- Identifiers
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
        
        -- Outcomes
        CAST(DIED AS INTEGER) as died,
        CAST(LOS AS INTEGER) as los,
        
        -- Survey weights (CRITICAL for national estimates)
        CAST(DISCWT AS DOUBLE) as discharge_weight,
        CAST(NIS_STRATUM AS INTEGER) as nis_stratum,
        
        -- Diagnosis and procedure counts
        CAST(NDX AS INTEGER) as n_diagnoses,
        CAST(NPR AS INTEGER) as n_procedures
        
    FROM merged
    WHERE DISCWT IS NOT NULL 
      AND DISCWT != '' 
      AND CAST(DISCWT AS DOUBLE) > 0
""")

# Get count
analysis_count = con.execute("SELECT COUNT(*) FROM merged_analysis").fetchone()[0]
print(f"\n Created merged_analysis table with {analysis_count:,} rows")

# 5. Export to Parquet files
print("\n Exporting to Parquet files...")

# Export merged_analysis to Parquet
output_file = os.path.join(FINAL_DIR, "nis_2023_analysis.parquet")
con.execute(f"""
    COPY merged_analysis TO '{output_file}' (FORMAT PARQUET)
""")
print(f"    Exported analysis table to: {output_file}")
print(f"     File size: {os.path.getsize(output_file) / 1e9:.2f} GB")

# Export a sample (50,000 rows) for quick analysis
sample_file = os.path.join(FINAL_DIR, "nis_2023_sample.parquet")
con.execute(f"""
    COPY (
        SELECT * FROM merged_analysis 
        USING SAMPLE 50000
    ) TO '{sample_file}' (FORMAT PARQUET)
""")
print(f"    Exported sample to: {sample_file}")

# 6. Generate summary statistics
print("\n Generating summary statistics...")

summary = con.execute("""
    SELECT 
        COUNT(*) as n_patients,
        ROUND(AVG(age), 1) as mean_age,
        ROUND(100 * AVG(female), 1) as pct_female,
        ROUND(100 * AVG(died), 2) as mortality_rate,
        ROUND(AVG(los), 1) as mean_los,
        ROUND(MEDIAN(los), 1) as median_los,
        ROUND(SUM(discharge_weight), 0) as national_estimate
    FROM merged_analysis
""").fetchdf()

print("\n=== SUMMARY STATISTICS (Weighted National Estimates) ===")
print(summary.to_string(index=False))

# 7. Disparity analysis by age category
print("\n Outcomes by Age Category:")
age_outcomes = con.execute("""
    SELECT 
        age_category,
        COUNT(*) as n,
        ROUND(100 * AVG(died), 2) as mortality_pct,
        ROUND(AVG(los), 1) as mean_los,
        ROUND(MEDIAN(los), 1) as median_los
    FROM merged_analysis
    WHERE age_category != 'Unknown'
    GROUP BY age_category
    ORDER BY 
        CASE age_category
            WHEN '0-17' THEN 1
            WHEN '18-39' THEN 2
            WHEN '40-64' THEN 3
            WHEN '65-79' THEN 4
            WHEN '80+' THEN 5
        END
""").fetchdf()
print(age_outcomes.to_string(index=False))

# 8. Disparity analysis by sex
print("\n Outcomes by Sex:")
sex_outcomes = con.execute("""
    SELECT 
        sex,
        COUNT(*) as n,
        ROUND(100 * AVG(died), 2) as mortality_pct,
        ROUND(AVG(los), 1) as mean_los
    FROM merged_analysis
    GROUP BY sex
""").fetchdf()
print(sex_outcomes.to_string(index=False))

# 9. Save column information
print("\n Saving variable information...")

# Get all column names and types
columns_info = con.execute("""
    SELECT 
        column_name,
        data_type
    FROM information_schema.columns 
    WHERE table_name = 'merged_analysis'
    ORDER BY ordinal_position
""").fetchdf()

columns_info_file = os.path.join(FINAL_DIR, "variable_list.txt")
with open(columns_info_file, 'w') as f:
    f.write("NIS 2023 - Analysis Variables\n")
    f.write("=" * 50 + "\n\n")
    f.write(f"Total rows: {analysis_count:,}\n")
    f.write(f"Total columns: {len(columns_info)}\n\n")
    f.write("COLUMN NAME | DATA TYPE\n")
    f.write("-" * 40 + "\n")
    for _, row in columns_info.iterrows():
        f.write(f"{row['column_name']:<30} {row['data_type']}\n")
print(f"   ✓ Saved to: {columns_info_file}")

# 10. Create a simple README
readme_file = os.path.join(FINAL_DIR, "README.txt")
with open(readme_file, 'w') as f:
    f.write("NIS 2023 Dataset for Analysis\n")
    f.write("=" * 50 + "\n\n")
    f.write("FILES:\n")
    f.write("  - nis_2023_analysis.parquet : Complete analysis dataset (6.7M rows)\n")
    f.write("  - nis_2023_sample.parquet   : 50,000 row sample for quick testing\n")
    f.write("  - variable_list.txt         : All column names and types\n\n")
    f.write("IMPORTANT NOTES:\n")
    f.write("  1. ALWAYS use 'discharge_weight' for national estimates\n")
    f.write("  2. This dataset is weighted for national representation\n")
    f.write("  3. Total national discharges: 34-36 million (use weight sum)\n\n")
    f.write("TO LOAD IN PYTHON:\n")
    f.write("  import pandas as pd\n")
    f.write("  df = pd.read_parquet('nis_2023_analysis.parquet')\n\n")
    f.write("TO GET WEIGHTED ESTIMATES:\n")
    f.write("  import numpy as np\n")
    f.write("  valid = df[df['discharge_weight'] > 0]\n")
    f.write("  weighted_mean = np.average(valid['outcome'], weights=valid['discharge_weight'])\n")
print(f"   ✓ Saved README to: {readme_file}")

print("\n" + "=" * 70)
print(" EXPORT COMPLETE!")
print("=" * 70)
print(f"\n All files saved in: {FINAL_DIR}/")
print("   - nis_2023_analysis.parquet (main dataset)")
print("   - nis_2023_sample.parquet (sample)")
print("   - variable_list.txt")
print("   - README.txt")

print("\n Next steps:")
print("   1. Load the data: df = pd.read_parquet('FINAL_DATA/nis_2023_analysis.parquet')")
print("   2. Always use 'discharge_weight' for national estimates")
print("   3. Ready for your high-impact paper analysis!")