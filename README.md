# The Open Core Atlas

The first systematic benchmark of how commercial open source companies price, license, and gate features. Built from public data, written for founders, VCs, and engineering leaders making open core decisions.

---

## What this is

The Open Core Atlas tracks commercial open source software (COSS) companies across seven dimensions: identity, license, commercial model, pricing, feature gating, GitHub velocity, and strategic signals.

The first edition (Free Preview) covers **30 representative companies across 10 categories**. Future editions will expand to 200+ companies.

## Why this exists

License relicensing has accelerated since 2018 and entered a new wave in 2023-2024. AI infrastructure OSS is exploding. Public empirical data is fragmented across investor blog posts, podcast interviews, vendor lead-magnet reports, and academic papers.

There is no canonical reference for how COSS companies actually structure pricing, gate features, or evolve licenses over time.

This Atlas is an attempt to fix that — built from public data, with full source citations, under a CC-BY-4.0 license.

## What's in this repo

| Path | Purpose |
|---|---|
| `data/companies/*.json` | One file per company (30 in v0.1). Canonical record. |
| `data/companies.csv` | Flat CSV derivative for spreadsheet users (verified records only). |
| `data/sources.csv` | Citations index linking every atomic claim to a public source. |
| `schema/company.schema.json` | JSON Schema validator for company records. |
| `schema/controlled-vocabularies.yaml` | All enums + their definitions. |
| `analysis/h*.md` | One writeup per hypothesis (7 total). |
| `visualizations/*.svg` | One chart per hypothesis. |
| `scripts/` | Validation, CSV derivation, GitHub stats utilities. |
| `templates/` | Per-company research template. |
| `METHODOLOGY.md` | Selection criteria, taxonomy, source rules, limitations. |
| `HYPOTHESES.md` | The 7 testable hypotheses. |
| `CHANGELOG.md` | Versioned changes to the dataset. |

## How to use this dataset

The dataset is licensed **CC-BY-4.0**. Use it in research, blog posts, decks, talks, or commercial work — please cite as:

> Atlas Research (2026). The Open Core Atlas: Free Preview Edition. https://github.com/atlas-research/open-core-atlas

For academic citation, see `CITATION.cff`.

## Methodology in one paragraph

Companies were selected to balance category representation, funding stage diversity, and license type diversity. Data was collected only from public sources: company websites, GitHub repositories, SEC filings, press releases, public podcast interviews, and Wayback Machine snapshots. **No private interviews, no NDA-restricted data, no insider claims.** Every atomic claim links to a source URL with the date accessed. See `METHODOLOGY.md` for full detail.

## Status

**v0.1.0-preview** — Inaugural edition. Data collection in progress. 30 company stubs created; full population planned across 6 weeks.

## Contributing

The Atlas welcomes corrections and additions. Open a PR with:
- The corrected/added data in the appropriate `data/companies/*.json` file
- Sources for every changed field added to `data/sources.csv`
- A short rationale in the PR description

CI runs schema validation on every PR. PRs that don't validate cannot merge.

## Get the Free Preview report

The Free Preview report (analysis + visualizations + downloadable dataset) is delivered via email at https://opencoreatlas.com.

## Contact

Atlas Research — `hello@opencoreatlas.com`
