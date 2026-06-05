#!/usr/bin/env python3
"""
NIS 2023 - Corrected Merge Preserving DISCWT
"""

import pandas as pd
import glob
import os
import numpy as np
from tqdm import tqdm
import warnings
warnings.filterwarnings('ignore')

BASE_DIR = "/home/ashim/emily/HCUP data"
OUTPUT_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")
FINAL_DIR = os.path.join(BASE_DIR, "FINAL_DATA")
os.makedirs(FINAL_DIR, exist_ok=True)

print("=" * 70)
print("NIS 2023 - Corrected Merge (Preserving DISCWT)")
print("=" * 70)

# ============================================
# 1. Load all data
# ============================================

print("\n Loading data with tqdm...")

# Core data (has DISCWT)
core_files = sorted(glob.glob(os.path.join(OUTPUT_DIR, "core", "*.parquet")))
df_core_list = []
for f in tqdm(core_files, desc="Loading core"):
    df_core_list.append(pd.read_parquet(f))
df_core = pd.concat(df_core_list, ignore_index=True)
print(f"   Core: {len(df_core):,} rows, {len(df_core.columns)} columns")
print(f"   DISCWT in core: {'Yes' if 'DISCWT' in df_core.columns else 'No'}")

# Severity data
severity_files = sorted(glob.glob(os.path.join(OUTPUT_DIR, "severity", "*.parquet")))
df_severity_list = []
for f in tqdm(severity_files, desc="Loading severity"):
    df_severity_list.append(pd.read_parquet(f))
df_severity = pd.concat(df_severity_list, ignore_index=True)
print(f"   Severity: {len(df_severity):,} rows, {len(df_severity.columns)} columns")

# DX data
dx_files = sorted(glob.glob(os.path.join(OUTPUT_DIR, "dx_pr_grps", "*.parquet")))
df_dx_list = []
for f in tqdm(dx_files, desc="Loading DX"):
    df_dx_list.append(pd.read_parquet(f))
df_dx = pd.concat(df_dx_list, ignore_index=True)
print(f"   DX: {len(df_dx):,} rows, {len(df_dx.columns)} columns")

# Hospital data (has DISCWT too, but we'll drop it to avoid conflict)
hospital_files = glob.glob(os.path.join(OUTPUT_DIR, "hospital", "*.parquet"))
df_hospital = pd.read_parquet(hospital_files[0])
print(f"   Hospital: {len(df_hospital):,} rows, {len(df_hospital.columns)} columns")
print(f"   DISCWT in hospital: {'Yes' if 'DISCWT' in df_hospital.columns else 'No'}")

# ============================================
# 2. Remove DISCWT from hospital to avoid conflict
# ============================================

if 'DISCWT' in df_hospital.columns:
    print("\n  Removing DISCWT from hospital data to preserve core weights")
    df_hospital = df_hospital.drop(columns=['DISCWT'])

# ============================================
# 3. Merge carefully
# ============================================

print("\n Merging datasets...")

# Start with core (keep its DISCWT)
df_merged = df_core.copy()
print(f"   Starting with core: {len(df_merged):,} rows")

# Merge severity
df_merged = df_merged.merge(df_severity, on=['HOSP_NIS', 'KEY_NIS'], how='left')
print(f"   After severity: {len(df_merged):,} rows")

# Merge DX
df_merged = df_merged.merge(df_dx, on=['HOSP_NIS', 'KEY_NIS'], how='left')
print(f"   After DX: {len(df_merged):,} rows")

# Merge hospital (without its DISCWT)
df_merged = df_merged.merge(df_hospital, on=['HOSP_NIS'], how='left')
print(f"   After hospital: {len(df_merged):,} rows")

# ============================================
# 4. Verify DISCWT is still there
# ============================================

print("\n  Verifying DISCWT...")

if 'DISCWT' in df_merged.columns:
    # Convert to numeric
    df_merged['DISCWT'] = pd.to_numeric(df_merged['DISCWT'], errors='coerce')
    
    # Check values
    valid_weights = df_merged['DISCWT'].notna() & (df_merged['DISCWT'] > 0)
    print(f"   ✓ DISCWT found in merged data")
    print(f"   Valid weights: {valid_weights.sum():,} rows ({valid_weights.sum()/len(df_merged)*100:.1f}%)")
    print(f"   Weight sum: {df_merged.loc[valid_weights, 'DISCWT'].sum():,.0f}")
    print(f"   Weight range: {df_merged['DISCWT'].min():.4f} - {df_merged['DISCWT'].max():.4f}")
else:
    print("   ✗ ERROR: DISCWT lost during merge!")
    print("   Checking original core again...")
    if 'DISCWT' in df_core.columns:
        print("   Re-adding DISCWT from original core")
        df_merged['DISCWT'] = df_core['DISCWT']

# ============================================
# 5. Convert variables to proper types
# ============================================

print("\n Converting data types...")

numeric_cols = ['AGE', 'FEMALE', 'LOS', 'DIED', 'NDX', 'NPR', 'ORPROC', 'PAY1', 'ZIPINC_QRTL', 'TOTCHG']
for col in numeric_cols:
    if col in df_merged.columns:
        df_merged[col] = pd.to_numeric(df_merged[col], errors='coerce')
        print(f"   Converted: {col}")

# ============================================
# 6. Create analysis variables
# ============================================

print("\n📊 Creating derived variables...")

# Age categories
if 'AGE' in df_merged.columns:
    df_merged['AGE_CAT'] = pd.cut(df_merged['AGE'], 
                                   bins=[0, 18, 40, 65, 80, 120],
                                   labels=['0-17', '18-39', '40-64', '65-79', '80+'])
    print("   Created: AGE_CAT")

# Sex
if 'FEMALE' in df_merged.columns:
    df_merged['SEX'] = df_merged['FEMALE'].map({0: 'Male', 1: 'Female'})
    print("   Created: SEX")

# Income quartile (socioeconomic proxy)
if 'ZIPINC_QRTL' in df_merged.columns:
    income_map = {1: 'Q1 (Lowest)', 2: 'Q2', 3: 'Q3', 4: 'Q4 (Highest)'}
    df_merged['INCOME_GROUP'] = df_merged['ZIPINC_QRTL'].map(income_map)
    print("   Created: INCOME_GROUP")

# Payer
if 'PAY1' in df_merged.columns:
    pay_map = {
        '1': 'Medicare', '2': 'Medicaid', '3': 'Private', 
        '4': 'Self-pay', '5': 'No charge', '6': 'Other'
    }
    df_merged['PAYER_GROUP'] = df_merged['PAY1'].map(pay_map)
    print("   Created: PAYER_GROUP")

# Hospital teaching
if 'HOSP_LOCTEACH' in df_merged.columns:
    teaching_map = {'0': 'Rural', '1': 'Urban non-teaching', '2': 'Urban teaching'}
    df_merged['TEACHING'] = df_merged['HOSP_LOCTEACH'].map(teaching_map)
    print("   Created: TEACHING")

# Hospital bed size
if 'HOSP_BEDSIZE' in df_merged.columns:
    bedsize_map = {'1': 'Small', '2': 'Medium', '3': 'Large'}
    df_merged['BEDSIZE'] = df_merged['HOSP_BEDSIZE'].map(bedsize_map)
    print("   Created: BEDSIZE")

# Hospital region
if 'HOSP_REGION' in df_merged.columns:
    region_map = {'1': 'Northeast', '2': 'Midwest', '3': 'South', '4': 'West'}
    df_merged['REGION'] = df_merged['HOSP_REGION'].map(region_map)
    print("   Created: REGION")

# ============================================
# 7. Weighted statistics (for your paper)
# ============================================

print("\n" + "=" * 70)
print("WEIGHTED NATIONAL ESTIMATES (Using DISCWT)")
print("=" * 70)

# Use only valid weights
valid = df_merged['DISCWT'].notna() & (df_merged['DISCWT'] > 0)
df_valid = df_merged[valid].copy()

if len(df_valid) > 0:
    total_discharges = df_valid['DISCWT'].sum()
    print(f"\n🏥 Total hospitalizations (national estimate): {total_discharges:,.0f}")
    
    # Demographics
    if 'AGE' in df_valid.columns:
        age_valid = df_valid[df_valid['AGE'].notna()]
        if len(age_valid) > 0:
            weighted_age = np.average(age_valid['AGE'], weights=age_valid['DISCWT'])
            print(f"\n📊 Demographics:")
            print(f"   Mean age: {weighted_age:.1f} years")
    
    if 'FEMALE' in df_valid.columns:
        female_valid = df_valid[df_valid['FEMALE'].notna()]
        if len(female_valid) > 0:
            weighted_female = np.average(female_valid['FEMALE'], weights=female_valid['DISCWT'])
            print(f"   Female: {weighted_female*100:.1f}%")
    
    # Outcomes
    print(f"\n Outcomes:")
    
    if 'DIED' in df_valid.columns:
        died_valid = df_valid[df_valid['DIED'].notna()]
        if len(died_valid) > 0:
            weighted_mortality = np.average(died_valid['DIED'], weights=died_valid['DISCWT'])
            print(f"   In-hospital mortality: {weighted_mortality*100:.2f}%")
    
    if 'LOS' in df_valid.columns:
        los_valid = df_valid[df_valid['LOS'].notna()]
        if len(los_valid) > 0:
            weighted_los = np.average(los_valid['LOS'], weights=los_valid['DISCWT'])
            print(f"   Mean length of stay: {weighted_los:.1f} days")
    
    if 'TOTCHG' in df_valid.columns:
        totchg_valid = df_valid[df_valid['TOTCHG'].notna() & (df_valid['TOTCHG'] > 0)]
        if len(totchg_valid) > 0:
            # Cap at 99th percentile
            cap = totchg_valid['TOTCHG'].quantile(0.99)
            totchg_capped = totchg_valid[totchg_valid['TOTCHG'] <= cap]
            weighted_charges = np.average(totchg_capped['TOTCHG'], weights=totchg_capped['DISCWT'])
            print(f"   Mean total charges (capped at 99th %ile): ${weighted_charges:,.0f}")
    
    # Socioeconomic disparities
    if 'INCOME_GROUP' in df_valid.columns:
        print(f"\n Socioeconomic Distribution (by ZIP code income quartile):")
        income_stats = df_valid.groupby('INCOME_GROUP').apply(
            lambda x: pd.Series({
                'n': len(x),
                'weighted_n': x['DISCWT'].sum(),
                'pct': x['DISCWT'].sum() / total_discharges * 100,
                'mortality': np.average(x['DIED'], weights=x['DISCWT']) * 100 if 'DIED' in x.columns else 0
            })
        ).sort_index()
        
        for income in income_stats.index:
            if pd.notna(income):
                print(f"   {income}: {income_stats.loc[income, 'pct']:.1f}% of discharges")
                if 'DIED' in income_stats.columns:
                    print(f"      Mortality: {income_stats.loc[income, 'mortality']:.2f}%")
    
    # Payer distribution
    if 'PAYER_GROUP' in df_valid.columns:
        print(f"\n Insurance Payer:")
        payer_stats = df_valid.groupby('PAYER_GROUP').apply(
            lambda x: x['DISCWT'].sum() / total_discharges * 100
        ).sort_values(ascending=False)
        for payer, pct in payer_stats.head(6).items():
            if pd.notna(payer):
                print(f"   {payer}: {pct:.1f}%")
    
    # Hospital characteristics
    if 'TEACHING' in df_valid.columns:
        print(f"\n🏥 Hospital Type:")
        teaching_stats = df_valid.groupby('TEACHING').apply(
            lambda x: x['DISCWT'].sum() / total_discharges * 100
        ).sort_values(ascending=False)
        for teaching, pct in teaching_stats.items():
            if pd.notna(teaching):
                print(f"   {teaching}: {pct:.1f}%")
    
    if 'REGION' in df_valid.columns:
        print(f"\n📍 Geographic Region:")
        region_stats = df_valid.groupby('REGION').apply(
            lambda x: x['DISCWT'].sum() / total_discharges * 100
        ).sort_index()
        for region, pct in region_stats.items():
            if pd.notna(region):
                print(f"   {region}: {pct:.1f}%")

else:
    print("   No valid weights found!")

# ============================================
# 8. Save everything
# ============================================

print("\n Saving merged data...")

# Save full dataset
output_file = os.path.join(FINAL_DIR, "nis_2023_full.parquet")
df_merged.to_parquet(output_file, compression='snappy', index=False)
print(f"    Full data: {output_file}")
print(f"     Size: {os.path.getsize(output_file) / 1e9:.2f} GB")

# Save sample
sample_file = os.path.join(FINAL_DIR, "nis_2023_sample.parquet")
df_sample = df_merged.sample(min(50000, len(df_merged)), random_state=42)
df_sample.to_parquet(sample_file, index=False)
print(f"    Sample: {sample_file}")

# Save codebook of available variables
codebook_file = os.path.join(FINAL_DIR, "variable_codebook.txt")
with open(codebook_file, 'w') as f:
    f.write("NIS 2023 - Variable Codebook\n")
    f.write("=" * 50 + "\n\n")
    f.write(f"Total discharges: {len(df_merged):,}\n")
    f.write(f"Total columns: {len(df_merged.columns)}\n\n")
    f.write("COLUMN NAME - DATA TYPE (non-null count)\n")
    f.write("-" * 50 + "\n")
    for col in sorted(df_merged.columns):
        dtype = df_merged[col].dtype
        non_null = df_merged[col].notna().sum()
        null_pct = (1 - non_null/len(df_merged)) * 100
        f.write(f"{col:<30} {str(dtype):<15} (non-null: {non_null:,}, {null_pct:.1f}% missing)\n")
print(f"    Codebook: {codebook_file}")

print("\n" + "=" * 70)
print(" DATA PREPARATION COMPLETE!")
print("=" * 70)

print("\n All files saved in: FINAL_DATA/")
print("   - nis_2023_full.parquet  (complete dataset with weights)")
print("   - nis_2023_sample.parquet (50,000 row sample)")
print("   - variable_codebook.txt   (all column names & descriptions)")

print("\n Quick start for analysis:")
print("   import pandas as pd")
print("   import numpy as np")
print("   df = pd.read_parquet('FINAL_DATA/nis_2023_full.parquet')")
print("   ")
print("   # For national estimates, always weight:")
print("   valid = df[df['DISCWT'] > 0].copy()")
print("   weighted_mean = np.average(valid['outcome'], weights=valid['DISCWT'])")