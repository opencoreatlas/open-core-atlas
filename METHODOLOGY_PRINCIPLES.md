# Methodology Principles — Side Project Hunt

Reglas metodológicas cross-cutting que aplican a cualquier investigación o evaluación dentro del Hunt (Atlas, Wedge A, futuros side projects, frameworks de scoring, validación de hipótesis).

Distintos de `VENTURE_ENGINE_AMENDMENTS.md`, que codifica filtros operacionales binarios PASS/FAIL para evaluar ideas concretas de side projects. Estos principios son disciplina epistemológica, no decisiones de gate.

Cada principio se documenta atómicamente con regla, why, how to apply, y origen. Patrón análogo al de las memory feedback files.

---

## 1. Frame-level lock during evaluation

**Regla:** una fase de evaluación no tiene permiso para modificar la taxonomía, el framework, o el criterio de medición que aplica. Sólo puede producir evidencia para próximas fases. El instrumento se mantiene fijo durante la medición.

**Why:** evita overfit a la evidencia que motivó la propuesta de cambio. Cuando una fase descubre un patrón que sugiere refinar el framework, el patrón sirve para FORMULAR la hipótesis del refinamiento, no para CODIFICARLO retroactivamente sobre la misma evidencia que lo sugirió. La distinción es entre "una explicación elegante sobre N observaciones" (overfit) y "una hipótesis que predice correctamente fuera del conjunto que la generó" (descubrimiento de estructura real).

**How to apply:**
- Los refinamientos de taxonomía / framework / criterio deben generarse en fase N y ser validados con **evidencia nueva** en fase N+1 antes de codificarse como amendment.
- Una hipótesis emergente puede convivir con el instrumento congelado: se documenta como candidata, se usa para predecir ex-ante en la fase siguiente, y gana derecho a amendment sólo si predice correctamente fuera del conjunto que la generó.
- La predicción ex-ante debe registrarse ANTES de medir el caso nuevo. Predecir ex-post invalida el experimento.
- Es generalización del principio Atlas-internal "el record no tiene permiso para cambiar la taxonomía" (validado 2026-05-31 durante Fase 1 de Stub Reclassification): mismo principio aplicado a niveles superiores de análisis (fases, ciclos de hunt, frameworks completos).

**Origen:** generalizado del principio Atlas-internal "el record no tiene permiso para cambiar la taxonomía" durante el cierre formal de Fase 1 de Validación de `STRATEGY_TAXONOMY_v0.md`, 2026-05-31. Ver `Side Project Hunt/open-core-atlas/analysis/TAXONOMY_v0_PHASE_1_CLOSING.md` para el caso fuente y `Side Project Hunt/open-core-atlas/HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` para el ejemplo concreto de una hipótesis emergente que convive con instrumento congelado.

---

(futuros principios se agregan abajo con el mismo formato atómico: regla, why, how to apply, origen)
