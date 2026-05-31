# Strategy Taxonomy v0 — Fase 1 de Validación: Cierre formal

**Fecha:** 2026-05-31
**Estado:** CERRADA
**Outcome:** DESCUBRE ESTRUCTURA
**Records procesados:** 5/5 (MongoDB, Grafana Labs, Sentry, PostHog, CockroachDB)

> Nota sobre nomenclatura: esta "Fase 1" se refiere a la primera fase de validación de `STRATEGY_TAXONOMY_v0.md` mediante re-clasificación adversarial de stubs existentes. NO se refiere a las Phase 1-7 de research por record definidas en `METHODOLOGY.md` ni en `templates/company-research-template.md`.

---

## Objetivo declarado al inicio

Re-clasificar 5 stubs del Atlas contra `STRATEGY_TAXONOMY_v0.md` (3 dimensiones ortogonales: Strategy, Distribution Posture, Trajectory) usando método adversarial, para evaluar si la taxonomía v0 sobrevive al contacto con la evidencia.

**Criterio pre-comprometido:** ≥4 records CONFIDENT en Primary Strategy → la taxonomía aguanta; ≤3 CONFIDENT → rota.

**Regla operativa pre-comprometida:** los records pueden generar evidencia, no cambiar la taxonomía. El instrumento se mantiene fijo durante la medición. ("MongoDB no tiene permiso para cambiar la taxonomía. MongoDB sólo tiene permiso para generar evidencia.")

## Método

Clasificación adversarial por dimensión, con apuesta forzada en Primary Strategy (Regla 1 del taxonomy v0), auto-ataque sistemático sobre cada apuesta, y verdict pre-comprometido. Concedidos los puntos críticos del clasificador adversario sin defender débilmente; aguantados los matices con evidencia.

Orden de captura por record: Trajectory → Distribution Posture → Primary Strategy → Secondary Strategies, per Regla 2 del taxonomy v0.

## Resultados finales (post-correcciones adversariales)

| Record | Trajectory | Posture | Primary | LP role |
|---|---|---|---|---|
| MongoDB | pivot ✅ | cloud-first ✅ | DISPUTED LP ↔ CP | defensor de Atlas/CP |
| Grafana | pivot ✅ | DISPUTED cloud-first ↔ dual-path | DISPUTED LP ↔ GG | defensor de GG/Enterprise |
| Sentry | pivot ✅ | DISPUTED cloud-first ↔ dual-path | DISPUTED LP ↔ GG | defensor de SaaS preexistente |
| PostHog | pivot (no-license) ✅ | cloud-first ✅ | **CONFIDENT (CP)** | ausente |
| CockroachDB | pivot ✅ | self-host-first ✅ | **CONFIDENT (LP)** | detonante (CSL = mecanismo) |

**Primary Strategy CONFIDENT count: 2/5.** Criterio original ≥4 → no alcanzado.

## Verdict re-evaluado: DESCUBRE ESTRUCTURA (no ROTA, no SOBREVIVE)

El criterio original ≥4 CONFIDENT no es la pregunta correcta retrospectivamente. Ese criterio fue escrito antes de descubrir el problema. El problema descubierto:

> La categoría "Licensing Pivot" definida en v0 está **internamente heterogénea**: agrupa dos fenómenos cualitativamente distintos.

Cuando un record tiene LP como **defensor** de una captura preexistente, la dimensión Primary Strategy v0 empata sistemáticamente entre LP y la strategy defendida → DISPUTED. Cuando un record tiene LP **ausente** o **detonante** (la licencia ES el mecanismo de captura), la dimensión genera decisión única → CONFIDENT.

Una taxonomía rota requiere reemplazo. Una categoría internamente heterogénea requiere división. No es lo mismo.

### El evento estructural de la fase

CockroachDB es el punto de inflexión. Hasta PostHog (record 4/5) la evidencia admitía una explicación trivial: "LP simplemente vuelve ambigua cualquier clasificación" (porque LP-presente y DISPUTED estaban perfectamente colineales: 3/3 LP-presente → DISPUTED, 1/1 LP-ausente → CONFIDENT, indistinguible de causalidad accidental por singularidad de PostHog).

CockroachDB destruye esa explicación. Con LP **presente** y Primary **CONFIDENT** (porque el CSL 2024 no defendió un mecanismo preexistente — cambió el mecanismo de captura de feature-gating a revenue-threshold-gating, usando la licencia como instrumento de tier discrimination), demuestra que la frontera no es presencia/ausencia de LP, sino su **rol direccional**.

### Patrón final (sin aplicar fix, sólo describiendo lo observado)

| LP role observado | Primary state observado | n |
|---|---|---|
| ausente | CONFIDENT | 1 |
| defensor | DISPUTED | 3 |
| detonante | CONFIDENT | 1 |

3 + 1 + 1 = 5. Consistencia direccional 5/5 **ex-post**. No prueba la hipótesis emergente — es el conjunto que la generó.

## Conclusiones de la fase

**Phase 1 Conclusion:** The most important output of this phase is not a validated taxonomy. It is a hypothesis that earned the right to be attacked.

**Phase 1 Conclusion:** There is sufficient observable structure to justify continuing the search for a map of the space.

La Fase 1 no respondió "¿existe un mapa del espacio de estrategias de captura COSS?". Respondió algo más modesto y más operativo: existe suficiente estructura observable para justificar seguir buscando el mapa.

El valor de la fase no es la clasificación de ninguna compañía particular. Es haber llegado a una variable explicativa nueva (LP detonante vs LP defensor) que no existía al comenzar el experimento, falsable, y con poder predictivo demostrable a N=5 al menos en el sentido de romper la colinealidad LP-presente↔DISPUTED.

## Lo que NO se concluye

- La taxonomía v0 **NO** es declarada validada. 2/5 CONFIDENT no la habilita.
- La hipótesis emergente LP detonante vs defensor **NO** es declarada demostrada. Es la **mejor explicación candidata** para el patrón N=5 observado. Hay una explicación rival activa ("cohorte histórica") que sigue viva (ver `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md` § Counter-hipótesis).
- **Ningún amendment** al schema, `controlled-vocabularies.yaml`, o `STRATEGY_TAXONOMY_v0.md` se escribe en este cierre. Fase 1 no tiene permiso (ver `Side Project Hunt/METHODOLOGY_PRINCIPLES.md` § Frame-level lock).

## Próximo paso (Fase 2 setup)

1. Re-clasificar los 30 stubs existentes contra `STRATEGY_TAXONOMY_v0.md` **sin fix**.
2. Por cada stub: registrar **predicción ex-ante** del LP role esperado (ausente / defensor / detonante) **ANTES** de clasificar Primary. Pre-compromete la hipótesis emergente a ser falsable.
3. Registrar también año de fundación y predicción ex-ante por la hipótesis cohorte rival; luego comparar con el resultado real para discriminar entre las dos hipótesis.
4. Después de N=10 stubs adicionales con LP presente, evaluar criterios de validación / refutación / promoción a amendment definidos en `HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md`.

## Links

- Hipótesis emergente: [../HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md](../HYPOTHESIS_LP_DETONANTE_VS_DEFENSOR.md)
- Regla metodológica generalizada: `Side Project Hunt/METHODOLOGY_PRINCIPLES.md` § "Frame-level lock during evaluation"
- Taxonomía bajo test: `Side Project Hunt/STRATEGY_TAXONOMY_v0.md` (**congelada hasta nueva evidencia en Fase 2**, no modificar)
- Hipótesis Atlas-internal vigente: `Side Project Hunt/HYPOTHESIS_v2.md` (la del pivot Atlas-internal 2026-05-31, ortogonal a esta fase)
