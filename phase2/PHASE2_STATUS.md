# Phase 2 — Status

Updated: 2026-06-07
Protocol in force: **v0.3** (role separation). v0.4 candidate pending (audit identifiers + embedded blind-validation note; see phase2/n8n/C_comparison.md § v0.4).
Sealed rule (2026-06-07): **canonical LP-present** definition — see `../HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Definición de "LP-present" + `born-fair-code-register.md`.

## Stubs run

| # | Stub | Role of the stub | Outcome | Commits (A / B / C) |
|---|---|---|---|---|
| 1 | Supabase | Protocol shakedown | Clean **DND** / cloud-first / native. Abstention-heavy prediction → weak test of prediction, good test of machinery. Predictor=Pablo, classifier not blind (low risk, footnoted). | 22eaafd / 1a8bca9 / ef61e7f |
| 2 | n8n | First non-trivial prediction (LP-defensor vs GG tension) | **Strong inference match** incl. exact Primary GG/DISPUTED(LP↔GG); recall matches uninformative. **LP precondition gap** (never OSI-open) → **tipo-1 NON-CANONICAL, sealed 2026-06-07** (protocol value intact; no substantive tally; born-fair-code register). Blind classifier (validated under v0.3). | f3bf9ab / 7ce3ed9 / c050e18 |

## Hypothesis scoreboard (LP detonante vs defensor — candidate, NOT validated)

> Scoreboard corregido 2026-06-07 tras sellar la regla canónica de LP-present. n8n sale del tally sustantivo (no es LP canónico). Su valor de protocolo queda intacto; ver `n8n/C_comparison.md` y `born-fair-code-register.md`.

- **Contraejemplo tipo 1 canónico** (young ≥2018 + LP defensor canónico → Primary DISPUTED): **0 — outstanding.** n8n era el candidato pero es **tipo-1 NO-canónico (asterisco)** por precondition gap → no cuenta. Slot canónico sigue abierto.
- **Contraejemplo tipo 2 canónico** (old ≤2012 + LP detonante → Primary CONFIDENT-LP): **0 — outstanding.**
- LP-present records canónicos toward N=10 threshold: **0.** (n8n excluido por la regla sellada; logueado en `born-fair-code-register.md`.)
- Verdict: **far from validation; un casillero más atrás que ayer por la corrección.** No épica, no pánico — el retroceso es el precio de no inflar el denominador.

## Open methodological items

- ✅ **RESUELTO 2026-06-07** — Decide whether n8n counts as "LP present" (precondition gap). Decisión sellada: **solo LP canónico cuenta al N=10**; n8n = born-fair-code, no cuenta. Regla definicional general (no n8n-specific), pre-comprometida antes de abrir stub #3. Ver `../HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Definición de "LP-present" + `born-fair-code-register.md`.
- v0.4 protocol hardening (audit identifiers) — capture as learning, not retroactive correction.

## Next objective (deliberate, not row-filling)

**Seek contraejemplo tipo 2 canónico: a company founded ≤2012 with expected LP *detonante* and predicted Primary CONFIDENT-LP.** The discriminant needs one canonical case of each type; tras la regla sellada **ambos están abiertos** (tipo 1 perdió a n8n por no-canónico). Tipo 2 sigue siendo la **prioridad**: es el cuadrante más vacío (mitad *detonante* con cero presión out-of-sample + cohorte histórica ≤2012 con cero casos en Fase 2). Un tipo-1 canónico es bienvenido pero secundario.

> Framing shift (locked): from stub #2 onward we choose cases to **tension hypotheses**, not to fill rows. A stub picked without a discriminant intent is data collection, which this project has deliberately left behind. Do NOT open stub #3 unless it targets tipo 2 canónico (preferido) o un tipo-1 canónico, con discriminant intent declarado ex-ante.

## Discriminant coverage (selection strategy — added 2026-06-06)

Both Phase 2 stubs so far sit in the same quadrant:

| Stub | Cohort | LP role |
|---|---|---|
| Supabase | post-pattern | absent |
| n8n | post-pattern | defensor / **non-canonical** (precondition gap → no cuenta) |

Tras sellar la regla canónica, n8n sale del conteo: el cuadrante **defensor canónico** tampoco tiene presión out-of-sample. The **detonante half** of the discriminant has **zero out-of-sample pressure** (CockroachDB-detonante was in the Phase 1 *generating* set, not a Phase 2 prediction), and we also have **zero historical-cohort (≤2012)** cases in Phase 2. The ideal tipo-2 candidate — **≤2012 + LP detonante expected + Primary CONFIDENT** — closes BOTH gaps at once and is the only quadrant that can produce the contraejemplo tipo 2 the hypothesis requires to become interesting. Not to confirm it; to expose it to the test it has not yet faced.

**Precondition-gap rule must be DEFINITIONAL, not n8n-specific.** ✅ **DONE 2026-06-07.** Regla general sellada (aplica a cualquier caso born-fair-code futuro, no a n8n específicamente; su efecto reduce el peso de n8n, lo opuesto a gerrymandering). Ver `../HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Definición de "LP-present".

**Frame-level lock reaffirmed:** n8n's results may inform *which evidence to seek next*, never *modify the hypothesis*. Records generate evidence; they do not rewrite the map.
