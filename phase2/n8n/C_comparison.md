# n8n — Phase 2C Comparison (prediction vs result)

Comparator: Claude (this session — wrote A_prediction; per PHASE2_PROTOCOL v0.3, Comparator may read A and B once B is sealed).
Opened: after Phase 2B sealed (commit 7ce3ed9, pushed). No comparison existed before that seal.
Created: 2026-06-06T16:44:47+0000

## Blindness validation (valid under v0.3 — read first)

B (7ce3ed9) is accepted as a **valid blind classification under the standard in force at execution time (PHASE2_PROTOCOL v0.3)**. This is NOT "trust the result"; it rests on three independent supports:

1. **Auditable temporal chain (git):** `f3bf9ab` (lock A, 16:01 UTC) → `9379724` (Protocol v0.3, 16:09 UTC) → `7ce3ed9` (B, 16:14 UTC). The v0.3 role-separation rule was sealed *before* B ran. `7ce3ed9` contains B only — no A↔B comparison artifact; the comparison occurred in a later session, post-push.
2. **In-artifact disclosure:** B_classification.md self-declares Classifier identity, `Evidence opened: YES (own evidence)`, and `never opened A_prediction.md; classifier blind to the predicted hypothesis`.
3. **Operator affirmation (Pablo, 2026-06-06):** the classifier session was opened specifically for Fase B, was instructed not to open A, was never shown/summarized the concrete prediction, and the comparison happened only after the push.

**Methodological commitment honored:** the standard was NOT raised retroactively because the match was strong. Elevating the validity bar after seeing a striking result would convert preregistration into a moving target. B is judged against the ex-ante v0.3 standard. (See v0.4 candidate below for *forward* hardening that does not rewrite this judgment.)

---

## Comparison table (weighted by A's declared basis)

| Field | A predicted [basis] | B observed | Outcome | Evidential weight |
|---|---|---|---|---|
| founded_year | ~2019 [recall] | 2019 | match | **weak** — tests my memory, not the model |
| cohort | post-pattern [recall] | post-pattern (2019) | match | **weak** — recall |
| Trajectory | pivot [inference, low conf] | pivot (native caveat) | match | medium — low-confidence inferential bet landed; same native/pivot ambiguity noted independently |
| Distribution Posture | dual-path [recall+inference] | dual-path | match | medium — mixed basis |
| **Primary Strategy** | **GG, state DISPUTED (LP↔GG)** [inference] | **GG, DISPUTED (vs LP)** | **match (exact, incl. state)** | **STRONG** — pure inference from the LP hypothesis, independently reproduced by a blind classifier |
| taxonomy_stress | mild (could escalate severe) [inference] | ambiguo leve | match | medium-strong — inference |
| LP role | defensor + fork to absent/TfI [inference] | LP = Secondary; "precondition gap" (never OSI-open) flagged | match on defensor + fork independently surfaced | medium — see § Precondition gap (partly shared recall) |
| Surprising result | would surprise if LP *detonante*, or fully-permissive/LP-absent | neither; restrictive-from-launch | no surprise | consistent with model |
| Fourth scenario | ecosystem/community moat OR fair-code-as-license-category [inference] | "born fair-code / never OSI-open" precondition gap | **partial** — a fourth scenario DID emerge, but a *different* mechanism than I named | see § Fourth scenario |

---

## Why the weighting matters (the core of this comparison)

The raw headline is "8/9 match." That number is misleading if read flat. Splitting by A's declared basis:

- **Recall matches** (founded_year, cohort): n8n facts I already knew. A blind classifier finding the same facts tests *whether both of us read n8n correctly*, not whether the LP hypothesis/taxonomy has predictive power. **These contribute ~nothing to validating the framework.**
- **Inference matches** (Primary GG/DISPUTED, Trajectory pivot, taxonomy_stress, LP defensor-role): these were derived from the LP hypothesis / taxonomy, not memorized. A blind classifier reproducing them is **real evidence that the framework discriminates**. The strongest single datum is **Primary = GG with state DISPUTED (LP↔GG)**: I predicted it by inference (young + LP-defensor → DISPUTED LP↔GG, per the discriminant), and a session that never saw the prediction landed on the identical call *including the contested state*.

So the honest read is: the match is strong **where it counts** (inference), and uninformative **where it doesn't** (recall). The recall/inference tagging — introduced exactly to prevent confusing memory with model power — did its job here.

---

## Discriminant result (rol hypothesis vs cohort counter-hypothesis)

Per `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Predicción discriminante, n8n is: **young (founded 2019, post-pattern) + LP defensor + Primary DISPUTED**. This is **contraejemplo tipo 1** ("Record joven ≥2018 con LP defensor → Primary DISPUTED"), which the doc says "confirmaría que la frontera es rol, no edad" and "Falsificaría parcialmente la counter-hipótesis cohorte (la juventud no garantiza nitidez)."

**Epistemic discipline (N small):** this is **one** contraejemplo tipo 1, not validation. The hypothesis's own criteria require ≥10 LP-present records, ≥80% LP-role accuracy, AND at least one contraejemplo of *each* type (tipo 1 **and** tipo 2). We now have the first tipo 1. Correct wording: n8n **weakens** the cohort counter-hypothesis as the *sole* explanation and is **consistent with** the directional-rol hypothesis; it does **not** confirm it. A tipo 2 (old + LP detonante + CONFIDENT) is still outstanding.

---

## Precondition gap — n8n's "LP present" status is itself DISPUTED

B's substantive finding (independently surfaced; I had flagged the same fork in A): n8n **never had an OSI-open core** — it shipped Apache 2.0 **+ Commons Clause** (source-available) from launch and tightened to SUL in 2022. The taxonomy's Licensing Pivot requires a "core **previamente abierto**" and "relicensing **OSS → source-available**." n8n's move was source-available → more-restrictive source-available.

**Consequence for the experiment:** whether n8n counts as an "LP present" record for Thresholds B is itself contestable. If "LP present" strictly requires an open→restricted transition, n8n is a **borderline / non-canonical** LP record and should be counted with that caveat (or excluded and logged as a distinct "born fair-code" scenario). This must be decided **before** it is tallied toward the N=10, not after — to avoid selection pressure on the count.

**Convergence caveat:** A (me, knowing n8n) and B (blind) both surfaced the precondition gap — but A's flag was partly *recall* (I know n8n's fair-code-from-launch history). So the convergence is partly two readers recalling the same fact, not two independent model-derivations. Medium strength, not strong.

---

## Fourth scenario

A named two candidate fourth scenarios (ecosystem/community moat; fair-code as a license-*category* play). B surfaced a fourth scenario too — **"born fair-code / never OSI-open"** — but it is a *different* mechanism than either I named. Same family (fair-code is special and the taxonomy has no clean slot for it), different specifics. So: a fourth scenario emerged (evidence the taxonomy v0 has an explanatory gap around fair-code-from-inception), but **my specific predicted fourth scenarios did not** — I do not get credit for naming it ex-ante.

---

## Protocol v0.4 candidate (forward hardening — does NOT alter B's v0.3 judgment)

Captured as learning, per operator. Future B records should embed:

- `classifier_session_id` (or a non-identifying session token)
- `prediction_lock_commit` (n8n = `f3bf9ab`)
- `classification_commit` (n8n = `7ce3ed9`)
- `classification_push_timestamp`
- a Comparator-written **blind-validation note** (this section's § Blindness validation is the n8n instance)

Rationale: reduce future dependence on after-the-fact *operator affirmation* by baking the audit trail into the artifact at creation time. Classifier ≠ Comparator in separate sessions remains the ideal; where they coincide, the pre-comparison commit hash is the firewall.

---

## Net interpretive note

A blind classifier reproduced the inference-based predictions — including the exact DISPUTED Primary — for a stub chosen precisely because it should stress LP-defensor-vs-GG. That is the most informative single result Phase 2 has produced so far. But: N is small (stub #2), the recall-based agreement is uninformative, the precondition gap puts n8n's LP-present status in question, and validation thresholds are far off. n8n is **one well-audited contraejemplo tipo 1**, not a verdict. Stub #3 onward, same discipline.
