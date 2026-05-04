#!/usr/bin/env python3
"""Validate all company JSON files against the schema.

Usage: python scripts/validate_schema.py
Requires: jsonschema (pip install jsonschema)
"""
import json
import sys
from pathlib import Path

try:
    from jsonschema import Draft202012Validator
except ImportError:
    print("ERROR: jsonschema not installed.")
    print("Install: pip install jsonschema")
    sys.exit(1)

ROOT = Path(__file__).parent.parent
SCHEMA_PATH = ROOT / "schema" / "company.schema.json"
COMPANIES_DIR = ROOT / "data" / "companies"

schema = json.loads(SCHEMA_PATH.read_text())
validator = Draft202012Validator(schema)

errors_total = 0
companies = sorted(COMPANIES_DIR.glob("*.json"))

if not companies:
    print(f"No company files found in {COMPANIES_DIR}")
    sys.exit(1)

for company_file in companies:
    data = json.loads(company_file.read_text())
    errors = list(validator.iter_errors(data))
    if errors:
        errors_total += len(errors)
        print(f"FAIL {company_file.name}")
        for err in errors:
            path = ".".join(str(p) for p in err.absolute_path) or "(root)"
            print(f"  - {path}: {err.message}")
    else:
        status = data.get("status", "unknown")
        print(f"OK   {company_file.name} (status: {status})")

print()
if errors_total:
    print(f"FAILED: {errors_total} validation errors across {len(companies)} files.")
    sys.exit(1)
else:
    print(f"PASSED: all {len(companies)} files valid against schema v{schema.get('properties', {}).get('schema_version', {}).get('const', '?')}.")
