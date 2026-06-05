#!/usr/bin/env python3
"""
Visualize NIS 2023 data directly from Parquet files - FIXED VERSION
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import glob
import os
from tqdm import tqdm
import warnings
warnings.filterwarnings('ignore')

# Set style - FIXED for newer matplotlib versions
try:
    plt.style.use('seaborn-v0_8-darkgrid')
except:
    try:
        plt.style.use('seaborn-darkgrid')
    except:
        plt.style.use('default')

sns.set_palette("husl")

# Configuration
BASE_DIR = "/home/ashim/emily/HCUP data"
PARQUET_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")
FIG_DIR = os.path.join(BASE_DIR, "figures")
os.makedirs(FIG_DIR, exist_ok=True)

print("=" * 70)
print("NIS 2023 Data Visualization from Parquet Files")
print("=" * 70)

# ============================================
# Load data from Parquet files
# ============================================

def load_parquet_data(dataset_name, limit=None):
    """Load parquet files for a dataset"""
    files = sorted(glob.glob(os.path.join(PARQUET_DIR, dataset_name, "*.parquet")))
    if limit:
        files = files[:limit]
    
    dfs = []
    for f in tqdm(files, desc=f"Loading {dataset_name}"):
        dfs.append(pd.read_parquet(f))
    
    return pd.concat(dfs, ignore_index=True)

print("\n📂 Loading data from Parquet files...")

# Load core data (first 10 chunks for visualization)
n_chunks = 10  # Adjust based on your RAM (10 chunks = ~1 million rows)
print(f"Loading {n_chunks} chunks of core data (approx {n_chunks*100000:,} rows)...")
df_core = load_parquet_data("core", limit=n_chunks)

# Load hospital data (small file, load all)
df_hospital = load_parquet_data("hospital", limit=None)

print(f"\n✅ Loaded {len(df_core):,} core rows, {len(df_hospital):,} hospital rows")

# ============================================
# Data Cleaning and Type Conversion
# ============================================

print("\n🔄 Converting data types...")

# Convert key columns to numeric
numeric_cols = ['AGE', 'FEMALE', 'DIED', 'LOS', 'DISCWT', 'NDX', 'NPR', 'AMONTH', 'AWEEKEND', 'DRG']
for col in numeric_cols:
    if col in df_core.columns:
        df_core[col] = pd.to_numeric(df_core[col], errors='coerce')

# Create derived variables
df_core['AGE_GROUP'] = pd.cut(df_core['AGE'], 
                               bins=[0, 18, 40, 65, 80, 120],
                               labels=['0-17', '18-39', '40-64', '65-79', '80+'])

df_core['SEX'] = df_core['FEMALE'].map({0: 'Male', 1: 'Female'})

# Merge with hospital data if possible
if 'HOSP_NIS' in df_core.columns and 'HOSP_NIS' in df_hospital.columns:
    df_merged = df_core.merge(df_hospital, on='HOSP_NIS', how='left')
    print("   Merged with hospital data")
else:
    df_merged = df_core

# Filter valid data
df_merged = df_merged[df_merged['AGE'].notna() & (df_merged['AGE'] >= 0) & (df_merged['AGE'] <= 100)]
print(f"   Valid data rows: {len(df_merged):,}")

# ============================================
# Generate Visualizations
# ============================================

# 1. Age Distribution
print("\n📊 1. Creating Age Distribution Plot...")
fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# Histogram
axes[0].hist(df_merged['AGE'], bins=50, edgecolor='black', alpha=0.7, color='steelblue')
axes[0].set_xlabel('Age (years)', fontsize=12)
axes[0].set_ylabel('Number of Discharges', fontsize=12)
axes[0].set_title('Age Distribution of Hospital Discharges', fontsize=14, fontweight='bold')
axes[0].grid(True, alpha=0.3)

# Box plot
axes[1].boxplot(df_merged['AGE'], vert=True)
axes[1].set_ylabel('Age (years)', fontsize=12)
axes[1].set_title('Age Distribution (Box Plot)', fontsize=14, fontweight='bold')
axes[1].grid(True, alpha=0.3)

plt.tight_layout()
plt.savefig(os.path.join(FIG_DIR, 'age_distribution.png'), dpi=150, bbox_inches='tight')
plt.close()
print(f"   ✓ Saved: age_distribution.png")

# 2. Mortality by Age Group
print("\n📊 2. Creating Mortality by Age Plot...")
mortality_by_age = df_merged.groupby('AGE_GROUP', observed=False).agg({
    'DIED': ['mean', 'count']
}).round(4)
mortality_by_age.columns = ['mortality_rate', 'n_patients']
mortality_by_age['mortality_pct'] = mortality_by_age['mortality_rate'] * 100
mortality_by_age = mortality_by_age.dropna()

if len(mortality_by_age) > 0:
    fig, ax = plt.subplots(figsize=(10, 6))
    bars = ax.bar(range(len(mortality_by_age)), mortality_by_age['mortality_pct'], 
                  color='coral', edgecolor='black', alpha=0.7)
    ax.set_xticks(range(len(mortality_by_age)))
    ax.set_xticklabels(mortality_by_age.index, rotation=45, ha='right')
    ax.set_xlabel('Age Group', fontsize=12)
    ax.set_ylabel('In-Hospital Mortality Rate (%)', fontsize=12)
    ax.set_title('Mortality Rate by Age Group', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3, axis='y')
    
    for bar, rate in zip(bars, mortality_by_age['mortality_pct']):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.1,
                f'{rate:.1f}%', ha='center', va='bottom', fontsize=10)
    
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'mortality_by_age.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: mortality_by_age.png")

# 3. Length of Stay Distribution
print("\n📊 3. Creating Length of Stay Plot...")
los_valid = df_merged[df_merged['LOS'].notna() & (df_merged['LOS'] > 0) & (df_merged['LOS'] <= 30)]

if len(los_valid) > 0:
    fig, axes = plt.subplots(1, 2, figsize=(14, 5))
    
    # Histogram
    axes[0].hist(los_valid['LOS'], bins=30, edgecolor='black', alpha=0.7, color='steelblue')
    axes[0].set_xlabel('Length of Stay (days)', fontsize=12)
    axes[0].set_ylabel('Number of Discharges', fontsize=12)
    axes[0].set_title('Length of Stay Distribution (0-30 days)', fontsize=14, fontweight='bold')
    axes[0].grid(True, alpha=0.3)
    
    # Box plot
    los_all = df_merged[df_merged['LOS'].notna() & (df_merged['LOS'] > 0) & (df_merged['LOS'] <= 100)]
    axes[1].boxplot(los_all['LOS'], vert=True)
    axes[1].set_ylabel('Length of Stay (days)', fontsize=12)
    axes[1].set_title('Length of Stay Distribution (Box Plot)', fontsize=14, fontweight='bold')
    axes[1].grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'los_distribution.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: los_distribution.png")

# 4. Gender Distribution
print("\n📊 4. Creating Gender Distribution Plot...")
gender_counts = df_merged['SEX'].value_counts()

if len(gender_counts) > 0:
    fig, ax = plt.subplots(figsize=(8, 6))
    colors = ['#FF9999', '#66B2FF']
    wedges, texts, autotexts = ax.pie(gender_counts.values, labels=gender_counts.index, 
                                        autopct='%1.1f%%', colors=colors, startangle=90,
                                        textprops={'fontsize': 12})
    ax.set_title('Gender Distribution of Hospital Discharges', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'gender_distribution.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: gender_distribution.png")

# 5. Mortality by Gender
print("\n📊 5. Creating Mortality by Gender Plot...")
mortality_gender = df_merged.groupby('SEX')['DIED'].mean() * 100

if len(mortality_gender) > 0:
    fig, ax = plt.subplots(figsize=(8, 6))
    bars = ax.bar(mortality_gender.index, mortality_gender.values, 
                  color=['#FF9999', '#66B2FF'], edgecolor='black', alpha=0.7)
    ax.set_xlabel('Gender', fontsize=12)
    ax.set_ylabel('Mortality Rate (%)', fontsize=12)
    ax.set_title('In-Hospital Mortality by Gender', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3, axis='y')
    
    for bar, rate in zip(bars, mortality_gender.values):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.05,
                f'{rate:.2f}%', ha='center', va='bottom', fontsize=10)
    
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'mortality_by_gender.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: mortality_by_gender.png")

# 6. Seasonal Variation
print("\n📊 6. Creating Seasonal Variation Plot...")
if 'AMONTH' in df_merged.columns:
    monthly_data = df_merged[df_merged['AMONTH'].notna() & (df_merged['AMONTH'] >= 1) & (df_merged['AMONTH'] <= 12)]
    monthly_counts = monthly_data.groupby('AMONTH').size()
    
    if len(monthly_counts) == 12:
        month_names = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                       'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        
        fig, ax = plt.subplots(figsize=(12, 5))
        ax.plot(month_names, monthly_counts.values, marker='o', linewidth=2, markersize=8, color='steelblue')
        ax.set_xlabel('Month', fontsize=12)
        ax.set_ylabel('Number of Discharges', fontsize=12)
        ax.set_title('Seasonal Variation in Hospital Admissions', fontsize=14, fontweight='bold')
        ax.grid(True, alpha=0.3)
        plt.tight_layout()
        plt.savefig(os.path.join(FIG_DIR, 'seasonal_variation.png'), dpi=150, bbox_inches='tight')
        plt.close()
        print(f"   ✓ Saved: seasonal_variation.png")

# 7. Weekend vs Weekday Admissions
print("\n📊 7. Creating Weekend vs Weekday Plot...")
if 'AWEEKEND' in df_merged.columns:
    weekend_data = df_merged['AWEEKEND'].map({0: 'Weekday', 1: 'Weekend'}).value_counts()
    
    fig, ax = plt.subplots(figsize=(7, 7))
    colors = ['#99FF99', '#FF9999']
    wedges, texts, autotexts = ax.pie(weekend_data.values, labels=weekend_data.index,
                                        autopct='%1.1f%%', colors=colors, startangle=90)
    ax.set_title('Weekend vs Weekday Admissions', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'weekend_admissions.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: weekend_admissions.png")

# 8. Correlation Heatmap
print("\n📊 8. Creating Correlation Heatmap...")
corr_vars = ['AGE', 'LOS', 'DIED', 'NDX', 'NPR']
available_vars = [v for v in corr_vars if v in df_merged.columns and df_merged[v].notna().sum() > 0]
if len(available_vars) >= 2:
    corr_data = df_merged[available_vars].dropna()
    if len(corr_data) > 0:
        correlation_matrix = corr_data.corr()
        
        fig, ax = plt.subplots(figsize=(10, 8))
        im = ax.imshow(correlation_matrix, cmap='coolwarm', vmin=-1, vmax=1)
        ax.set_xticks(range(len(correlation_matrix.columns)))
        ax.set_yticks(range(len(correlation_matrix.columns)))
        ax.set_xticklabels(correlation_matrix.columns, rotation=45, ha='right')
        ax.set_yticklabels(correlation_matrix.columns)
        plt.colorbar(im, ax=ax, label='Correlation Coefficient')
        ax.set_title('Correlation Matrix of Key Variables', fontsize=14, fontweight='bold')
        
        for i in range(len(correlation_matrix.columns)):
            for j in range(len(correlation_matrix.columns)):
                ax.text(j, i, f'{correlation_matrix.iloc[i, j]:.2f}',
                       ha="center", va="center", color="black", fontsize=9)
        
        plt.tight_layout()
        plt.savefig(os.path.join(FIG_DIR, 'correlation_heatmap.png'), dpi=150, bbox_inches='tight')
        plt.close()
        print(f"   ✓ Saved: correlation_heatmap.png")

# 9. LOS by Age Group (Boxplot)
print("\n📊 9. Creating LOS by Age Group Plot...")
los_age_data = df_merged[df_merged['AGE_GROUP'].notna() & df_merged['LOS'].notna() & (df_merged['LOS'] <= 30)]
if len(los_age_data) > 0:
    fig, ax = plt.subplots(figsize=(12, 6))
    los_age_data.boxplot(column='LOS', by='AGE_GROUP', ax=ax)
    ax.set_xlabel('Age Group', fontsize=12)
    ax.set_ylabel('Length of Stay (days)', fontsize=12)
    ax.set_title('Length of Stay Distribution by Age Group', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3)
    plt.suptitle('')
    plt.tight_layout()
    plt.savefig(os.path.join(FIG_DIR, 'los_by_age.png'), dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: los_by_age.png")

# 10. Top DRGs
print("\n📊 10. Creating Top DRGs Plot...")
if 'DRG' in df_merged.columns:
    drg_data = df_merged[df_merged['DRG'].notna() & (df_merged['DRG'] > 0)]
    if len(drg_data) > 0:
        top_drgs = drg_data['DRG'].value_counts().head(10)
        
        fig, ax = plt.subplots(figsize=(12, 6))
        bars = ax.barh(range(len(top_drgs)), top_drgs.values, color='steelblue', edgecolor='black')
        ax.set_yticks(range(len(top_drgs)))
        ax.set_yticklabels(top_drgs.index.astype(int))
        ax.set_xlabel('Number of Discharges', fontsize=12)
        ax.set_ylabel('DRG Code', fontsize=12)
        ax.set_title('Top 10 DRGs by Discharge Volume', fontsize=14, fontweight='bold')
        ax.invert_yaxis()
        ax.grid(True, alpha=0.3, axis='x')
        
        for i, (bar, count) in enumerate(zip(bars, top_drgs.values)):
            ax.text(bar.get_width() + 10, bar.get_y() + bar.get_height()/2,
                    f'{count:,}', ha='left', va='center', fontsize=9)
        
        plt.tight_layout()
        plt.savefig(os.path.join(FIG_DIR, 'top_drgs.png'), dpi=150, bbox_inches='tight')
        plt.close()
        print(f"   ✓ Saved: top_drgs.png")

# Print summary statistics
print("\n" + "=" * 70)
print("SUMMARY STATISTICS")
print("=" * 70)
print(f"\nTotal discharges in sample: {len(df_merged):,}")
print(f"Mean age: {df_merged['AGE'].mean():.1f} years")
print(f"Median age: {df_merged['AGE'].median():.0f} years")
print(f"Female: {df_merged['FEMALE'].mean()*100:.1f}%")
print(f"Mortality: {df_merged['DIED'].mean()*100:.2f}%")
print(f"Mean LOS: {df_merged['LOS'].mean():.1f} days")
print(f"Median LOS: {df_merged['LOS'].median():.0f} days")

# Create a simple HTML report
print("\n📄 Creating HTML report...")
report_path = os.path.join(FIG_DIR, "report.html")
with open(report_path, 'w') as f:
    f.write(f"""<!DOCTYPE html>
<html>
<head><title>NIS 2023 Visualization Report</title>
<style>
body {{ font-family: Arial, sans-serif; margin: 20px; }}
h1 {{ color: #2c3e50; }}
.gallery {{ display: grid; grid-template-columns: repeat(auto-fit, minmax(500px, 1fr)); gap: 20px; }}
.figure {{ border: 1px solid #ddd; padding: 10px; border-radius: 5px; }}
.figure img {{ width: 100%; height: auto; }}
.stats {{ background: #f0f0f0; padding: 15px; border-radius: 5px; margin-bottom: 20px; }}
</style>
</head>
<body>
<h1>NIS 2023 Hospital Discharge Data - Visualization Report</h1>
<div class="stats">
<h2>Summary Statistics (Sample: {len(df_merged):,} discharges)</h2>
<p><strong>Mean age:</strong> {df_merged['AGE'].mean():.1f} years</p>
<p><strong>Female:</strong> {df_merged['FEMALE'].mean()*100:.1f}%</p>
<p><strong>Mortality rate:</strong> {df_merged['DIED'].mean()*100:.2f}%</p>
<p><strong>Mean LOS:</strong> {df_merged['LOS'].mean():.1f} days</p>
</div>
<div class="gallery">
<div class="figure"><h3>Age Distribution</h3><img src="age_distribution.png"></div>
<div class="figure"><h3>Mortality by Age</h3><img src="mortality_by_age.png"></div>
<div class="figure"><h3>Length of Stay</h3><img src="los_distribution.png"></div>
<div class="figure"><h3>Gender Distribution</h3><img src="gender_distribution.png"></div>
<div class="figure"><h3>Mortality by Gender</h3><img src="mortality_by_gender.png"></div>
<div class="figure"><h3>Seasonal Variation</h3><img src="seasonal_variation.png"></div>
<div class="figure"><h3>Weekend vs Weekday</h3><img src="weekend_admissions.png"></div>
<div class="figure"><h3>Correlation Heatmap</h3><img src="correlation_heatmap.png"></div>
<div class="figure"><h3>LOS by Age</h3><img src="los_by_age.png"></div>
<div class="figure"><h3>Top DRGs</h3><img src="top_drgs.png"></div>
</div>
</body>
</html>""")
print(f"   ✓ HTML report saved: {report_path}")

print("\n" + "=" * 70)
print("✅ VISUALIZATION COMPLETE!")
print("=" * 70)
print(f"\n📁 All figures saved in: {FIG_DIR}/")
print(f"\n🌐 To view the HTML report:")
print(f"   firefox {report_path}")
print(f"   or start a web server: cd {FIG_DIR} && python3 -m http.server 8000")