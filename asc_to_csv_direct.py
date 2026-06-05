#!/usr/bin/env python3
"""
Convert Parquet files to CSV format
Run this AFTER the main conversion is complete
"""

import os
import pandas as pd
import glob
from tqdm import tqdm

# =====================================================
# CONFIGURATION
# =====================================================

BASE_DIR = "/home/ashim/emily/HCUP data"
PARQUET_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")
CSV_OUTPUT_DIR = os.path.join(BASE_DIR, "CSV_OUTPUT")

# Create output directory
os.makedirs(CSV_OUTPUT_DIR, exist_ok=True)

# Which datasets to convert (you can comment out some if needed)
DATASETS = ["core", "severity", "hospital", "dx_pr_grps"]

# CSV options
CSV_OPTIONS = {
    "index": False,           # Don't save row numbers
    "compression": "gzip",    # Compress CSV (creates .csv.gz files)
    "chunksize": 50000        # Process in chunks for memory efficiency
}

# =====================================================
# FUNCTION: Convert a single dataset from Parquet to CSV
# =====================================================

def convert_dataset_to_csv(dataset_name):
    """
    Convert all parquet chunks for a dataset into a single compressed CSV
    """
    print(f"\n{'='*60}")
    print(f"Converting: {dataset_name.upper()}")
    print(f"{'='*60}")
    
    # Find all parquet files for this dataset
    parquet_pattern = os.path.join(PARQUET_DIR, dataset_name, f"{dataset_name}_*.parquet")
    parquet_files = sorted(glob.glob(parquet_pattern))
    
    if not parquet_files:
        print(f"⚠️  No parquet files found for {dataset_name}")
        return
    
    print(f"Found {len(parquet_files)} parquet chunks")
    
    # Output CSV file path (compressed)
    csv_file = os.path.join(CSV_OUTPUT_DIR, f"nis_2023_{dataset_name}.csv.gz")
    
    # Track progress
    total_rows = 0
    first_chunk = True
    
    print(f"Converting to: {csv_file}")
    
    # Process each parquet chunk and write to CSV
    with tqdm(total=len(parquet_files), desc=f"Processing {dataset_name} chunks") as pbar:
        for parquet_file in parquet_files:
            # Read the parquet chunk
            df_chunk = pd.read_parquet(parquet_file)
            
            # Write to CSV
            if first_chunk:
                # Write header for first chunk
                df_chunk.to_csv(
                    csv_file,
                    mode='w',
                    header=True,
                    compression='gzip',
                    index=False
                )
                first_chunk = False
            else:
                # Append without header for subsequent chunks
                df_chunk.to_csv(
                    csv_file,
                    mode='a',
                    header=False,
                    compression='gzip',
                    index=False
                )
            
            total_rows += len(df_chunk)
            pbar.update(1)
            pbar.set_postfix({"rows": f"{total_rows:,}"})
    
    # Get file size
    file_size_mb = os.path.getsize(csv_file) / (1024 * 1024)
    
    print(f"\n✅ Completed {dataset_name}")
    print(f"   Total rows: {total_rows:,}")
    print(f"   File size: {file_size_mb:.2f} MB")
    print(f"   Output: {csv_file}")

# =====================================================
# FUNCTION: Convert and also save as uncompressed CSV (for compatibility)
# =====================================================

def convert_to_uncompressed_csv(dataset_name):
    """
    Convert to uncompressed CSV (larger but more compatible)
    """
    print(f"\nConverting {dataset_name} to uncompressed CSV...")
    
    parquet_pattern = os.path.join(PARQUET_DIR, dataset_name, f"{dataset_name}_*.parquet")
    parquet_files = sorted(glob.glob(parquet_pattern))
    
    if not parquet_files:
        return
    
    csv_file = os.path.join(CSV_OUTPUT_DIR, f"nis_2023_{dataset_name}.csv")
    total_rows = 0
    first_chunk = True
    
    for parquet_file in tqdm(parquet_files, desc=f"{dataset_name}"):
        df_chunk = pd.read_parquet(parquet_file)
        
        if first_chunk:
            df_chunk.to_csv(csv_file, mode='w', header=True, index=False)
            first_chunk = False
        else:
            df_chunk.to_csv(csv_file, mode='a', header=False, index=False)
        
        total_rows += len(df_chunk)
    
    print(f"   {total_rows:,} rows saved to {csv_file}")

# =====================================================
# FUNCTION: Create a sample CSV for quick analysis
# =====================================================

def create_sample_csv(dataset_name, sample_size=10000):
    """
    Create a small sample CSV for quick testing
    """
    print(f"\nCreating sample for {dataset_name}...")
    
    parquet_pattern = os.path.join(PARQUET_DIR, dataset_name, f"{dataset_name}_*.parquet")
    parquet_files = sorted(glob.glob(parquet_pattern))
    
    if not parquet_files:
        return
    
    # Read first few chunks until we have enough samples
    samples = []
    rows_needed = sample_size
    
    for parquet_file in parquet_files:
        df_chunk = pd.read_parquet(parquet_file)
        samples.append(df_chunk.head(rows_needed))
        rows_needed -= len(df_chunk)
        if rows_needed <= 0:
            break
    
    sample_df = pd.concat(samples, ignore_index=True).head(sample_size)
    
    sample_file = os.path.join(CSV_OUTPUT_DIR, f"nis_2023_{dataset_name}_sample.csv")
    sample_df.to_csv(sample_file, index=False)
    
    print(f"   Sample saved: {sample_file} ({len(sample_df):,} rows)")

# =====================================================
# MAIN
# =====================================================

def main():
    print("=" * 60)
    print("Parquet to CSV Converter for HCUP NIS 2023")
    print("=" * 60)
    
    # Check if PARQUET_OUTPUT exists
    if not os.path.exists(PARQUET_DIR):
        print(f"\n❌ Error: Parquet directory not found: {PARQUET_DIR}")
        print("   Please run the main conversion script first.")
        return
    
    # List available datasets
    print("\n📁 Available datasets in PARQUET_OUTPUT:")
    available = []
    for dataset in DATASETS:
        dataset_path = os.path.join(PARQUET_DIR, dataset)
        if os.path.exists(dataset_path):
            parquet_files = glob.glob(os.path.join(dataset_path, f"{dataset}_*.parquet"))
            available.append(dataset)
            print(f"   ✓ {dataset} ({len(parquet_files)} chunks)")
        else:
            print(f"   ✗ {dataset} (not found)")
    
    if not available:
        print("\n❌ No datasets found. Run the conversion script first.")
        return
    
    print("\n" + "=" * 60)
    print("Starting conversion...")
    print("=" * 60)
    
    # Option 1: Convert all datasets to compressed CSV (recommended)
    print("\n📊 Converting to compressed CSV (.csv.gz)...")
    for dataset in available:
        convert_dataset_to_csv(dataset)
    
    # Option 2: Create sample files for quick exploration
    print("\n📊 Creating sample CSV files...")
    for dataset in available:
        create_sample_csv(dataset, sample_size=10000)
    
    # Option 3: Uncompressed CSV (uncomment if needed)
    # print("\n📊 Converting to uncompressed CSV (this will take more space)...")
    # for dataset in available:
    #     convert_to_uncompressed_csv(dataset)
    
    print("\n" + "=" * 60)
    print("✅ ALL CONVERSIONS COMPLETE!")
    print("=" * 60)
    
    # Summary
    print("\n📂 Output directory:", CSV_OUTPUT_DIR)
    print("\n📄 Generated files:")
    for dataset in available:
        compressed_file = os.path.join(CSV_OUTPUT_DIR, f"nis_2023_{dataset}.csv.gz")
        sample_file = os.path.join(CSV_OUTPUT_DIR, f"nis_2023_{dataset}_sample.csv")
        
        if os.path.exists(compressed_file):
            size_mb = os.path.getsize(compressed_file) / (1024 * 1024)
            print(f"   ✓ {dataset}.csv.gz ({size_mb:.1f} MB)")
        if os.path.exists(sample_file):
            print(f"   ✓ {dataset}_sample.csv")
    
    print("\n💡 To load a CSV in Python:")
    print("  import pandas as pd")
    print("  df = pd.read_csv('path/to/file.csv.gz', compression='gzip')")

if __name__ == "__main__":
    main()