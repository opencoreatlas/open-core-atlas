---
name: hypothesis-lp-detonante-vs-defensor
status: candidate (not validated)
created: 2026-05-31
generated_by: open-core-atlas Taxonomy v0 Phase 1 Reclassification (N=5)
related:
  - HYPOTHESES.md (parent registry of Atlas hypotheses)
  - ../STRATEGY_TAXONOMY_v0.md (taxonomy under test, frozen)
  - analysis/TAXONOMY_v0_PHASE_1_CLOSING.md (generation context)
  - ../HYPOTHESIS_v2.md (Atlas-internal pivot hypothesis 2026-05-31, ortogonal)
---

# Hipótesis emergente — Licensing Pivot: detonante vs defensor

## Status

**Candidata, NO validada.**

Permitido:
- Predecir ex-ante el LP role esperado de cada stub futuro antes de clasificarlo.
- Documentar si la predicción se cumple o no.
- Servir como una explicación entre varias para los patrones observados.

NO permitido:
- Usarse para clasificar (la clasificación se hace contra `STRATEGY_TAXONOMY_v0.md` **sin fix**).
- Promoverse a amendment del schema, de `controlled-vocabularies.yaml`, o de la taxonomía sin pasar los criterios de validación de Fase 2 (ver § Criterios abajo).

## Hipótesis principal

La categoría "Licensing Pivot" definida en `STRATEGY_TAXONOMY_v0.md` § Dimensión 1 — Strategy agrupa dos fenómenos cualitativamente distintos:

- **LP detonante:** el cambio de licencia **ES** el mecanismo principal de captura de valor. La licencia funciona como instrumento de tier discrimination, segmentación revenue-based, creación categorial de licensing, o reformulación estructural del modelo de monetización.
- **LP defensor:** el cambio de licencia **protege** otra captura preexistente (cloud SaaS, gating de features, posición de mercado, base de usuarios). La captura ocurre en otra dimensión; la licencia funciona como firewall legal contra cloud providers, fork comercial, o degradación competitiva.

La hipótesis predice tres ramas direccionales:

| LP role | Primary Strategy esperada | Confianza esperada |
|---|---|---|
| ausente | cualquier no-LP (CP, GG, TfI, DND) | CONFIDENT |
| defensor | la strategy defendida (CP, GG); LP queda Secondary | CONFIDENT |
| detonante | Licensing Pivot | CONFIDENT |

En las tres ramas, la forced choice de Primary Strategy puede generar decisión única **una vez que la frontera detonante/defensor está incorporada al criterio de elección**.

## Pregunta operacional (cómo aplicar la hipótesis)

Para cada record con relicensing en `license.license_history`:

> ¿La captura principal ocurre **porque** cambiaron la licencia, o la licencia **protege** una captura que ya existía?

**Test contrafáctico operacional:**

> Si el relicensing nunca hubiera ocurrido, ¿el mecanismo principal de captura habría seguido funcionando?
>
> - **Sí** — el mecanismo (cloud SaaS dominante, Enterprise gating activo, customer base + brand) habría seguido capturando valor con erosión gradual por cloud providers → **LP defensor**.
> - **No** — el mecanismo de captura **es** el cambio de licencia (revenue-threshold gating, tier discrimination via license keys, creación categorial de licensing, reformulación estructural) → **LP detonante**.

## Evidencia ex-post N=5 (Fase 1 — el conjunto que generó la hipótesis)

| Record | Año fundación | Relicensings | Test contrafáctico | LP role | Primary v0 sin fix | Primary con fix mental |
|---|---|---|---|---|---|---|
| MongoDB | 2007 | 1 (AGPL→SSPL 2018) | Atlas (lanzado 2016) habría seguido vendiéndose con erosión por DocumentDB | defensor | DISPUTED LP↔CP | CP |
| Grafana | 2014 | 1 (Apache→AGPL 2021) | Enterprise self-hosted (preexistente) + Cloud (lanzado 2019, pre-AGPL) habrían seguido vendiéndose | defensor | DISPUTED LP↔GG | GG |
| Sentry | 2012 | 2 (BSD→BSL 2019, BSL→FSL 2023) | SaaS preexistente desde 2012 + ee/-style gating preexistente | defensor | DISPUTED LP↔GG | GG |
| PostHog | 2020 | 0 (MIT desde el inicio) | n/a (no hubo relicensing) | ausente | CONFIDENT (CP) | CP |
| CockroachDB | 2015 | 2 (Apache→BSL 2019 defensor, BSL→CSL 2024 detonante) | CSL 2024 cambió la naturaleza del gate: de feature-gating (CCL) a revenue-threshold-gating + License Key obligatorio para todos. Sin CSL no existe el mecanismo de captura actual. | detonante (el pivot 2024 domina) | CONFIDENT (LP) | LP |

Observaciones:
- 3/5 LP defensor → 3/3 DISPUTED. Consistente con hipótesis.
- 1/5 LP ausente → 1/1 CONFIDENT. Consistente.
- 1/5 LP detonante → 1/1 CONFIDENT con LP como Primary. Consistente.

**Esta consistencia 5/5 es ex-post.** No prueba la hipótesis. Es el conjunto que la generó. La validación requiere predicción fuera de este conjunto.

## Counter-hipótesis activa (rival)

**Counter-hypothesis (founding cohort):** MongoDB (2007), Grafana Labs (2014) y Sentry (2012) constituyen una "cohorte histórica COSS" donde licensing, governance y commercialization co-evolucionaron durante 8-14 años antes de los pivots. PostHog (2020) y CockroachDB (2015) son post-pattern: nacieron con el patrón COSS resuelto en categorías más nítidas. Lo que la hipótesis principal lee como "LP detonante vs defensor" podría ser en realidad "founding cohort vs post-pattern cohort".

La counter-hipótesis predice que la frontera real es **edad de la compañía al momento del primer pivot** (o equivalentemente, "qué tan crystallized estaba el patrón COSS cuando la compañía nació"), NO el rol direccional del LP.

A N=5 ambas hipótesis explican igualmente bien el patrón observado, porque están confundidas: los 3 DISPUTED son simultáneamente "LP defensor" Y "compañías mayores fundadas pre-2015". Los 2 CONFIDENT son simultáneamente "LP no-defensor" Y "compañías post-2015 o sin relicensing".

## Predicción discriminante para Fase 2

Para distinguir las dos hipótesis se necesita encontrar al menos uno de estos dos contraejemplos en Fase 2:

1. **Record joven (founded ≥2018) con LP defensor → Primary DISPUTED.** Falsificaría parcialmente la counter-hipótesis cohorte (la juventud no garantiza nitidez) y confirmaría que la frontera es rol, no edad.
2. **Record viejo (founded ≤2012) con LP detonante → Primary CONFIDENT (LP).** Falsificaría parcialmente la counter-hipótesis cohorte (la antigüedad no garantiza heterogeneidad) y confirmaría que la frontera es rol, no edad.

**Resultados posibles de Fase 2:**

| Encuentro Fase 2 | Veredicto |
|---|---|
| Al menos un contraejemplo de cada tipo (1 y 2) | Hipótesis principal (rol direccional) gana. Counter-hipótesis cohorte refutada como explicación principal. |
| Ningún contraejemplo, y edad predice ≥80% de los casos | Counter-hipótesis cohorte gana. Hipótesis principal subsumida en confounding histórico. |
| Mezcla parcial (1 sí 2 no, o viceversa) | Ambas hipótesis explican parcialmente. Refinamiento adicional o Fase 3. |
| Hipótesis principal acierta <50% de LP roles | Hipótesis principal refutada independientemente de la cohorte. |

## Criterios de validación / refutación / promoción a amendment

**Validación** (gana derecho a amendment de `STRATEGY_TAXONOMY_v0.md`):
- Fase 2 evalúa ≥10 records adicionales con LP presente (defensor o detonante).
- Predicción ex-ante del LP role acierta en ≥80% de esos records.
- Al menos un contraejemplo de cada tipo en la § Predicción discriminante.
- Counter-hipótesis cohorte queda descartada como explicación principal por evidencia empírica.

**Refutación** (la hipótesis se mata, no se promueve):
- Predicción ex-ante del LP role acierta en <50% de records con LP presente.
- O sistemáticamente la edad predice mejor que el rol direccional (counter-hipótesis cohorte queda como mejor candidata).
- O cualquier contradicción interna no resoluble (e.g., un record con LP detonante claro y Primary DISPUTED estable post-Day-2 sanity).

**Estado intermedio** (sobrevive como candidata, no se promueve, Fase 3 requerida):
- Acierta en 50-80% pero la counter-hipótesis cohorte tiene poder explicativo equivalente.
- O el sample size de Fase 2 cierra antes de N=10 con LP presente.

## Próximos pasos operativos (Fase 2 setup)

1. Re-clasificar los 30 stubs existentes contra `STRATEGY_TAXONOMY_v0.md` **sin fix**.
2. Por cada stub: registrar **predicción ex-ante** de LP role (ausente / defensor / detonante) ANTES de clasificar Primary.
3. Registrar también: año de fundación, predicción ex-ante por la counter-hipótesis cohorte, y resultado real ex-post.
4. Después de N=10 stubs adicionales con LP presente, evaluar criterios de arriba.
5. NO modificar `STRATEGY_TAXONOMY_v0.md` durante Fase 2. La taxonomía permanece congelada (per `Side Project Hunt/METHODOLOGY_PRINCIPLES.md` § Frame-level lock).

## Limitaciones declaradas

- N=5 es muy chico. Cualquier patrón observado puede ser ruido.
- Las 5 compañías fueron seleccionadas pre-Fase 1 según la metodología de stubs de Atlas — no es muestra aleatoria.
- La clasificación adversarial dependió de juicio interpretativo en varios bordes (Sentry detonante vs defensor cambió mid-fase tras crítica adversarial, no es clasificación estable a primera lectura).
- Counter-hipótesis cohorte podría tener sub-hipótesis adicionales no exploradas (e.g., "founding category at incorporation: pure-OSS vs open-core-from-start").
- La hipótesis no dice nada sobre records sin relicensing más allá de "LP ausente → CONFIDENT esperado", lo cual es trivial.
