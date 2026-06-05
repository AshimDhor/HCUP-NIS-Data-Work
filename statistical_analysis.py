#!/usr/bin/env python3
"""
Complete Statistical Analysis for NIS 2023 Data - FIXED VERSION
For high-impact journal publication
"""

import pandas as pd
import numpy as np
import scipy.stats as stats
from scipy.stats import chi2_contingency, ttest_ind, f_oneway
import statsmodels.api as sm
from statsmodels.formula.api import logit
import warnings
warnings.filterwarnings('ignore')

import glob
import os

# Configuration
BASE_DIR = "/home/ashim/emily/HCUP data"
PARQUET_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")
RESULTS_DIR = os.path.join(BASE_DIR, "analysis_results")
os.makedirs(RESULTS_DIR, exist_ok=True)

print("=" * 80)
print("NIS 2023 STATISTICAL ANALYSIS FOR PUBLICATION")
print("=" * 80)

# ============================================
# 1. LOAD DATA
# ============================================

print("\n📂 Loading data...")

def load_data(chunks=10):
    """Load and merge data from parquet files"""
    # Load core
    core_files = sorted(glob.glob(os.path.join(PARQUET_DIR, "core", "*.parquet")))[:chunks]
    df_list = []
    for f in core_files:
        df_list.append(pd.read_parquet(f))
    df = pd.concat(df_list, ignore_index=True)
    
    # Load hospital
    hosp_files = glob.glob(os.path.join(PARQUET_DIR, "hospital", "*.parquet"))
    if hosp_files:
        df_hosp = pd.read_parquet(hosp_files[0])
        # Merge if HOSP_NIS exists in both
        if 'HOSP_NIS' in df.columns and 'HOSP_NIS' in df_hosp.columns:
            df = df.merge(df_hosp, on='HOSP_NIS', how='left')
    
    return df

# Load data (adjust chunks based on your RAM)
df = load_data(chunks=15)  # ~1.5 million rows
print(f"✅ Loaded {len(df):,} rows with {len(df.columns)} columns")

# ============================================
# 2. CHECK AVAILABLE COLUMNS
# ============================================

print("\n📋 Available columns for analysis:")
key_cols = ['AGE', 'FEMALE', 'DIED', 'LOS', 'DISCWT', 'AMONTH', 'AWEEKEND', 
            'DRG', 'ZIPINC_QRTL', 'PAY1', 'HOSP_LOCTEACH', 'HOSP_BEDSIZE']
available_cols = [col for col in key_cols if col in df.columns]
for col in available_cols:
    print(f"  ✓ {col}")

# ============================================
# 3. DATA CLEANING AND PREPARATION
# ============================================

print("\n🔄 Preparing data for analysis...")

# Convert to numeric
for col in available_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Create derived variables
df['AGE_GROUP'] = pd.cut(df['AGE'], bins=[0, 18, 40, 65, 80, 120], 
                          labels=['0-17', '18-39', '40-64', '65-79', '80+'])

df['SEX'] = df['FEMALE'].map({0: 'Male', 1: 'Female'})

if 'ZIPINC_QRTL' in df.columns:
    df['INCOME_GROUP'] = df['ZIPINC_QRTL'].map({1: 'Q1 (Lowest)', 2: 'Q2', 
                                                 3: 'Q3', 4: 'Q4 (Highest)'})

if 'PAY1' in df.columns:
    df['PAYER'] = df['PAY1'].map({1: 'Medicare', 2: 'Medicaid', 3: 'Private',
                                  4: 'Self-pay', 5: 'No charge', 6: 'Other'})

if 'HOSP_LOCTEACH' in df.columns:
    df['TEACHING'] = df['HOSP_LOCTEACH'].map({0: 'Rural', 1: 'Urban non-teaching', 
                                               2: 'Urban teaching'})

# Clean data - keep only rows with essential variables
essential_cols = ['AGE', 'FEMALE', 'DIED', 'LOS']
df_clean = df.dropna(subset=essential_cols)
print(f"✅ Clean data: {len(df_clean):,} rows")

# ============================================
# 4. DESCRIPTIVE STATISTICS (TABLE 1 FOR PAPER)
# ============================================

print("\n" + "=" * 80)
print("TABLE 1: DESCRIPTIVE STATISTICS")
print("=" * 80)

# Overall statistics
overall_stats = {
    'N': f"{len(df_clean):,}",
    'Age (mean ± SD)': f"{df_clean['AGE'].mean():.1f} ± {df_clean['AGE'].std():.1f}",
    'Age (median [IQR])': f"{df_clean['AGE'].median():.0f} [{df_clean['AGE'].quantile(0.25):.0f}-{df_clean['AGE'].quantile(0.75):.0f}]",
    'Female (%)': f"{df_clean['FEMALE'].mean()*100:.1f}",
    'Mortality (%)': f"{df_clean['DIED'].mean()*100:.2f}",
    'LOS (mean ± SD)': f"{df_clean['LOS'].mean():.1f} ± {df_clean['LOS'].std():.1f}",
    'LOS (median [IQR])': f"{df_clean['LOS'].median():.0f} [{df_clean['LOS'].quantile(0.25):.0f}-{df_clean['LOS'].quantile(0.75):.0f}]",
}

print("\nOverall Cohort:")
for key, value in overall_stats.items():
    print(f"  {key}: {value}")

# Stratified by Mortality
print("\n" + "-" * 60)
print("Stratified by In-Hospital Mortality:")
print("-" * 60)

survived = df_clean[df_clean['DIED'] == 0]
died = df_clean[df_clean['DIED'] == 1]

print(f"\n                    Survived (n={len(survived):,})     Died (n={len(died):,})")
print("-" * 60)
print(f"Age (years)           {survived['AGE'].mean():.1f} ± {survived['AGE'].std():.1f}        {died['AGE'].mean():.1f} ± {died['AGE'].std():.1f}")
print(f"Female (%)            {survived['FEMALE'].mean()*100:.1f}                    {died['FEMALE'].mean()*100:.1f}")
print(f"LOS (days)            {survived['LOS'].mean():.1f} ± {survived['LOS'].std():.1f}        {died['LOS'].mean():.1f} ± {died['LOS'].std():.1f}")

# ============================================
# 5. COMPARATIVE STATISTICS (T-TESTS)
# ============================================

print("\n" + "=" * 80)
print("COMPARATIVE ANALYSIS")
print("=" * 80)

# T-test for age between survivors and non-survivors
age_survived = survived['AGE'].dropna()
age_died = died['AGE'].dropna()
t_stat, p_value = ttest_ind(age_survived, age_died)
print(f"\n📊 Age difference (survived vs died):")
print(f"   t-statistic: {t_stat:.2f}, p-value: {p_value:.4f} {'(SIGNIFICANT)' if p_value < 0.05 else '(NOT significant)'}")

# T-test for LOS
los_survived = survived['LOS'].dropna()
los_died = died['LOS'].dropna()
t_stat, p_value = ttest_ind(los_survived, los_died)
print(f"\n📊 LOS difference (survived vs died):")
print(f"   t-statistic: {t_stat:.2f}, p-value: {p_value:.4f} {'(SIGNIFICANT)' if p_value < 0.05 else '(NOT significant)'}")

# Chi-square for gender and mortality
contingency = pd.crosstab(df_clean['SEX'], df_clean['DIED'])
chi2, p_value, dof, expected = chi2_contingency(contingency)
print(f"\n📊 Gender and mortality association:")
print(f"   Chi-square: {chi2:.2f}, p-value: {p_value:.4f} {'(SIGNIFICANT)' if p_value < 0.05 else '(NOT significant)'}")
print("\nContingency table:")
print(contingency)

# ============================================
# 6. AGE GROUP ANALYSIS
# ============================================

print("\n" + "=" * 80)
print("AGE GROUP ANALYSIS")
print("=" * 80)

# Mortality by age group
age_group_stats = df_clean.groupby('AGE_GROUP', observed=False).agg({
    'DIED': ['mean', 'count']
}).round(4)
age_group_stats.columns = ['mortality_rate', 'n_patients']
age_group_stats['mortality_pct'] = age_group_stats['mortality_rate'] * 100

print("\nMortality by Age Group:")
print(age_group_stats.to_string())

# Test for trend (correlation between age and mortality)
correlation = df_clean[['AGE', 'DIED']].corr().iloc[0, 1]
print(f"\n📊 Age-mortality correlation: {correlation:.3f}")

# ============================================
# 7. LOGISTIC REGRESSION (MORTALITY PREDICTION)
# ============================================

print("\n" + "=" * 80)
print("LOGISTIC REGRESSION - MORTALITY PREDICTION")
print("=" * 80)

# Prepare data for logistic regression
logit_data = df_clean.dropna(subset=['AGE', 'FEMALE', 'LOS', 'DIED'])
logit_data = logit_data[logit_data['DIED'].isin([0, 1])]

# Create features
logit_data['SEX_Male'] = (logit_data['FEMALE'] == 0).astype(int)

# Define features and target
features = ['AGE', 'LOS', 'SEX_Male']
X = logit_data[features].astype(float)
y = logit_data['DIED'].astype(float)

# Add constant
X = sm.add_constant(X)

# Fit logistic regression
try:
    logit_model = sm.Logit(y, X).fit(disp=0)
    
    print("\nLogistic Regression Results:")
    print("=" * 50)
    print(logit_model.summary().tables[1])
    
    # Odds ratios
    odds_ratios = np.exp(logit_model.params)
    conf_int = np.exp(logit_model.conf_int())
    conf_int.columns = ['2.5%', '97.5%']
    
    print("\nOdds Ratios (95% CI):")
    print("=" * 50)
    results_df = pd.DataFrame({
        'Variable': logit_model.params.index,
        'OR': odds_ratios.values,
        'Lower_CI': conf_int['2.5%'].values,
        'Upper_CI': conf_int['97.5%'].values,
        'P_value': logit_model.pvalues.values
    })
    print(results_df.round(3).to_string(index=False))
    
except Exception as e:
    print(f"   Logistic regression error: {e}")
    results_df = None

# ============================================
# 8. SOCIOECONOMIC DISPARITY ANALYSIS
# ============================================

print("\n" + "=" * 80)
print("SOCIOECONOMIC DISPARITY ANALYSIS")
print("=" * 80)

if 'INCOME_GROUP' in df_clean.columns:
    # Outcomes by income quartile
    income_analysis = df_clean.groupby('INCOME_GROUP', observed=False).agg({
        'DIED': 'mean',
        'LOS': 'mean',
        'AGE': 'mean',
        'FEMALE': 'mean'
    }).round(3)
    
    income_analysis['DIED'] = income_analysis['DIED'] * 100
    income_analysis['FEMALE'] = income_analysis['FEMALE'] * 100
    
    print("\nOutcomes by Income Quartile:")
    print(income_analysis.to_string())
    
    # Test for trend
    income_order = {'Q1 (Lowest)': 1, 'Q2': 2, 'Q3': 3, 'Q4 (Highest)': 4}
    df_clean['INCOME_NUM'] = df_clean['INCOME_GROUP'].map(income_order)
    valid = df_clean.dropna(subset=['INCOME_NUM', 'DIED'])
    if len(valid) > 0:
        correlation = valid[['INCOME_NUM', 'DIED']].corr().iloc[0, 1]
        print(f"\n📊 Income-mortality correlation: {correlation:.3f}")
        print(f"   {'(Higher income associated with lower mortality)' if correlation < 0 else '(Higher income associated with higher mortality)'}")
else:
    print("   Income data not available in this dataset")

# ============================================
# 9. HOSPITAL VARIATION ANALYSIS
# ============================================

print("\n" + "=" * 80)
print("HOSPITAL-LEVEL VARIATION")
print("=" * 80)

if 'TEACHING' in df_clean.columns:
    hospital_analysis = df_clean.groupby('TEACHING', observed=False).agg({
        'DIED': 'mean',
        'LOS': 'mean'
    }).round(3)
    hospital_analysis['DIED'] = hospital_analysis['DIED'] * 100
    print("\nOutcomes by Hospital Teaching Status:")
    print(hospital_analysis.to_string())
    
    # Statistical test
    teaching_groups = df_clean['TEACHING'].dropna().unique()
    if len(teaching_groups) >= 2:
        mortality_by_teaching = [df_clean[df_clean['TEACHING'] == g]['DIED'].dropna().values 
                                 for g in teaching_groups if len(df_clean[df_clean['TEACHING'] == g]) > 0]
        if len(mortality_by_teaching) >= 2:
            f_stat, p_value = f_oneway(*mortality_by_teaching)
            print(f"\n📊 ANOVA - Mortality by teaching status: F={f_stat:.2f}, p={p_value:.4f}")
else:
    print("   Teaching status data not available")

# ============================================
# 10. SEASONAL VARIATION
# ============================================

print("\n" + "=" * 80)
print("SEASONAL VARIATION")
print("=" * 80)

if 'AMONTH' in df_clean.columns:
    monthly_mortality = df_clean.groupby('AMONTH').agg({
        'DIED': 'mean',
        'LOS': 'mean'
    }).round(3)
    monthly_mortality['DIED'] = monthly_mortality['DIED'] * 100
    
    print("\nMortality by Month:")
    print(monthly_mortality.to_string())
    
    # Test for seasonal differences
    monthly_groups = [df_clean[df_clean['AMONTH'] == m]['DIED'].dropna().values 
                      for m in range(1, 13) if len(df_clean[df_clean['AMONTH'] == m]) > 0]
    if len(monthly_groups) >= 2:
        f_stat, p_value = f_oneway(*monthly_groups)
        print(f"\n📊 Seasonal variation in mortality: F={f_stat:.2f}, p={p_value:.4f}")
else:
    print("   Month data not available")

# ============================================
# 11. WEEKEND VS WEEKDAY ANALYSIS
# ============================================

print("\n" + "=" * 80)
print("WEEKEND VS WEEKDAY ADMISSIONS")
print("=" * 80)

if 'AWEEKEND' in df_clean.columns:
    weekend_analysis = df_clean.groupby('AWEEKEND').agg({
        'DIED': 'mean',
        'LOS': 'mean'
    }).round(3)
    weekend_analysis['DIED'] = weekend_analysis['DIED'] * 100
    weekend_analysis.index = ['Weekday', 'Weekend']
    
    print("\nOutcomes by Admission Type:")
    print(weekend_analysis.to_string())
    
    # T-test
    weekday_died = df_clean[df_clean['AWEEKEND'] == 0]['DIED'].dropna()
    weekend_died = df_clean[df_clean['AWEEKEND'] == 1]['DIED'].dropna()
    if len(weekday_died) > 0 and len(weekend_died) > 0:
        t_stat, p_value = ttest_ind(weekday_died, weekend_died)
        print(f"\n📊 Weekend vs Weekday mortality: t={t_stat:.2f}, p={p_value:.4f}")
else:
    print("   Weekend admission data not available")

# ============================================
# 12. SAVE RESULTS FOR PAPER
# ============================================

print("\n" + "=" * 80)
print("SAVING RESULTS")
print("=" * 80)

# Save descriptive statistics
overall_stats_df = pd.DataFrame([overall_stats])
overall_stats_df.to_csv(os.path.join(RESULTS_DIR, "table1_descriptive.csv"), index=False)
print(f"✓ Saved: table1_descriptive.csv")

# Save logistic regression results
if results_df is not None:
    results_df.to_csv(os.path.join(RESULTS_DIR, "logistic_regression.csv"), index=False)
    print(f"✓ Saved: logistic_regression.csv")

# Save age group analysis
age_group_stats.to_csv(os.path.join(RESULTS_DIR, "age_group_analysis.csv"))
print(f"✓ Saved: age_group_analysis.csv")

# Save income disparity analysis
if 'INCOME_GROUP' in df_clean.columns:
    income_analysis.to_csv(os.path.join(RESULTS_DIR, "income_disparity.csv"))
    print(f"✓ Saved: income_disparity.csv")

# Save hospital variation
if 'TEACHING' in df_clean.columns:
    hospital_analysis.to_csv(os.path.join(RESULTS_DIR, "hospital_variation.csv"))
    print(f"✓ Saved: hospital_variation.csv")

# ============================================
# 13. CREATE SUMMARY REPORT
# ============================================

print("\n📄 Creating summary report...")

report_path = os.path.join(RESULTS_DIR, "statistical_report.txt")
with open(report_path, 'w') as f:
    f.write("=" * 80 + "\n")
    f.write("NIS 2023 STATISTICAL ANALYSIS REPORT\n")
    f.write("=" * 80 + "\n\n")
    
    f.write("1. DESCRIPTIVE STATISTICS\n")
    f.write("-" * 40 + "\n")
    for key, value in overall_stats.items():
        f.write(f"   {key}: {value}\n")
    
    f.write("\n2. AGE GROUP MORTALITY\n")
    f.write("-" * 40 + "\n")
    for idx, row in age_group_stats.iterrows():
        f.write(f"   {idx}: {row['mortality_pct']:.2f}% (n={int(row['n_patients']):,})\n")
    
    if results_df is not None:
        f.write("\n3. LOGISTIC REGRESSION - MORTALITY PREDICTORS\n")
        f.write("-" * 40 + "\n")
        for idx, row in results_df.iterrows():
            f.write(f"   {row['Variable']}: OR={row['OR']:.2f} (95% CI: {row['Lower_CI']:.2f}-{row['Upper_CI']:.2f}), p={row['P_value']:.4f}\n")
    
    if 'INCOME_GROUP' in df_clean.columns:
        f.write("\n4. SOCIOECONOMIC DISPARITIES\n")
        f.write("-" * 40 + "\n")
        for idx, row in income_analysis.iterrows():
            f.write(f"   {idx}: Mortality={row['DIED']:.2f}%, LOS={row['LOS']:.1f} days\n")
    
    f.write("\n5. KEY FINDINGS\n")
    f.write("-" * 40 + "\n")
    f.write(f"   ✓ Overall mortality rate: {df_clean['DIED'].mean()*100:.2f}%\n")
    f.write(f"   ✓ Mean age: {df_clean['AGE'].mean():.1f} years\n")
    f.write(f"   ✓ Age-mortality correlation: {correlation:.3f}\n")
    if p_value < 0.05:
        f.write("   ✓ Significant association between age and mortality (p<0.05)\n")

print(f"✓ Saved: statistical_report.txt")

print("\n" + "=" * 80)
print("✅ STATISTICAL ANALYSIS COMPLETE!")
print("=" * 80)
print(f"\n📁 Results saved in: {RESULTS_DIR}/")
print("   - table1_descriptive.csv (Table 1 for paper)")
if results_df is not None:
    print("   - logistic_regression.csv (Multivariable analysis)")
print("   - age_group_analysis.csv (Mortality by age)")
if 'INCOME_GROUP' in df_clean.columns:
    print("   - income_disparity.csv (Socioeconomic disparities)")
if 'TEACHING' in df_clean.columns:
    print("   - hospital_variation.csv (Hospital variation)")
print("   - statistical_report.txt (Summary report)")

print("\n🔑 INTERPRETATION GUIDE:")
print("   - OR > 1: Increased mortality risk")
print("   - OR < 1: Decreased mortality risk")
print("   - p < 0.05: Statistically significant")
print("   - 95% CI: Confidence interval")