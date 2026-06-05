#!/usr/bin/env python3
"""
Visualize NIS 2023 data directly from DuckDB - FIXED VERSION
"""

import duckdb
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

# Set style
plt.style.use('seaborn-v0_8-darkgrid')
sns.set_palette("husl")

# Connect to DuckDB
con = duckdb.connect('/home/ashim/emily/HCUP data/nis2023.duckdb')

print("=" * 70)
print("NIS 2023 Data Visualization")
print("=" * 70)

# Create output directory for figures
import os
fig_dir = "/home/ashim/emily/HCUP data/figures"
os.makedirs(fig_dir, exist_ok=True)

# 1. Age Distribution
print("\n📊 Creating Age Distribution Plot...")
age_data = con.execute("""
    SELECT 
        CAST(AGE AS INTEGER) as age,
        COUNT(*) as count
    FROM merged
    WHERE AGE IS NOT NULL 
      AND AGE != '' 
      AND CAST(AGE AS INTEGER) BETWEEN 0 AND 100
    GROUP BY age
    ORDER BY age
""").fetchdf()

if len(age_data) > 0:
    fig, axes = plt.subplots(1, 2, figsize=(14, 5))
    
    # Histogram
    axes[0].hist(age_data['age'], weights=age_data['count'], bins=50, edgecolor='black', alpha=0.7)
    axes[0].set_xlabel('Age (years)')
    axes[0].set_ylabel('Number of Discharges')
    axes[0].set_title('Age Distribution of Hospital Discharges')
    axes[0].grid(True, alpha=0.3)
    
    # Box plot
    age_stats = con.execute("""
        SELECT CAST(AGE AS INTEGER) as age FROM merged
        WHERE AGE IS NOT NULL AND AGE != '' AND CAST(AGE AS INTEGER) BETWEEN 0 AND 100
    """).fetchdf()
    axes[1].boxplot(age_stats['age'], vert=True)
    axes[1].set_ylabel('Age (years)')
    axes[1].set_title('Age Distribution (Box Plot)')
    axes[1].grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/age_distribution.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/age_distribution.png")
else:
    print("   ⚠️ No age data available")

# 2. Mortality by Age Group (FIXED)
print("\n📊 Creating Mortality by Age Plot...")
mortality_data = con.execute("""
    SELECT 
        CASE 
            WHEN CAST(AGE AS INTEGER) BETWEEN 0 AND 17 THEN '0-17'
            WHEN CAST(AGE AS INTEGER) BETWEEN 18 AND 39 THEN '18-39'
            WHEN CAST(AGE AS INTEGER) BETWEEN 40 AND 64 THEN '40-64'
            WHEN CAST(AGE AS INTEGER) BETWEEN 65 AND 79 THEN '65-79'
            WHEN CAST(AGE AS INTEGER) >= 80 THEN '80+'
            ELSE 'Unknown'
        END as age_group,
        ROUND(100 * AVG(CAST(DIED AS INTEGER)), 2) as mortality_rate,
        COUNT(*) as n_patients
    FROM merged
    WHERE AGE IS NOT NULL AND AGE != '' AND DIED IS NOT NULL
    GROUP BY age_group
    HAVING age_group != 'Unknown'
    ORDER BY 
        CASE age_group
            WHEN '0-17' THEN 1
            WHEN '18-39' THEN 2
            WHEN '40-64' THEN 3
            WHEN '65-79' THEN 4
            WHEN '80+' THEN 5
        END
""").fetchdf()

if len(mortality_data) > 0:
    fig, ax = plt.subplots(figsize=(10, 6))
    bars = ax.bar(mortality_data['age_group'].astype(str), mortality_data['mortality_rate'], 
                  color='coral', edgecolor='black', alpha=0.7)
    ax.set_xlabel('Age Group', fontsize=12)
    ax.set_ylabel('In-Hospital Mortality Rate (%)', fontsize=12)
    ax.set_title('Mortality Rate by Age Group', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3, axis='y')
    
    # Add value labels on bars
    for bar, rate in zip(bars, mortality_data['mortality_rate']):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.1,
                f'{rate}%', ha='center', va='bottom', fontsize=10)
    
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/mortality_by_age.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/mortality_by_age.png")
else:
    print("   ⚠️ No mortality data available")

# 3. Length of Stay Distribution
print("\n📊 Creating Length of Stay Plot...")
los_data = con.execute("""
    SELECT 
        CAST(LOS AS INTEGER) as los,
        COUNT(*) as count
    FROM merged
    WHERE LOS IS NOT NULL 
      AND LOS != '' 
      AND CAST(LOS AS INTEGER) <= 30
      AND CAST(LOS AS INTEGER) > 0
    GROUP BY los
    ORDER BY los
""").fetchdf()

if len(los_data) > 0:
    fig, axes = plt.subplots(1, 2, figsize=(14, 5))
    
    # Histogram
    axes[0].bar(los_data['los'], los_data['count'], edgecolor='black', alpha=0.7)
    axes[0].set_xlabel('Length of Stay (days)')
    axes[0].set_ylabel('Number of Discharges')
    axes[0].set_title('Length of Stay Distribution (0-30 days)')
    axes[0].grid(True, alpha=0.3)
    
    # Box plot (log scale for better visualization)
    los_stats = con.execute("""
        SELECT CAST(LOS AS INTEGER) as los FROM merged
        WHERE LOS IS NOT NULL AND LOS != '' AND CAST(LOS AS INTEGER) > 0 AND CAST(LOS AS INTEGER) <= 100
    """).fetchdf()
    axes[1].boxplot(los_stats['los'], vert=True)
    axes[1].set_ylabel('Length of Stay (days)')
    axes[1].set_title('Length of Stay Distribution (Box Plot)')
    axes[1].set_yscale('log')
    axes[1].grid(True, alpha=0.3)
    
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/los_distribution.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/los_distribution.png")
else:
    print("   ⚠️ No LOS data available")

# 4. Gender Distribution
print("\n📊 Creating Gender Distribution Plot...")
gender_data = con.execute("""
    SELECT 
        CASE WHEN CAST(FEMALE AS INTEGER) = 1 THEN 'Female' ELSE 'Male' END as gender,
        COUNT(*) as count,
        ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) as percentage
    FROM merged
    WHERE FEMALE IS NOT NULL AND FEMALE != ''
    GROUP BY gender
""").fetchdf()

if len(gender_data) > 0:
    fig, ax = plt.subplots(figsize=(8, 6))
    colors = ['#FF9999', '#66B2FF']
    wedges, texts, autotexts = ax.pie(gender_data['count'], labels=gender_data['gender'], 
                                        autopct='%1.1f%%', colors=colors, startangle=90,
                                        textprops={'fontsize': 12})
    ax.set_title('Gender Distribution of Hospital Discharges', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/gender_distribution.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/gender_distribution.png")
else:
    print("   ⚠️ No gender data available")

# 5. Seasonal Variation (Admission by Month)
print("\n📊 Creating Seasonal Variation Plot...")
monthly_data = con.execute("""
    SELECT 
        CAST(AMONTH AS INTEGER) as month,
        COUNT(*) as count
    FROM merged
    WHERE AMONTH IS NOT NULL AND AMONTH != '' AND CAST(AMONTH AS INTEGER) BETWEEN 1 AND 12
    GROUP BY month
    ORDER BY month
""").fetchdf()

if len(monthly_data) > 0:
    month_names = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    
    fig, ax = plt.subplots(figsize=(12, 5))
    ax.plot(month_names, monthly_data['count'], marker='o', linewidth=2, markersize=8)
    ax.set_xlabel('Month', fontsize=12)
    ax.set_ylabel('Number of Discharges', fontsize=12)
    ax.set_title('Seasonal Variation in Hospital Admissions', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3)
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/seasonal_variation.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/seasonal_variation.png")
else:
    print("   ⚠️ No monthly data available")

# 6. Weekend vs Weekday Admissions
print("\n📊 Creating Weekend vs Weekday Plot...")
weekend_data = con.execute("""
    SELECT 
        CASE WHEN CAST(AWEEKEND AS INTEGER) = 1 THEN 'Weekend' ELSE 'Weekday' END as day_type,
        COUNT(*) as count,
        ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 1) as percentage
    FROM merged
    WHERE AWEEKEND IS NOT NULL AND AWEEKEND != ''
    GROUP BY day_type
""").fetchdf()

if len(weekend_data) > 0:
    fig, ax = plt.subplots(figsize=(7, 7))
    colors = ['#FF9999', '#99FF99']
    wedges, texts, autotexts = ax.pie(weekend_data['count'], labels=weekend_data['day_type'],
                                        autopct='%1.1f%%', colors=colors, startangle=90)
    ax.set_title('Weekend vs Weekday Admissions', fontsize=14, fontweight='bold')
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/weekend_admissions.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/weekend_admissions.png")
else:
    print("   ⚠️ No weekend data available")

# 7. Correlation Heatmap
print("\n📊 Creating Correlation Heatmap...")
corr_data = con.execute("""
    SELECT 
        CAST(AGE AS INTEGER) as age,
        CAST(LOS AS INTEGER) as los,
        CAST(DIED AS INTEGER) as died,
        CAST(NDX AS INTEGER) as n_dx,
        CAST(NPR AS INTEGER) as n_pr
    FROM merged
    WHERE AGE IS NOT NULL AND LOS IS NOT NULL AND DIED IS NOT NULL
      AND AGE != '' AND LOS != '' AND DIED != ''
    LIMIT 100000
""").fetchdf()

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
    
    # Add correlation values
    for i in range(len(correlation_matrix.columns)):
        for j in range(len(correlation_matrix.columns)):
            text = ax.text(j, i, f'{correlation_matrix.iloc[i, j]:.2f}',
                          ha="center", va="center", color="black", fontsize=9)
    
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/correlation_heatmap.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/correlation_heatmap.png")
else:
    print("   ⚠️ No correlation data available")

# 8. Length of Stay by Age Group (Boxplot)
print("\n📊 Creating LOS by Age Group Plot...")
los_by_age = con.execute("""
    SELECT 
        CASE 
            WHEN CAST(AGE AS INTEGER) BETWEEN 0 AND 17 THEN '0-17'
            WHEN CAST(AGE AS INTEGER) BETWEEN 18 AND 39 THEN '18-39'
            WHEN CAST(AGE AS INTEGER) BETWEEN 40 AND 64 THEN '40-64'
            WHEN CAST(AGE AS INTEGER) BETWEEN 65 AND 79 THEN '65-79'
            WHEN CAST(AGE AS INTEGER) >= 80 THEN '80+'
        END as age_group,
        CAST(LOS AS INTEGER) as los
    FROM merged
    WHERE AGE IS NOT NULL AND LOS IS NOT NULL 
      AND AGE != '' AND LOS != ''
      AND CAST(LOS AS INTEGER) > 0 AND CAST(LOS AS INTEGER) <= 30
""").fetchdf()

if len(los_by_age) > 0:
    # Remove None values
    los_by_age = los_by_age.dropna()
    
    fig, ax = plt.subplots(figsize=(12, 6))
    los_by_age.boxplot(column='los', by='age_group', ax=ax)
    ax.set_xlabel('Age Group', fontsize=12)
    ax.set_ylabel('Length of Stay (days)', fontsize=12)
    ax.set_title('Length of Stay Distribution by Age Group', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3)
    plt.suptitle('')  # Remove default title
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/los_by_age.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/los_by_age.png")
else:
    print("   ⚠️ No LOS by age data available")

# 9. Discharge Disposition
print("\n📊 Creating Discharge Disposition Plot...")
discharge_data = con.execute("""
    SELECT 
        DISPUNIFORM,
        COUNT(*) as count
    FROM merged
    WHERE DISPUNIFORM IS NOT NULL AND DISPUNIFORM != ''
    GROUP BY DISPUNIFORM
    ORDER BY count DESC
    LIMIT 6
""").fetchdf()

if len(discharge_data) > 0:
    # Map discharge codes to names
    discharge_map = {
        '1': 'Routine', '2': 'Short-term hospital', '3': 'Skilled nursing facility',
        '4': 'Intermediate care', '5': 'Another type of facility', '6': 'Home health care',
        '7': 'Against medical advice', '20': 'Died', '99': 'Other'
    }
    discharge_data['disposition'] = discharge_data['DISPUNIFORM'].map(discharge_map)
    discharge_data['disposition'] = discharge_data['disposition'].fillna('Other')
    
    fig, ax = plt.subplots(figsize=(10, 6))
    bars = ax.barh(discharge_data['disposition'], discharge_data['count'], 
                   color='lightgreen', edgecolor='black', alpha=0.7)
    ax.set_xlabel('Number of Discharges', fontsize=12)
    ax.set_ylabel('Discharge Disposition', fontsize=12)
    ax.set_title('Patient Discharge Disposition', fontsize=14, fontweight='bold')
    ax.grid(True, alpha=0.3, axis='x')
    
    plt.tight_layout()
    plt.savefig(f'{fig_dir}/discharge_disposition.png', dpi=150, bbox_inches='tight')
    plt.close()
    print(f"   ✓ Saved: {fig_dir}/discharge_disposition.png")
else:
    print("   ⚠️ No discharge data available")

print("\n" + "=" * 70)
print("✅ VISUALIZATION COMPLETE!")
print("=" * 70)
print(f"\n📁 All figures saved in: {fig_dir}/")
print("\nGenerated visualizations:")
print("  1. age_distribution.png")
print("  2. mortality_by_age.png")
print("  3. los_distribution.png")
print("  4. gender_distribution.png")
print("  5. seasonal_variation.png")
print("  6. weekend_admissions.png")
print("  7. correlation_heatmap.png")
print("  8. los_by_age.png")
print("  9. discharge_disposition.png")