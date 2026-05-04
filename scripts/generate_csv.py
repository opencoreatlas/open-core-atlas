#!/usr/bin/env python3
"""Generate companies.csv (flat) from all verified companies/*.json files.

Skips records with status != 'verified' (only published-quality data goes to CSV).
Usage: python scripts/generate_csv.py
"""
import json
import csv
from pathlib import Path

ROOT = Path(__file__).parent.parent
COMPANIES_DIR = ROOT / "data" / "companies"
OUTPUT = ROOT / "data" / "companies.csv"

def flatten(d, prefix=""):
    """Flatten nested dict, dropping internal _-prefixed keys."""
    out = {}
    for k, v in d.items():
        if k.startswith("_") or k == "sources":
            continue  # skip internal/citations
        key = f"{prefix}.{k}" if prefix else k
        if isinstance(v, dict):
            out.update(flatten(v, key))
        elif isinstance(v, list):
            out[key + ".count"] = len(v)
        else:
            out[key] = v
    return out

rows = []
for f in sorted(COMPANIES_DIR.glob("*.json")):
    data = json.loads(f.read_text())
    if data.get("status") != "verified":
        continue
    rows.append(flatten(data))

if not rows:
    print("No verified companies found. CSV not generated.")
    raise SystemExit(0)

fieldnames = sorted({k for r in rows for k in r.keys()})
with open(OUTPUT, "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fieldnames)
    w.writeheader()
    w.writerows(rows)

print(f"Wrote {len(rows)} rows × {len(fieldnames)} fields to {OUTPUT}")
