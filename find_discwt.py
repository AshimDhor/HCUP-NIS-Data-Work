#!/usr/bin/env python3
"""
Find which files contain DISCWT
"""

import pandas as pd
import glob
import os

BASE_DIR = "/home/ashim/emily/HCUP data"
OUTPUT_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")

# Check core files
print("Checking Core files...")
core_files = glob.glob(os.path.join(OUTPUT_DIR, "core", "*.parquet"))
df_core = pd.read_parquet(core_files[0])
if 'DISCWT' in df_core.columns:
    print("  ✓ DISCWT found in Core file")
    print(f"    Sample values: {df_core['DISCWT'].head(5).tolist()}")
else:
    print("  ✗ DISCWT NOT found in Core file")

# Check hospital files
print("\nChecking Hospital files...")
hospital_files = glob.glob(os.path.join(OUTPUT_DIR, "hospital", "*.parquet"))
df_hospital = pd.read_parquet(hospital_files[0])
if 'DISCWT' in df_hospital.columns:
    print("  ✓ DISCWT found in Hospital file")
    print(f"    Sample values: {df_hospital['DISCWT'].head(5).tolist()}")
else:
    print("  ✗ DISCWT NOT found in Hospital file")

# Check all columns in core
print("\nAll columns in Core file (first 30):")
for i, col in enumerate(df_core.columns[:30]):
    print(f"  {i+1:2d}. {col}")

# Look for weight-related columns
print("\nColumns containing 'WT' in Core file:")
wt_cols = [col for col in df_core.columns if 'WT' in col]
for col in wt_cols:
    print(f"  {col}")