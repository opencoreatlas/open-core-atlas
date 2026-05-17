# Grafana Labs — Record Summary (DRAFT)

**Slug:** `grafana`
**Category:** `observability`
**Data collection date:** `2026-05-17`
**Summary written:** `2026-05-17`
**Status:** `in-progress` — **DRAFT, not incorporated to Atlas canon**. Pending: Phase 6 GitHub velocity, browser validation (LICENSE / pricing / customers live page), Wayback snapshot, Day-2 fresh-eye ≥24h before any `status=verified` flip.

> **One-line description:** Open-source observability and data visualization platform — dashboards, metrics, logs, traces — AGPL-3.0 OSS core (Grafana, Loki, Mimir, Tempo) monetized via Grafana Cloud SaaS + Grafana Enterprise self-hosted.

> **Reader caveat:** No claim here is Atlas-canonical until the record flips to `verified`. Several fields carry MEDIUM confidence pre-validation; Phase 6 is partial.

---

## 1. Why this record matters

Fourth Atlas record, second within observability — first opportunity to test category-consistent signals at N=2. Canonical `hybrid` example per the controlled vocabulary (listed alongside MongoDB and Sentry). The Apache-2.0→AGPL-3.0 transition (2021-04-20) takes a structurally distinct path from the three prior license-migration records: copyleft and OSI-approved, not source-available; no per-version conversion mechanism. The record forced calibration of `multi_region_ha` signal across observability and tested the epistemological-wording discipline cristalizada same-day (memory `feedback_epistemological_wording_discipline.md`).

---

## 2. License trajectory

Grafana was first released in January 2014 as a hobby project by Torkel Ödegaard at eBay, published under Apache-2.0. When Raintank Inc. (now Grafana Labs) was incorporated in October 2014 to commercialize the project, Apache-2.0 remained the license for Grafana, Loki, Tempo, and Cortex (precursor to Mimir).

On 2021-04-20, Grafana Labs relicensed Grafana, Loki, and Tempo from Apache-2.0 to AGPL-3.0 in a single coordinated change. The public rationale (CEO Raj Dutt's Q&A blog post, same date) was identical in motivation to the MongoDB SSPL 2018 and Cockroach Labs BSL 2019 moves — cloud providers and competing observability vendors were running unmodified Grafana / Loki / Tempo as managed services without contributing back. AGPL was explicitly chosen over BSL/SSPL/FSL because it preserves OSI-approved Free Software status while triggering copyleft network-distribution obligations on hosted use, forcing managed-service operators to either contribute modifications back or negotiate a commercial Grafana Enterprise license.

Plugins, agents (e.g., `grafana/agent`), and certain libraries remained Apache-2.0 after the relicensing — a deliberate multi-component license heterogeneity analogous to Sentry's SDK/server split. Per METHODOLOGY 7.9 strict definition, this is not `dual_license=true`; it is captured in `metadata.notes`.

No further license changes have occurred since 2021-04-20, so `license_changes_l24m` (cutoff 2024-05-17) is empty.

---

## 3. Commercial model

Grafana Labs operates three parallel commercial offerings: **Grafana OSS** (AGPL-3.0, free self-hosted indefinitely), **Grafana Enterprise** (proprietary self-hosted, sold per-user with annual contracts, USD 25K–150K typical and USD 50–150/user/year per third-party aggregators), and **Grafana Cloud** (managed SaaS with Free, Pro, Advanced tiers). All three streams generate meaningful revenue per Contrary Research and Sacra, placing the company cleanly into `hybrid` per METHODOLOGY 2.1.

`primary_revenue_stream` is captured as `cloud` based on company-stated growth-engine positioning in the 2024-08-21 Series D extension press release ("Grafana Cloud is the primary growth engine") and on the September 2025 milestone announcement (USD 400M+ ARR up from USD 250M in August 2024, with Cloud cited as the driver). Confidence is MEDIUM: Grafana has not publicly disclosed a precise revenue split between Cloud SaaS and Enterprise self-hosted.

Pricing is multi-dimensional. Grafana Cloud Pro carries a USD 19/mo platform fee plus per-billable-series, per-GB-log/trace, and per-active-user usage charges — the canonical `pricing_model=hybrid` structure. The USD 19 entry is the lowest-priced GA cloud tier in the Atlas so far (Sentry USD 26 annual, MongoDB USD 58.40 M10, CockroachDB USD 438 Advanced) — consistent with Grafana's wide-funnel open-core strategy.

---

## 4. Development cadence — interpreted, not listed

**Phase 6 partial — no development-velocity claims valid yet.** Only `stars=70500` captured (WebSearch, MEDIUM confidence pre-browser-validation). `contributors_total`, `contributors_l12m`, `commits_l12m`, `releases_l12m`, and `latest_release` are all `null` pending `./scripts/github_stats.sh grafana/grafana` (`gh` CLI not in cowork sandbox). Per METHODOLOGY 7.20, `commits_l12m` is the canonical cross-record development-activity metric — until it is populated, **this record CANNOT support any cross-record claim about Grafana's development velocity relative to MongoDB / CockroachDB / Sentry**. Star count alone is positioning context, not activity. Phase 6 is the first blocking TODO before any Day-2 sanity flip toward `verified`.

---

## 5. Key methodological decisions

- **Series E rule — `funding_stage=series-d` is "officially confirmed latest round," NOT "latest known market information."** Load-bearing distinction. Secondary sources (Tracxn, SiliconANGLE, The Information) report a Series E USD 250M at USD 9B in Feb/Mar 2026, lead GIC. **No official Grafana press release for the Series E was locatable on grafana.com/press at `data_collection_date`.** Atlas convention: when official primary source is absent, the field reflects the last officially-confirmed event (Series D ext Aug 2024 USD 6B, confirmed by grafana.com/press + TechCrunch + Cooley legal coverage), NOT a synthesis of secondary-source convergence — regardless of how many sources agree. The gap is captured as TODO, not as fact. Candidate METHODOLOGY amendment post-Free-Preview (provisional: "officially-confirmed-vs-market-reported funding events").
- **total_raised_usd=USD 1.09B (pre-E aggregate)** rather than synthesized USD 1.34B. Same logic — no synthesis pre-confirmation.
- **multi_region_ha=oss for Grafana, mirroring Sentry.** Mimir, Loki, Tempo are AGPL-3.0 with built-in horizontally-scalable HA. Self-hosted has unrestricted multi-region freedom; Cloud regions democratized across tiers. Same observability semantic as Sentry: measures HA architecture availability + data residency, not cluster cross-region survival goals.
- **`cla_required=true` triangulated** across grafana.com/docs/grafana/latest/developers/cla/ + cla-assistant.io integration. Distinct from MongoDB (legal-page CLA), CockroachDB (CLA Assistant only), Sentry (no CLA). Grafana combines both legal page AND bot; 2021 license transition explicitly updated CLA to ASF-based.
- **cloud_entry_price_usd_month=19** captured as published Pro platform fee per METHODOLOGY 7.17 (lowest fixed-price paid GA cloud tier); multi-axis usage structure deferred to `pricing_model=hybrid` + `metadata.notes`.
- **`notable_customers` = 5 logos from 2025-09-30 Grafana press release + 5 historical 2022-2023 logos.** Per `feedback_live_page_overrides_stale_pr.md`, 2025 press release wins on conflict; pending Pablo browser-validation of grafana.com/customers live page.

---

## 6. Hypothesis signals (preliminary, N=4 overall / N=2 within observability)

- **H1 license migration:** adds confirming signal. Fourth Atlas record with documented migration motivated by cloud-vendor free-riding; distinct in that the destination license is OSI-approved copyleft (AGPL-3.0) rather than source-available. License-family heterogeneity (copyleft vs source-available among the four migrations) is a candidate sub-hypothesis.
- **H2 hybrid commercial:** adds confirming signal. Canonical `hybrid` example with all three streams (OSS, Enterprise self-hosted, Cloud SaaS) materially active.
- **multi_region_ha by category (candidate hypothesis, unnumbered):** Grafana `oss` matches Sentry `oss`. At N=2 within observability, **tentative category-consistent signal** — explicitly preliminary per post-Sentry sample-size-tagged decision (2026-05-09) and epistemological-wording discipline (2026-05-17). Counter-test plan: next observability record entering the Atlas. Prometheus is the natural candidate; Datadog/New Relic are closed and inadmissible.
- **CLA prevalence (candidate hypothesis, unnumbered):** Three of four Atlas records require a CLA (MongoDB, CockroachDB, Grafana); Sentry explicitly does not (FSL rationale cites avoiding contributor permanent assignment). Too small at N=4 to register; revisit at N=8-10.

---

## 7. Confidence caveats

- **Series E reported but not company-confirmed.** funding_stage and last_valuation_usd would upgrade by one notch each if Pablo locates the official Grafana Labs Series E press release. CONFIDENCE on identity fields is MEDIUM pending that confirmation.
- **GitHub stats partial.** Phase 6 fields (commits_l12m, contributors_l12m, releases_l12m, latest_release) are `null` pending Pablo running `./scripts/github_stats.sh grafana/grafana`. Stars=70500 is captured with MEDIUM confidence (WebSearch only, no direct browser validation).
- **Revenue split between Cloud vs Enterprise self-hosted not disclosed.** primary_revenue_stream='cloud' is the strongest available characterization but is third-party-corroborated, not company-disclosed.
- **LICENSE file content not directly browser-validated.** Same pattern as Sentry/CockroachDB pre-validation MEDIUM. Pablo browser-validation of github.com/grafana/grafana/blob/main/LICENSE would upgrade primary_current confidence from MEDIUM to HIGH.
- **Pricing page snapshot not captured to Wayback.** TODO post-Day-2.

---

## 8. Open verifications (TODO)

- Run `./scripts/github_stats.sh grafana/grafana` for Phase 6 (commits, contributors, releases, latest_release).
- Pablo browser-validate `github.com/grafana/grafana/blob/main/LICENSE` → upgrade primary_current MEDIUM→HIGH.
- Pablo browser-validate `grafana.com/pricing` + Wayback save → persist URL in `data/sources.csv` + `pricing.wayback_snapshots[]`.
- Pablo browser-validate `grafana.com/customers` live page (live-page-overrides-stale-PR rule).
- Locate official Series E press release; if confirmed, upgrade `funding_stage`, `total_raised_usd`, `last_valuation_usd`, `funding_rounds_l24m`.
- Extract commit hash for 2021-04-20 Apache→AGPL transition via local clone of `grafana/grafana`.
- Day-2 fresh-eye review ≥24h before flipping `status=verified`.

---

*Summary v1, 2026-05-17. Per template authoring discipline: written before flipping status to verified, not after.*
