# n8n — Phase 2A Prediction

Status: LOCKED
Evidence opened: NO
Prediction author: **Claude** (see Operator note)
Created: 2026-06-06T15:59:09+0000
Locked: 2026-06-06T13:01:43-03:00 (commit gatekeeper: Claude this session, distinct context from prediction author)

## Operator note (integrity — read before locking)

Supabase Phase 2A was `Prediction author: Pablo`. From this stub forward the canonical operator is **Claude** (the constant through-line across stubs; Pablo's n8n prior is high enough to contaminate). **Consequence:** Supabase (Pablo) and n8n+ (Claude) are *different operators*. Their LP-role accuracies must NOT be pooled naively as "one operator's predictive quality". Decide later whether to (a) treat Supabase as a separate-operator footnote, or (b) re-predict Supabase under Claude to homogenize. Recorded here, not silently absorbed.

## Contamination discipline (per stub)

My n8n prior is high. Each field is tagged by basis:
- **[recall]** — I already know the fact. A later "match" mostly tests my memory → WEAK evidence for the LP hypothesis.
- **[inference]** — derived from the LP hypothesis / taxonomy, not memorized. A later "match" is STRONG evidence for the model.
- **[unknown]** — answering would require opening a source. Honest abstention (per § Salvaguardas).

Prior general knowledge is allowed as a human prior; opening n8n sources is not. Line = "what I already know" vs "what I'd look up".

---

## 0. Anchor data

- **founded_year:** ~2019 (Jan Oberhauser, Berlin). **[recall, medium confidence]** — exact year I'd want to verify, but it is ≥2018 either way, so the cohort call below is robust to the uncertainty.

## 1. LP Role Prediction

Prediction: **`defensor`** **[inference, medium confidence]** — with an explicit fork (see caveat).

Rationale:
- I recall **[recall]** that n8n uses a restrictive "fair-code" license (Sustainable Use License; earlier Apache 2.0 + Commons Clause). It was never permissively-OSS-then-relicensed-after-years in the MongoDB sense.
- Contrafactual test **[inference]**: if the restrictive license never existed, would the main capture still work? n8n's capture is (a) n8n Cloud (managed) + (b) enterprise feature gating. The license functions as a **firewall** protecting the Cloud business against resale by cloud providers — it protects a pre-existing capture rather than being the capture. → **defensor**, not detonante.
- **Fork caveat:** whether n8n even counts as "LP present" is itself contestable. If the restrictive license dates from near-inception (Commons Clause added very early), it may be "restrictive/tiered from inception" rather than a pivot — in which case LP role could be **absent** and Primary = TfI. This fork is the analytical crux of the stub.

## 2. Cohort Prediction

Prediction: **`post-pattern`** (founded ≥2018) **[recall, high confidence]**.

Rationale: n8n is a 2019-era company; post-pattern regardless of the exact founding year.

## 3. Expected Classification

- **Trajectory:** `pivot` **[inference, LOW confidence]** — I believe there was a license transition (Apache+Commons Clause → Sustainable Use License). If instead it was restrictive-from-inception, this flips to `native`. Low confidence; genuinely contestable.
- **Distribution Posture:** `dual-path` **[recall + inference, medium]** — self-host is core to n8n's identity/community AND n8n Cloud is pushed for monetization. Could be `self-host-first` if self-host is clearly the promoted route.
- **Primary Strategy:** **`GG`** (Governance Gating) **[inference, medium]** — per the LP hypothesis, if LP is *defensor*, the defended strategy becomes Primary and LP drops to Secondary. n8n's defended capture looks like enterprise feature gating (SSO/RBAC/log-streaming behind Enterprise). **Predicted state: DISPUTED (LP ↔ GG)** — because n8n is young + LP-defensor, this is exactly the *contraejemplo tipo 1* the discriminant predicts (young + defensor → DISPUTED). If the prediction lands DISPUTED, that is a directional-hypothesis win over the cohort counter-hypothesis.
- **Secondary Strategy(s):** `LP` (defensor); possibly `CP` (cloud). Possibly `TfI` instead of LP if the restrictive license is inception-era.

## 4. Expected Taxonomy Stress

Prediction: **`mild`** **[inference]** — a contested-but-bounded choice among LP / GG / TfI, resolvable via the contrafactual test. Escalates to **`severe`** if the relicensing-vs-inception question cannot be settled and the case can sit "in several boxes" without a deciding criterion.

## 5. Surprising Result

What would genuinely surprise me **[inference]**:
- n8n turning out to be **LP detonante** (the license change itself being the capture mechanism — e.g., revenue-threshold licensing à la CockroachDB CSL) rather than a defensive firewall.
- Or: n8n having a **fully permissive OSS core with no restrictive license** (LP absent, pure self-host-first community play) — contradicting my fair-code recollection.

## 6. Fourth Scenario

A scenario the taxonomy v0 may not contemplate **[inference]**:
- n8n's primary value capture running through a **community / node-template ecosystem moat** (network/ecosystem effects around the integration library and community), which the taxonomy — built around the OSS-vs-commercial *boundary* — has no strategy category for. If the dominant capture mechanism is "own the ecosystem", the 5 strategies would all feel like forcing.
- Related sub-variant: "fair-code" as a **license-category / movement-creation** play (brand/positioning via inventing a license category), which is neither LP-capture nor pure defensor-firewall.

## 7. Locked Notes

This file must be committed (lock) and pushed before Phase 2B begins. No n8n docs, pricing, repo, license files, blog posts, or funding news may be opened before the lock is pushed.

`unknown` is a valid prediction in any field when the answer would require opening new evidence. Guessing is worse than missing. The experiment measures the real prior, not the ability to guess.
