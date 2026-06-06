# Phase 2 — Status

Updated: 2026-06-06
Protocol in force: **v0.3** (role separation). v0.4 candidate pending (audit identifiers + embedded blind-validation note; see phase2/n8n/C_comparison.md § v0.4).

## Stubs run

| # | Stub | Role of the stub | Outcome | Commits (A / B / C) |
|---|---|---|---|---|
| 1 | Supabase | Protocol shakedown | Clean **DND** / cloud-first / native. Abstention-heavy prediction → weak test of prediction, good test of machinery. Predictor=Pablo, classifier not blind (low risk, footnoted). | 22eaafd / 1a8bca9 / ef61e7f |
| 2 | n8n | First non-trivial prediction (LP-defensor vs GG tension) | **Strong inference match** incl. exact Primary GG/DISPUTED(LP↔GG); recall matches uninformative. **LP precondition gap** (never OSI-open). Blind classifier (validated under v0.3). | f3bf9ab / 7ce3ed9 / c050e18 |

## Hypothesis scoreboard (LP detonante vs defensor — candidate, NOT validated)

- **Contraejemplo tipo 1** (young ≥2018 + LP defensor → Primary DISPUTED): **1 found** (n8n). Weakens cohort counter-hypothesis as sole explanation; consistent with directional-rol hypothesis.
- **Contraejemplo tipo 2** (old ≤2012 + LP detonante → Primary CONFIDENT-LP): **0 — outstanding.**
- LP-present records toward N=10 threshold: ~1 (n8n's LP-present status itself DISPUTED via precondition gap — decide counting before tally).
- Verdict: **far from validation.** No épica, no pánico.

## Open methodological items

- Decide whether n8n counts as "LP present" (precondition gap: source-available → more-restrictive, never open → source-available) or is logged as a distinct "born fair-code" scenario. Decide BEFORE tallying toward N=10.
- v0.4 protocol hardening (audit identifiers) — capture as learning, not retroactive correction.

## Next objective (deliberate, not row-filling)

**Seek contraejemplo tipo 2: a company founded ≤2012 with expected LP *detonante* and predicted Primary CONFIDENT-LP.** The discriminant needs one of each type; we have tipo 1, not tipo 2.

> Framing shift (locked): from stub #2 onward we choose cases to **tension hypotheses**, not to fill rows. A stub picked without a discriminant intent is data collection, which this project has deliberately left behind. Do NOT open stub #3 unless it targets tipo 2 (or a justified alternative tension stated ex-ante).

## Discriminant coverage (selection strategy — added 2026-06-06)

Both Phase 2 stubs so far sit in the same quadrant:

| Stub | Cohort | LP role |
|---|---|---|
| Supabase | post-pattern | absent |
| n8n | post-pattern | defensor / precondition-gap |

The **detonante half** of the discriminant has **zero out-of-sample pressure** (CockroachDB-detonante was in the Phase 1 *generating* set, not a Phase 2 prediction), and we also have **zero historical-cohort (≤2012)** cases in Phase 2. The ideal tipo-2 candidate — **≤2012 + LP detonante expected + Primary CONFIDENT** — closes BOTH gaps at once and is the only quadrant that can produce the contraejemplo tipo 2 the hypothesis requires to become interesting. Not to confirm it; to expose it to the test it has not yet faced.

**Precondition-gap rule must be DEFINITIONAL, not n8n-specific.** Decide ex-ante how a "born fair-code / never-OSI-open" company is counted toward LP-present — as a general rule that applies to any future such case — so the decision can't be gerrymandered to make n8n count (or not) toward a desired conclusion.

**Frame-level lock reaffirmed:** n8n's results may inform *which evidence to seek next*, never *modify the hypothesis*. Records generate evidence; they do not rewrite the map.
