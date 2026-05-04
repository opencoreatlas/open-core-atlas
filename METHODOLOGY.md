# Methodology

This document describes how the Open Core Atlas dataset is built. It is intended for: skeptical readers verifying the data; future contributors adding companies; analysts replicating the work.

---

## 1. Selection criteria

The Free Preview includes 30 companies. They were selected to balance four axes:

### 1.1 Category coverage
Ten categories, three companies each:
- **databases** — Persistent data stores (relational, document, graph, time-series, vector)
- **observability** — Logs, metrics, traces, error tracking
- **devtools** — Developer-facing scheduling, automation, productivity
- **ai-infra** — Model hosting, agent frameworks, ML libraries
- **security** — Authentication, authorization, scanning, runtime security
- **data-pipeline** — ETL, ELT, streaming ingestion, transformation
- **analytics-bi** — Dashboards, exploration, semantic layers
- **workflow-orchestration** — Job scheduling, durable execution, BPMN
- **content-cms** — Headless CMS, blogging platforms
- **niche-emerging** — Notable products not fitting the nine above cleanly

### 1.2 Stage diversity
- ~10 mature/late (post-Series D or IPO)
- ~16 growth (Series A-C)
- ~4 early/indie (Seed or sustainable bootstrapped)

### 1.3 License diversity
- ~15 permissive (Apache, MIT, BSD)
- ~5 copyleft (AGPL, GPL)
- ~9 source-available (BSL, SSPL, FSL, PSAL, SUL, ELv2)
- ~1 dual-license complex

### 1.4 License-change history
At least 9 companies (~30% of sample) have documented license changes during their lifetime. This is intentional — testing Hypothesis 1 (license migration is trend) requires a sample with enough migration events.

### 1.5 Hard exclusion criteria
- Companies whose OSS layer is purely cosmetic (proprietary product with single-file MIT-licensed example code)
- Companies with no commercial revenue stream (pure research foundations)
- Companies where critical data is not publicly available (private with no published revenue indicators or pricing)

### 1.6 Soft exclusion criteria
- Excessively obscure companies (audience must be able to evaluate the analysis)
- Companies in active legal disputes affecting their license interpretation

---

## 2. Taxonomy definitions

### 2.1 commercial_model.type

The most consequential classification. Distinguished as follows:

**`pure-open-core`** — OSS feature-complete for many use cases. Commercial features paid (typically: SSO, RBAC, advanced analytics, audit logs). Self-hosted free version is genuinely usable in production for non-trivial workloads. *Examples: Strapi, Mattermost, Camunda.*

**`hosted-first`** — OSS exists and is genuinely usable, but the company's primary revenue comes from hosted/cloud version. The OSS is real (not a marketing funnel) — but the business is built around hosting. *Examples: Supabase, Cal.com, Plausible.*

**`hybrid`** — OSS + hosted + enterprise tiers all generate meaningful revenue, with multiple parallel commercial offerings. *Examples: Grafana, MongoDB, Sentry.*

**`services-support`** — OSS is feature-complete; revenue comes from services, support, training, certifications. No paid features. *Examples: HashiCorp pre-2023, some Apache Foundation-aligned orgs.*

**`saas-with-oss-marketing`** — The OSS exists but is intentionally limited or works mostly as a lead magnet. The commercial product is the real product. **Distinguished from `hosted-first` by whether the OSS is a real production-grade option** for non-trivial workloads. *Examples: candidates flagged during data collection.*

**Disambiguation rule for hosted-first vs saas-with-oss-marketing:** if a typical user could realistically run the OSS in production for >50% of their use cases without commercial features, it's `hosted-first`. If the OSS would frustrate a real user trying to use it for production, it's `saas-with-oss-marketing`.

### 2.2 funding_stage
- **bootstrapped** — Self-funded, no VC. Includes profitable indie operators.
- **pre-seed / seed** — Pre-major-institutional rounds.
- **series-a / series-b / series-c / series-d / series-e-plus** — Standard VC stages.
- **growth-late** — Late-stage growth without specific round letter (e.g., post-IPO private equity).
- **ipo** — Public on a major exchange.
- **acquired** — Acquired by another company; OSS may continue or be sunset.
- **foundation-nonprofit** — 501(c)(3) or equivalent, not VC-backed.

### 2.3 feature_gating values
- **oss** — Available in OSS version, no commercial gate.
- **commercial** — Only in paid commercial tier.
- **partial** — Basic version in OSS, advanced version in commercial.
- **na** — Feature not applicable to this product type.

### 2.4 License vocabulary
SPDX identifiers are used where available. Non-SPDX source-available licenses use canonical short forms:
- `Apache-2.0`, `MIT`, `BSD-3-Clause`, `GPL-3.0`, `AGPL-3.0` (SPDX)
- `SSPL-1.0`, `BSL-1.1`, `Elastic-2.0` (canonical)
- `FSL-1.1-Apache` (Sentry's Functional Source License with Apache fallback)
- `PSAL-1.0` (PostHog Source Available License)
- `SUL` (n8n Sustainable Use License — non-standard, no version)

When a company offers two licenses concurrently, use composite `License-A+License-B` and set `dual_license: true`.

---

## 3. Source rules

### 3.1 Source types (controlled vocabulary)
Every atomic claim is tagged with its source. Source types include: `company-website`, `company-pricing-page`, `github-license-file`, `github-repo-stats`, `github-releases`, `wayback-machine`, `crunchbase`, `pitchbook`, `sec-filing`, `press-release`, `tech-press`, `linkedin`, `twitter`, `podcast-interview`, `earnings-call-transcript`, `community-post`, `other`.

### 3.2 Cross-source rule
High-stakes claims (funding amounts, valuations, license-change dates) require **at least 2 independent sources**. Both are recorded in `data/sources.csv`.

### 3.3 Trust hierarchy
When sources conflict, this is the priority order:
1. SEC filings (public companies)
2. Direct LICENSE/COPYING file in repo
3. Official press release / company blog
4. Earnings call transcript
5. Tech press from reputable outlets (TechCrunch, Bloomberg, The Information)
6. Crunchbase / Pitchbook
7. Podcast interviews where founder/exec speaks directly
8. LinkedIn (for HQ, employee count)
9. Community posts (HN, Reddit) — used only when corroborating, never as primary

### 3.4 Wayback Machine snapshots
Pricing pages and license files are snapshotted to Wayback Machine **at the time of data collection**. This creates an audit trail and protects against retroactive page edits invalidating the dataset.

### 3.5 No insider claims
The Atlas is built exclusively from public data. Claims that require insider access (revenue figures of private companies, specific deal terms, internal feature gating decisions) are **not included**, even if available informally.

---

## 4. Verification process

Each company record passes through:

1. **Phase 1 — Identity** (founded, HQ, funding)
2. **Phase 2 — License** (current + history + CLA)
3. **Phase 3 — Commercial model** (classification + primary stream)
4. **Phase 4 — Pricing** (tiers + Wayback snapshot)
5. **Phase 5 — Feature gating** (8 binary classifications)
6. **Phase 6 — GitHub velocity** (single-day snapshot)
7. **Phase 7 — Strategic signals** (recent changes, funding, customers)
8. **Phase 8 — Verification** (24h cool-off, cross-check, schema validate)

Status field tracks progression: `pending` → `in-progress` → `verified` → `published`.

Only records with `status = "verified"` or `"published"` are included in the published Free Preview and the derived CSV.

---

## 5. Limitations and known gaps

### 5.1 Sample size
30 companies cannot represent the full COSS population. Pattern claims are anchored to this sample. Future editions (Full Atlas) will expand to 200+.

### 5.2 Public-only data
Conversion rates (free-to-paid), gross margins by tier, support cost as % of revenue, customer mix breakdown — all are private metrics. The Free Preview reports patterns visible in public data only. The Full Atlas may add survey-based estimates with explicit methodology and N disclosure.

### 5.3 Snapshot bias
GitHub stats are point-in-time. License history is reconstructed from public announcements; pre-announcement legal discussions are invisible.

### 5.4 Geography skew
~75% of the sample is US-headquartered. EU is ~25%. APAC and LATAM are absent in v0.1. This reflects current COSS market concentration but may obscure regional patterns.

### 5.5 Selection bias
Companies were selected with diversity targets (stage, license, license-change history) to enable hypothesis testing. This is **intentional structured sampling**, not random sampling. Findings should be interpreted as patterns in a curated representative sample, not population-level statistics.

---

## 6. Versioning

Schema version is locked to `1.0` for the Free Preview. Schema changes require a minor version bump (`1.1`) and a CHANGELOG entry. Breaking schema changes require a major version bump (`2.0`) and migration scripts.

Data changes (corrections, additions) are tracked in CHANGELOG with the date and reason. The dataset is treated as living: corrections are encouraged via PR.

---

## 7. Field-specific conventions

These conventions emerged during data collection and apply to all companies in the Atlas. Documented here to ensure cross-company comparability.

### 7.1 `identity.founded_year`
Year of legal incorporation of the jurisdictional entity that currently operates the company. Name changes, pivots, or rebrandings that maintain the same legal entity do **not** reset the year. Refoundings (post-bankruptcy reorganization, spin-offs creating a new LLC, etc.) **do** reset the year.

When in doubt, the SEC CIK number is the disambiguator: same CIK across decades = same legal entity, regardless of cosmetic renames.

*Example: MongoDB Inc. = `2007`. Incorporated as 10gen, Inc. in Delaware in November 2007; renamed to MongoDB, Inc. in August 2013. Same Delaware entity, same SEC CIK 0001441816 — no reset.*

### 7.2 `identity.hq_city`
Canonical city name without redundancy. When the city name coincides with a state or country name (e.g., New York / NY; Mexico City / MX; Singapore as both city and country), use the canonical short form.

The field name `hq_city` already implies city, so don't append `"City"` redundantly. For globally ambiguous cases, document the disambiguation in `metadata.notes`.

*Example: `"New York"`, not `"New York City"`. `"Mexico City"`, not `"Mexico City, Mexico"`.*

### 7.3 `identity.funding_stage`
Reflects the **current** state of the company, not the most recent historical round. A public company that previously went through Series A→E goes with `"ipo"`, not `"series-e-plus"`. An acquired company goes with `"acquired"` regardless of how many rounds it had as independent entity.

Detailed historical round-by-round funding data lives in `strategic_signals.funding_rounds_l24m` (last 24 months) and is intentionally a separate concept from `funding_stage`.

### 7.4 `identity.total_raised_usd`

**Public companies with S-1 / S-1A available:** derived from the **aggregate liquidation preference of redeemable convertible preferred stock** as disclosed in the final pre-IPO S-1/A capitalization table. This is treated as the closest verifiable proxy for total capital raised pre-IPO (assuming ~1× liquidation preference, which is industry-standard for VC preferred stock).

Press-reported figures (Crunchbase, Wikipedia, tech press, podcast quotes) that disagree with the S-1 are **not** used as override; the SEC primary source takes precedence. When the discrepancy exceeds 5%, both figures and the discrepancy are documented in `metadata.notes` for transparency.

**Private companies:** sum of disclosed funding rounds across press releases, Crunchbase (when accessible), and tech press, cross-referenced. When two sources disagree by >10%, document both and use the more authoritative.

**Both:** the secondary source must confirm **structural consistency** (e.g., capital structure broadly aligned), not necessarily replicate the exact figure.

*Example: MongoDB pre-IPO raise = `347207000` per S-1/A (2017-10-17), not the widely-cited ~USD 311M. The discrepancy was caught by reading the S-1 directly; press number had propagated unreviewed for nearly a decade.*

### 7.5 `identity.last_valuation_usd`

**Public companies:** market capitalization at close of the **last trading day prior to `data_collection_date`**, calculated as:

```
last_valuation_usd = (close price on last trading day) × (basic shares outstanding per most recent 10-K or 10-Q)
```

In USD integers, no rounding. Any mismatch between filing date of the share count and the close date introduces a small error (proportional to share repurchases or issuances in the gap, typically <1%). Document in `metadata.notes` if the gap exceeds 30 days from latest filing.

**Private companies:** post-money valuation declared in the most recent funding round. When undisclosed, set to `null` and document the round date and lead investor in `strategic_signals.funding_rounds_l24m`.

**Both interpretations** serve the same functional role ("most recent market signal of the company's value"). The interpretation used for each record is implicit from `is_public`; document explicitly in `metadata.notes` when the interpretation is non-obvious (e.g., recently de-listed, undisclosed late-stage round).

*Example: MongoDB at close 2026-05-01 = USD 263.46 × 80,369,527 shares = `21174155583`. Volatile asset (52w range USD 169–445); snapshot not to be interpreted as stable enterprise value.*

### 7.6 Cross-source rule for public companies (refinement of section 3.2)

The general rule "≥2 independent sources" applies, but for public companies with active SEC filings:

- A **press article that itself cites the SEC filing** does NOT count as an independent source. That is ratification, not triangulation.
- An **independent source** for a public company means: a different SEC filing, a different filing type (10-K vs S-1 vs 10-Q), an independent market data provider (Yahoo Finance, NASDAQ direct, Bloomberg), or an independent legal/financial database.
- Wikipedia, Crunchbase, and TechCrunch are **orientation tools only** for public companies, not primary or secondary sources.

---

## 8. Schema TODOs (post-v1)

Schema improvements deferred to future versions:

- **Add `"market-data"` to `source.type` enum.** Financial data providers (Yahoo Finance, Bloomberg, NASDAQ, MarketWatch) are currently classified as `"other"`, losing useful provenance signal. First public company entry (MongoDB) flagged this gap. Targeted for schema v1.1.
- **Add `"share_class_structure"` field** under `identity` for companies with dual-class stock (Founders Class B vs public Class A). Currently captured only narratively in `metadata.notes`. Useful for governance analysis of the Atlas. Targeted for v1.2 or v2.0.
