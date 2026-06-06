# Protocol Evaluation #1 — after Supabase (PHASE2_PROTOCOL § step 9)

Date: 2026-06-06T15:29:15+0000
Scope: evaluates the PROTOCOL, not the taxonomy (frame-level lock). Adjustments here are sanctioned by PHASE2_PROTOCOL § "Secuencia operativa" step 9 — applied before the next stub. The taxonomy is NOT touched.
Status: PROPOSED (pending Pablo approval before stub #2).

## Defect found at N=1 (actionable)

**D1 — C_comparison has no outcome category for abstentions.**
The protocol's C_comparison schema implies a binary `match / no-match` per field. But `unknown` is an explicitly valid prediction, and Supabase produced 3 abstentions. A `match/no-match` verdict is ill-defined when the prediction abstained. Forcing it would either inflate accuracy (count "unknown → absent" as a miss/hit arbitrarily) or hide that no bet was placed.

*Proposed fix:* add a third outcome to C_comparison: `abstained → resolved` (prediction was `unknown`; no predictive credit or debit). Accuracy metrics for the LP hypothesis (Thresholds B) are computed over **predicted-non-unknown** fields only. Abstentions are tracked separately as "abstention rate", which is itself a signal (high abstention rate = operator prior is weak for that stub class).

## Caveats worth recording (not defects, but discipline notes)

**C1 — Single-session A+B weakens the isolation rule.**
PHASE2_PROTOCOL § Fase B says "Fase A NO se relee durante Fase B." In this run the same agent authored/closed A and then did B in one continuous session, so A was in working memory during B. Contamination risk was low here (A was abstention-heavy), but the isolation rule is **aspirational, not enforced**, under single-session single-agent execution.
*Proposed note (not a hard fix):* prefer separating A and B by session, or by operator, when the prediction carries non-trivial content. Document in the stub when A and B were same-session.

**C2 — Stub selection should favor non-trivial priors.**
A shakedown stub where the operator knows little (→ mostly `unknown`) tests the machinery but barely tests prediction. Supabase was chosen to stress DND-vs-CP, which it did at the classification layer; but at the prediction layer it was low-information.
*Proposed note:* for stubs intended to test the LP hypothesis (Thresholds B), prefer stubs where the operator can place a falsifiable LP-role bet. Pure machinery-shakedown stubs are fine but should be labeled as such.

## What worked (keep as-is)

- Trajectory → Posture → Primary ordering prevented retrofit; classification resolved cleanly.
- `taxonomy_stress` gradation (`ambiguo leve`) was usable and discriminating.
- Plumbing-level preregistration (A locked + pushed before B) held: commit 22eaafd timestamps the prediction third-party before any evidence was opened.

## Net verdict

Protocol is sound for N=1. One actionable schema fix (D1) before stub #2; two discipline notes (C1, C2). Taxonomy untouched, as required.
