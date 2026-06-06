---
name: Phase 2 Protocol — Stub Reclassification
version: 0.2
date: 2026-05-31
status: active
related:
  - ../STRATEGY_TAXONOMY_v0.md (taxonomía bajo test, congelada)
  - ../METHODOLOGY_PRINCIPLES.md (§ 1 Frame-level lock)
  - analysis/TAXONOMY_v0_PHASE_1_CLOSING.md (origen del experimento)
  - HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md (hipótesis emergente bajo test)
  - ../HYPOTHESIS_v2.md (hipótesis Atlas-internal vigente)
  - METHODOLOGY.md (research workflow per record, separado)
---

# Phase 2 Protocol — Stub Reclassification

> **v0.2 (2026-06-06)** — Protocol improvement discovered by shakedown #1 (Supabase), NOT an error correction. The protocol ran exactly as designed; the shakedown revealed that C_comparison could not distinguish an honest abstention from a hit or a miss. Added the `abstained → resolved` outcome and scoped LP-accuracy to predicted-non-`unknown` fields. See `phase2/PROTOCOL_EVAL_01_supabase.md`. No taxonomy / hypothesis / conceptual frame changed.

## Espíritu

> El objetivo de Fase 2 no es confirmar la taxonomía. Es darle oportunidades repetidas de fallar.

Hasta acá, la taxonomía v0 fue calibrada con N=5 records que generaron la hipótesis. Esta fase la testea contra evidencia que NO participó en su construcción. Es el primer experimento prospectivo del Atlas, no mantenimiento del dataset.

## Qué se testea

Tres objetos distintos, en simultáneo, con criterios separados:

| Objeto bajo test | Criterio de fallo | Checkpoint |
|---|---|---|
| Strategy Taxonomy v0 (poder discriminativo) | Thresholds Taxonomía (§ Thresholds A) | 10 stubs cualesquiera |
| Hipótesis LP detonante vs defensor (candidata) | Criterios en `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Criterios | 10 stubs **con LP presente** |
| Counter-hipótesis cohorte histórica (rival viva) | Predicción discriminante en `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Predicción discriminante | Mismo checkpoint que LP |

Los dos checkpoints pueden no coincidir en el tiempo. Pueden cumplirse 10 stubs taxonomía con sólo 4-5 LP presente; el checkpoint LP se evalúa cuando se llega a 10 LP presentes, no antes.

## Pre-comprometidos heredados (no se renegocian)

1. **Frame-level lock** (`METHODOLOGY_PRINCIPLES.md` § 1): Fase 2 no tiene permiso para modificar `STRATEGY_TAXONOMY_v0.md`. Cualquier refinement candidato sólo se valida en Fase 3 con evidencia nueva.
2. **Clasificación contra taxonomía sin fix.** La hipótesis LP es candidata: se predice ex-ante, no participa de la clasificación.
3. **Regla 1, 2, 3, 4 de Strategy Taxonomy v0** (forced choice Primary; orden Trajectory → Posture → Primary → Secondary; etiquetado `working_classification`; nueva strategy sólo por failure honesto).
4. **El record no tiene permiso para cambiar la taxonomía.** Sólo tiene permiso para generar evidencia.

## Estructura física Fase A / Fase B

Separación física es preregistration. No es organización cosmética.

### Fase A — Prediction

Archivo: `phase2/{stub-slug}/A_prediction.md`

Contenido mínimo:

- `stub`: slug
- `founded_year`: año
- `LP role prediction`: ausente / defensor / detonante / unknown
- `cohort prediction`: historical-cohort (founded ≤2012) / borderline (2013-2017) / post-pattern (founded ≥2018) / unknown (founded_year not known without opening evidence)
- `hipótesis_breve`: 1-2 líneas explicando POR QUÉ predecís ese LP role
- `resultado_esperado`: (Strategy, Posture, Trajectory) que predecís de Fase B
- `resultado_sorprendente`: qué encontraría que no esperás
- `cuarto_escenario_posible`: algo que la taxonomía v0 no contempla y que podría aparecer (si lo identificás ex-ante, vale como hipótesis falsable; si emerge ex-post sin haberlo nombrado, es evidencia más fuerte)
- `timestamp`: fecha y hora

**Regla de cierre:** Fase A se commitea antes de abrir Fase B. La predicción no se modifica post-clasificación. Si después de Fase B descubrís que la predicción era inviable de hacer por falta de info pública, eso se documenta en el archivo de evaluación final del stub, no se reescribe Fase A.

### Fase B — Classification

Archivo: `phase2/{stub-slug}/B_classification.md`

Contenido mínimo:

- `stub`: slug
- `trajectory`: native / pivot / evolving + 1 línea de evidencia
- `distribution_posture`: cloud-only / cloud-first / dual-path / self-host-first + 1 línea de evidencia
- `primary_strategy`: LP / GG / TfI / CP / DND + estado (CONFIDENT / DISPUTED / UNCLASSIFIABLE) + 1-2 líneas de evidencia
- `secondary_strategies`: lista 0..N
- `taxonomy_stress`: ninguno / ambiguo leve / ambiguo severo / UNCLASSIFIABLE + 1 línea de por qué
- `working_classification`: true (por Regla 3 del taxonomy v0 — no cuenta para métricas/síntesis/outputs hasta full research)
- `timestamp`: fecha y hora

**Regla de aislamiento:** Fase A NO se relee durante Fase B. La clasificación responde "¿qué veo en los datos?", no "¿se confirma mi predicción?". La predicción LP no participa de la elección de Primary Strategy.

### Comparison

Archivo: `phase2/{stub-slug}/C_comparison.md`

Se abre sólo después de cerrar Fase B con commit. Compara predicción vs resultado:

- `LP role predicho` vs `LP role observado` → match / no-match / abstained
- `cohort prediction` vs `resultado real` → match / no-match / abstained
- `Primary esperada` vs `Primary observada` → match / no-match / abstained
- `cuarto escenario` → emergió / no emergió / emergió otro no contemplado
- `nota interpretativa`: 2-3 líneas

**Outcome legend (v0.2 — improvement discovered by shakedown #1, not error correction).** La comparación distingue **tres** resultados, no dos:
- **match** — predicción no-`unknown` y coincide con lo observado.
- **no-match** — predicción no-`unknown` y difiere de lo observado.
- **abstained → resolved** — la predicción fue `unknown` (abstención honesta válida per § Salvaguardas: "unknown is a valid prediction"); lo observado la resuelve, sin crédito ni débito predictivo.

Rationale: registrar `abstained → resolved` preserva la diferencia entre predicción incorrecta, abstención honesta y predicción correcta — la distinción que el shakedown #1 mostró que faltaba.

## Salvaguardas adicionales

- **Stub clean ≠ protocolo validado ≠ taxonomía validada.** Un primer stub que resuelve sin ambigüedad sólo significa "no falló inmediatamente". Disciplina idéntica en los stubs siguientes; no hay atajos.
- **Cuarto escenario no contemplado.** Si en Fase B emerge un escenario que la taxonomía v0 no cubre — incluso si finalmente clasificás el stub forzando una categoría — eso por sí solo cuenta como evidencia contra el poder explicativo de la taxonomía. Se documenta en `taxonomy_stress` y en `C_comparison`.
- **Evaluación a checkpoints, no caso por caso.** Los thresholds se aplican al cumplirse cada checkpoint (10 stubs / 10 LP-presentes). No se evalúan ni se modifican entre medio.
- **No promotion durante Fase 2.** Ninguna observación de Fase 2 genera amendment a `STRATEGY_TAXONOMY_v0.md`, `controlled-vocabularies.yaml`, ni al schema. Cualquier propuesta de refinement queda como input para Fase 3.
- **Unknown is a valid prediction when the answer would require opening new evidence. Guessing is worse than missing.** Aplica a cualquier campo de Fase A. Si para predecir Posture necesitarías abrir docs del stub, la predicción honesta es `unknown` con rationale. El experimento mide el prior real, no la capacidad de adivinar.

## Thresholds A — Taxonomía v0 (10 stubs cualesquiera)

| Métrica | Threshold | Veredicto |
|---|---|---|
| UNCLASSIFIABLE | ≥3/10 | FAIL — la taxonomía no cubre el espacio |
| Ambiguo severo | 3-4/10 | WARNING — revisar definitions, no FAIL automático |
| Ambiguo severo | ≥5/10 | FAIL — no discrimina |
| UNCLASSIFIABLE + Ambiguo severo | ≥5/10 | FAIL — discriminación insuficiente compuesta |

**DISPUTED no es criterio de fallo.** Fase 1 produjo 3 DISPUTED y aun así descubrió estructura. El peligro real es "no sé dónde poner esto" / "lo puedo poner en cualquier lado".

**Interpretación de FAIL en este checkpoint:** la taxonomía v0 es retrospective fit. Se replantea v0, no se itera v0.1 con parches.

## Thresholds B — Hipótesis LP (10 stubs con LP presente)

Heredados de `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Criterios. No se duplican acá. Resumen operativo:

- **Validación:** ≥80% aciertos predicción LP role + al menos 1 contraejemplo de cada tipo en § Predicción discriminante + counter-hipótesis cohorte descartada.
- **Refutación:** <50% aciertos, o cohorte gana sistemáticamente.
- **Estado intermedio:** 50-80% acierto, Fase 3 requerida.

**Cómputo de aciertos (v0.2).** El porcentaje de aciertos se calcula **sólo sobre los campos predichos no-`unknown`**. Las abstenciones (`abstained → resolved`) no entran en numerador ni denominador de accuracy; se trackean por separado como **tasa de abstención**, que es señal en sí misma (abstención alta = prior del operador débil para esa clase de stub; ver `phase2/PROTOCOL_EVAL_01_supabase.md` § C2).

## Secuencia operativa

1. Commit de este archivo (`PHASE2_PROTOCOL.md`).
2. Crear `phase2/supabase/A_prediction.md`.
3. Commit de Fase A Supabase.
4. Abrir research de Supabase (NO antes).
5. Crear `phase2/supabase/B_classification.md`.
6. Commit de Fase B.
7. Crear `phase2/supabase/C_comparison.md`.
8. Commit final del stub.
9. Evaluar protocolo (no taxonomía) tras Supabase. Ajustes al protocolo, si los hay, se aplican antes del segundo stub.
10. Repetir con el siguiente stub adversarial.

## Supabase como shakedown del protocolo

Supabase es el primer stub porque tensiona LP detonante/defensor (sin relicensing — LP ausente esperado), Strategy v0 (`Dual-Native Design` working hypothesis vs `Commercialization Pivot` rival), y Distribution Posture (`cloud-first` vs `dual-path`).

Pero el primer riesgo no es que Supabase rompa la taxonomía. Es que Supabase rompa el protocolo (campos ambiguos, predicción imposible de hacer sin contaminar, criterio de Taxonomy Stress mal definido). Si el protocolo tiene defectos, descubrirlos con N=1 ahorra rehacer 5.

**Regla derivada:** después de Supabase se evalúa el protocolo. Cualquier ajuste al protocolo se aplica antes del siguiente stub. La taxonomía no se toca.
