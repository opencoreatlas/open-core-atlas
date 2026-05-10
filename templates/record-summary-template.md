# [Company Name] — Record Summary

**Slug:** `[company-slug]`
**Category:** `[databases | observability | devtools | ai-infra | security | data-pipeline | analytics-bi | workflow-orchestration | content-cms | niche-emerging]`
**Data collection date:** `YYYY-MM-DD` (must match the record's `data_collection_date`)
**Summary written:** `YYYY-MM-DD`
**Status:** `pending → in-progress → verified → published` (must match record JSON)

> **One-line description:** _what does this company do, in one sentence a reader unfamiliar with the category can parse_

---

## Purpose of this document

The Atlas has three layers of content. This document is the **insight layer** — distinct from the **data layer** (JSON: atomic facts + sources) and the **rule layer** (METHODOLOGY: how decisions are made).

Inside research notes, three sub-layers exist. The record summary handles them differently:

1. **Audit trail / traceability** — which sources were consulted, when, and how. Lives in `sources[]`, `accessed_date`, and Wayback snapshots. **Does not belong in this document.**
2. **Methodological reasoning** — why classifications were chosen, how ambiguity was resolved, what edge cases were confronted, what cross-source reconciliations happened. **This is the core of the record summary.**
3. **Cross-record synthesis** — patterns observed across companies, divergences, candidate hypotheses. **Selected fragments belong here; full hypothesis analysis lives in `analysis/h*.md` post-N=10.**

Reader profile: a smart but not-obsessed observer (founder, VC, analyst, journalist) who wants to understand **what is interesting and what was decided** about this company without reading the full JSON or the source URLs.

Three things this document is NOT:
- **Not a research diary.** Discovery narrative ("I first thought X, then realized Y") belongs in commits, not here.
- **Not a duplicate of the JSON.** Do not restate every field. Cite numbers and license names where they support a sentence; otherwise, link to the JSON.
- **Not a hypothesis writeup.** Hypothesis analysis with N≥10 lives in `analysis/h*.md`. This document captures **preliminary signals**, not findings.

Length target: **600–1,200 words**. If a section requires more, the JSON or methodology should absorb the overflow, not this file.

---

## 1. Why this record matters

Why was this company added to the Atlas? What does it stress-test? Two or three sentences.

Useful framings (pick one or combine):
- **Category role** — leader / contender / outlier / category-defining / category-niche.
- **Hypothesis exposure** — which of the 7 hypotheses this record speaks to (e.g., H1 license migration, H4 source-available wave).
- **Methodological role** — what edge case this record forced the Atlas to confront (e.g., FSL auto-conversion semantics, multi-step license history, source-available-tiered classification gap).

If a record currently contributes little unique insight, document its category-coverage or control-sample role explicitly rather than inflating conclusions.

---

## 2. License trajectory

Narrative of the license history with key dates. Prose, not bullet list — the timeline tells a story.

Required elements:
- Each license phase named (SPDX-canonical short form, per METHODOLOGY 7.18).
- Date of each transition (effective date, with disambiguation if announce-date / commit-date / effective-date diverge — see CockroachDB pattern).
- Public rationale for each transition in one phrase (e.g., "AWS DocumentDB displacement," "MongoDB SSPL precedent + AWS clone risk," "FSL pioneer adoption").
- If conversion mechanism applies (FSL/BSL family), name it: per-version vs global, delay length, post-conversion license.

If license has never changed, one sentence is sufficient ("Apache-2.0 since founding, no transitions").

---

## 3. Commercial model

How does the company make money? What is the OSS↔commercial relationship?

Required elements:
- **Classification adopted** in `commercial_model.type` and one sentence justifying the choice when the record sits in ambiguous territory (e.g., "hybrid as least-bad fit pending v1.1 schema extension to source-available-tiered").
- **Primary revenue streams** (managed cloud, enterprise self-hosted, services/support) with disclosure status: company-stated vs third-party-estimated (Sacra, etc.) vs Atlas-inferred.
- **Pricing model** in one or two sentences — fixed-price tier vs usage vs multi-dimensional. Note any structural quirks (e.g., Sentry's 3-axis pricing, MongoDB's compute-only base).

Skip this section's depth on companies with single-product, single-stream commercial models — one paragraph is enough.

---

## 4. Development cadence — interpreted, not listed

The four GitHub fields (`stars`, `commits_l12m`, `contributors_l12m`, `releases_l12m`) **must not be reported in isolation** — METHODOLOGY 7.20 requires composite signal in editorial output.

Required:
- Two-sentence interpretation of the project's cadence: where it falls relative to category peers and what release strategy it follows (single-trunk continuous, multi-branch with backports, calendar-versioned with batched RC tags, etc.).
- If `releases_l12m` and `commits_l12m` diverge from the typical 50–500 commits/release band, name the divergence and explain it (per METHODOLOGY 7.19).
- One sentence on contributor breadth and whether founders/early team are still high-velocity contributors (signal of organizational continuity).

Bad pattern: "97 releases L12M, 902 contributors total, 71 active L12M, 10,768 commits L12M." That is a JSON paste.
Good pattern: "Roughly 100 releases per year against ~10K commits places MongoDB in the high-cadence category-leader band; the ~70 contributors active in the last 12 months (out of 902 lifetime) reflect a stable maintainer core rather than a growing community of new entrants."

---

## 5. Key methodological decisions

Judgment calls that were made during research where the rule was not mechanical. Three to six bullets, each one to two sentences.

Common categories (pick those that apply, do not enumerate empty ones):
- **Cross-source reconciliation** — when sources disagreed and which won, with reason.
- **Classification under ambiguity** — least-bad-fit decisions and what schema gap they expose.
- **Source-hierarchy decisions** — live-page-vs-stale-PR (e.g., customer logo decay), primary-vs-secondary-source preference.
- **Field-specific judgment** — pricing tier exclusion (PREVIEW, free, variable), `funding_rounds_l24m` exclusions (buybacks, M&A consideration), event-window edge cases.
- **Audit-trail captures** — Wayback snapshot timing, version-pinning of references.
- **Vocabulary choice** — when canonical short forms required disambiguation (FSL-1.1-Apache-2.0 vs FSL).

If a judgment was load-bearing enough to warrant a METHODOLOGY amendment, link to the amendment number (e.g., "applied 7.18 / 7.19").

---

## 6. Hypothesis signals (preliminary, N=current)

What does this record contribute to the 7 hypotheses, **understood as a preliminary signal at current N, not a finding**?

Format suggestion (terse):
- **H1 license migration:** confirms / counter-evidence / neutral / adds new candidate signal — one sentence why.
- **H2 hybrid commercial:** confirms / counter-evidence / neutral / adds new candidate signal — one sentence why.
- **H3 (etc.):** only list hypotheses where this record adds non-zero signal. Skip hypotheses where the record is uninformative.

If a record breaks an Atlas-internal assumption that is not yet a numbered hypothesis (e.g., "OSS-required for COSS" — Sentry has none at HEAD; or category-split signals like `multi_region_ha=oss` for observability vs `commercial` for databases), document it here as a candidate hypothesis worth registering for future inclusion.

Frame everything as "patrón emergente al N=X, will test as the dataset grows" per the post-Sentry decisions of 2026-05-09. Never "Atlas finds that…" until N is sufficient by license family / category.

---

## 7. Confidence caveats

Where is the data well-grounded and where is it provisional?

Required if applicable:
- **Aging valuations** for private companies (X years since last round, no down-round disclosed).
- **Estimated vs disclosed revenue splits** (Sacra third-party estimates, no company breakdown).
- **Snapshot-date recency** for fast-moving fields (GitHub metrics, customer logos, pricing).
- **Pending verifications** that, if completed, would upgrade confidence (e.g., Delaware cert lookup pending → `founded_year` MEDIUM, would become HIGH).

Do not pretend uncertainty is absent. Editorial credibility comes from naming the limits.

---

## 8. Open verifications (TODO)

Pending methodology work — items that, when completed, would upgrade confidence or capture missing source-of-truth. **This is layer 2 (methodology execution status), not layer 1 (audit trail).** Audit-trail evidence (which sources were consulted, when, with which Wayback URL) lives in the JSON's `sources[]` and `accessed_date`, not here.

Each item one line.

Examples:
- Pull commit hash for [year] license transition via local clone of `[owner]/[repo]`.
- Wayback save of `[domain]/pricing` for forward audit-trail (note: the act of saving is layer 2; the Wayback URL once saved is layer 1).
- Cross-check [funding number] against [secondary source] when [trigger condition].
- Re-evaluate `[field]` when [external event, e.g., next earnings call, schema v1.1 release].

If there are no open verifications, write "None pending." (Suspect over-confidence if this is the case for the first 3 records of any contributor.)

---

## Authoring discipline

- **Write before flipping `status` to `verified`**, not after. The summary is part of the verification gate, not a retrospective.
- **One contributor authors, one different reader reviews.** Same-eye sanity-check at 24h cool-off.
- **Cite numbers, do not restate fields.** If you find yourself listing JSON contents, you are not summarizing.
- **No marketing voice.** Atlas voice is empirical, skeptical, professional. No "leading," "innovative," "category-defining" without specific evidence cited.
- **No hedging escalators.** Avoid "potentially," "possibly," "might suggest." Either the signal is there at current N (state it as preliminary) or it is not (omit it).

---

*Template v1, 2026-05-10. Iterate on this template as records 4+ surface frictions; do not retrofit existing records (MongoDB / CockroachDB / Sentry summaries are opportunistic per the hybrid scope rule, not blocking).*
