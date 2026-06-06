# Supabase — Phase 2C Comparison (prediction vs result)

Opened: after Phase 2B closed with commit 1a8bca9 (isolation honored)
Created: 2026-06-06T15:29:15+0000

## Comparison table

| Field | Predicted (A) | Observed (B) | Outcome |
|---|---|---|---|
| LP role | `unknown` (abstained) | `absent` | **abstained → resolved** (no predictive credit/debit) |
| Cohort | `post-pattern` | `post-pattern` (founded 2020) | **MATCH** |
| Trajectory | `unknown` (abstained) | `native` | **abstained → resolved** |
| Distribution Posture | `cloud-first` | `cloud-first` | **MATCH** |
| Primary Strategy | `unknown` (abstained) | `DND` | **abstained → resolved** |
| Taxonomy stress | `mild ambiguity` | `mild ambiguity` | **MATCH** |
| Surprising result (LP clearly primary) | named as the thing that would surprise | did not occur | no surprise |
| Fourth scenario (value capture outside taxonomy) | named ex-ante | did not emerge | taxonomy held |

## Nota interpretativa

La predicción fue deliberadamente abstention-heavy: 3 de 5 campos (LP role, Trajectory, Primary) se predijeron `unknown` por honestidad ("guessing is worse than missing"). Esto es el protocolo funcionando como fue diseñado — mide el prior real, no la capacidad de adivinar — pero tiene una consecuencia: **el contenido falsable de esta predicción fue bajo**. Las dos apuestas no triviales que sí se hicieron (cohort `post-pattern`, posture `cloud-first`) acertaron ambas, y el "resultado sorprendente" nombrado (LP primaria y dominante) no ocurrió.

Conclusión honesta: Supabase fue un buen **shakedown del PROTOCOLO** (ejerció la maquinaria de predicción → clasificación → comparación end-to-end) pero un **test débil del poder predictivo del operador**, porque la mayoría de los campos fueron abstenciones. No corresponde leer esto como "predicción validada"; corresponde leerlo como "el protocolo corre y la clasificación resolvió sin forzar". El test fuerte de la hipótesis LP llega cuando se acumulen stubs con prior no trivial y LP presente.

Una observación a favor de la taxonomía (no parte del scoring): el caso instanció limpio la ortogonalidad Strategy ⊥ Posture (DND + cloud-first sin contradicción). Es evidencia consistente con el frame multidimensional, N=1, no promovible a validación.
