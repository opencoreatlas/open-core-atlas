# Supabase — Phase 2B Classification

Status: CLOSED (committed)
Phase A re-read during B: NO (isolation rule honored — answers "what do I see", not "is the prediction confirmed")
Evidence opened: YES (Phase A locked + pushed in commit 22eaafd before this file)
Classification author: Claude (operator-reviewed)
Created: 2026-06-06T15:23:27+0000

> Regla de aislamiento (PHASE2_PROTOCOL § Fase B): la clasificación responde "¿qué veo en los datos?", no "¿se confirma mi predicción?". La predicción LP no participa de la elección de Primary Strategy.

---

## 0. Anchor data (evidence)

- **Founded:** 2020, by Paul Copplestone & Ant Wilson (Y Combinator). Positioned as "the open-source Firebase alternative".
- **License (root, master HEAD):** Apache License 2.0 (primary source: raw.githubusercontent.com/supabase/supabase/master/LICENSE, copyright "2024 Supabase", fetched 2026-06-06). No relicensing event found; explicit negative search for BSL/SSPL relicensing returned nothing on Supabase itself. Counter-signal: Supabase RE-licensed an acquisition (Logflare, previously BSL) TO Apache 2.0 — the opposite direction of a licensing pivot.

---

## 1. Trajectory

**Value:** `native`

Evidence: open-source core (Apache 2.0) and a hosted commercial platform both existed from the 2020 launch; the repo shipped self-host tutorials from day 1. No relicensing event and no posture pivot — the current state is the original one.

---

## 2. Distribution Posture

**Value:** `cloud-first`

Evidence: both routes are production-grade — self-host is documented as "production-parity" with the hosted platform (11-service docker-compose stack) — but the managed cloud is the recommended/promoted route (default "Start your project" CTA, free tier, professional support; self-host is community-supported and lacks managed-only features such as branching, PITR, managed backups, advanced metrics, analytics buckets, ETL).

---

## 3. Primary Strategy

**Value:** `DND` (Dual-Native Design) — estado: **CONFIDENT** (with a documented mild tension toward CP; see § 5)

Evidence:
- The Apache-2.0 core (Postgres, auth, storage, realtime, edge functions) is fully self-hostable at production parity, including full `postgres` superuser access that the managed platform deliberately restricts. Self-host is NOT deprecated or degraded.
- Monetization arises from managed **operational convenience** — managed backups/PITR, autoscaling, branching, advanced metrics, compliance/support — not from deliberate degradation of self-host nor from a license restriction. This matches DND inclusion ("monetización surge de conveniencia operativa, no de degradación deliberada del self-host") and explicitly fails the CP inclusion test ("self-host deprecado o desalentado").

---

## 4. Secondary Strategies

**Value:** none registered.

Rationale: new platform capabilities ship cloud-first (a faint Commercialization-Pivot flavor), but the production-grade core remains fully open and self-hostable, so this does not rise to a Secondary Strategy. It is recorded as a tension in § 5 rather than promoted to a category (Regla 4: a strategy is born only when classification fails honestly, which it did not here).

---

## 5. Taxonomy Stress

**Value:** `ambiguo leve` (mild ambiguity)

Why: the boundary between "managed convenience" (DND) and "self-host degradation via cloud-only feature velocity" (CP) is judgment-dependent. Platform-exclusive features (branching, PITR, ETL, analytics buckets) create real asymmetry between routes — but the core remains self-hostable at production parity, so the case resolves to DND without forcing. Not severe, not UNCLASSIFIABLE.

**Explicit non-stress note (orthogonality working as designed):** Primary Strategy = DND while Distribution Posture = cloud-first is NOT a contradiction. Strategy captures the value-capture mechanism (managed convenience, self-host viable); Posture captures what is promoted today (cloud). Supabase is a clean demonstration of the Strategy ⊥ Posture orthogonality the taxonomy claims — evidence FOR the multidimensional frame, not against it.

---

## 6. Bookkeeping

- working_classification: **true** (Regla 3 — pre-full-research working hypothesis; does not count for metrics/synthesis/public outputs until the 10-point Definition of Done is met).
- LP role observed: **absent** (Apache 2.0 throughout; primary-source confirmed).
- Cohort observed: **post-pattern** (founded 2020 ≥ 2018).
- timestamp: 2026-06-06T15:23:27+0000
