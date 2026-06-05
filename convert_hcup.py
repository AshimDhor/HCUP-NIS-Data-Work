import os
import re
import pandas as pd
from tqdm import tqdm

# =====================================================
# CONFIGURATION
# =====================================================

BASE_DIR = "/home/ashim/emily/HCUP data"

FILES = {
    "core": {
        "sas": os.path.join(BASE_DIR,
                           "SAS Load Program",
                           "SASLoad_NIS_2023_Core.SAS"),
        "asc": os.path.join(BASE_DIR,
                           "NIS_2023",
                           "NIS_2023_Core.ASC")
    },
    "severity": {
        "sas": os.path.join(BASE_DIR,
                           "SAS Load Program",
                           "SASLoad_NIS_2023_Severity.SAS"),
        "asc": os.path.join(BASE_DIR,
                           "NIS_2023",
                           "NIS_2023_Severity.ASC")
    },
    "dx_pr_grps": {
        "sas": os.path.join(BASE_DIR,
                           "SAS Load Program",
                           "SASLoad_NIS_2023_DX_PR_GRPS.SAS"),
        "asc": os.path.join(BASE_DIR,
                           "NIS_2023",
                           "NIS_2023_DX_PR_GRPS.ASC")
    },
    "hospital": {
        "sas": os.path.join(BASE_DIR,
                           "SAS Load Program",
                           "SASLoad_NIS_2023_Hospital.SAS"),
        "asc": os.path.join(BASE_DIR,
                           "NIS_2023",
                           "NIS_2023_Hospital.ASC")
    }
}

OUTPUT_DIR = os.path.join(BASE_DIR, "PARQUET_OUTPUT")
os.makedirs(OUTPUT_DIR, exist_ok=True)

CHUNK_SIZE = 100000

# =====================================================
# PARSE SAS INPUT BLOCK
# =====================================================

def get_width(fmt):
    fmt = fmt.upper()
    
    if "$CHAR" in fmt:
        return int(re.findall(r'\$CHAR(\d+)', fmt)[0])
    
    m = re.findall(r'N(\d+)', fmt)
    if m:
        return int(m[0])
    
    return None

def parse_sas_schema(sas_file):
    with open(sas_file, "r", errors="ignore") as f:
        lines = f.readlines()
    
    input_started = False
    starts = []
    names = []
    widths = []
    
    pattern = re.compile(r'@\s*(\d+)\s+([A-Za-z0-9_]+)\s+([^\s;]+)')
    
    for line in lines:
        if "INPUT" in line:
            input_started = True
            continue
        
        if not input_started:
            continue
        
        if ";" in line:
            break
        
        m = pattern.search(line)
        if m:
            start = int(m.group(1))
            name = m.group(2)
            fmt = m.group(3)
            
            width = get_width(fmt)
            if width is None:
                continue
            
            starts.append(start)
            names.append(name)
            widths.append(width)
    
    colspecs = []
    for start, width in zip(starts, widths):
        colspecs.append((start - 1, start - 1 + width))
    
    return names, colspecs

# =====================================================
# CONVERT ONE FILE
# =====================================================

def convert_one(name, asc_file, sas_file):
    print(f"\nProcessing {name}")
    
    names, colspecs = parse_sas_schema(sas_file)
    
    out_dir = os.path.join(OUTPUT_DIR, name)
    os.makedirs(out_dir, exist_ok=True)
    
    reader = pd.read_fwf(
        asc_file,
        colspecs=colspecs,
        names=names,
        chunksize=CHUNK_SIZE,
        dtype=str
    )
    
    count = 0
    
    for chunk in tqdm(reader):
        out_file = os.path.join(out_dir, f"{name}_{count:04d}.parquet")
        chunk.to_parquet(out_file, index=False, engine="pyarrow")
        count += 1
    
    print(f"Finished {name}")

# =====================================================
# MAIN
# =====================================================

def main():
    for dataset_name, paths in FILES.items():
        convert_one(dataset_name, paths["asc"], paths["sas"])
    
    print("\nALL HCUP FILES CONVERTED SUCCESSFULLY")

if __name__ == "__main__":
    main()