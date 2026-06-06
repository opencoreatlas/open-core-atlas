---
name: Atlas Strategy Taxonomy v0
version: 0.1
date: 2026-05-31
status: working
related:
  - HYPOTHESIS_v2.md
  - HUNT_STATUS.md (Re-opening 2026-05-31)
  - open-core-atlas/METHODOLOGY.md
  - open-core-atlas/schema/controlled-vocabularies.yaml
---

# Atlas — Strategy Taxonomy v0

## Marco multidimensional

Atlas clasifica cada compañía en **3 dimensiones ortogonales**. Las tres dimensiones no son intercambiables ni reducibles entre sí.

| Dimensión | Qué captura | Naturaleza |
|---|---|---|
| Strategy | Mecanismo principal de captura de valor económico | Decisión estructural del modelo de negocio |
| Distribution Posture | Qué rutas existen hoy y cuáles son production-grade | Estado observable hoy |
| Trajectory | Si el estado actual es el original o producto de cambios | Histórico |

Dos compañías pueden compartir Distribution Posture y tener Strategies distintas, y viceversa. Colapsar dimensiones pierde resolución.

---

## Dimensión 1 — Strategy (categorías v0)

### 1. Licensing Pivot
**Definición.** Captura valor modificando la licencia del core previamente abierto.

**Pregunta del founder:** "¿Cuándo dejo de ser abierto?"

**Indicadores.**
- Relicensing OSS → source-available (BSL, SSPL, FSL, ELv2, etc.)
- Restricciones de uso comercial
- Nuevas obligaciones para proveedores SaaS competidores

**Ejemplos (working hypothesis — no validados).**
- MongoDB (primary)
- CockroachDB (primary)
- Sentry (primary)
- Grafana (secondary)

### 2. Governance Gating
**Definición.** El core permanece utilizable, pero capacidades críticas para operación empresarial quedan fuera del OSS.

**Pregunta del founder:** "¿Qué partes dejo abiertas y cuáles protejo?"

**Indicadores.**
- SSO / SAML
- RBAC avanzado
- Audit logs
- Compliance frameworks
- Enterprise support tier

**Ejemplos (working hypothesis).**
- Grafana (primary)
- Sentry (secondary)
- MongoDB (secondary)

### 3. Tiered from Inception
**Definición.** La segmentación OSS/comercial existe desde día 1. Nunca hubo transición.

**Pregunta del founder:** "¿Cómo diseño la frontera OSS/comercial desde el inicio?"

**Indicadores.**
- Dual-licensing CE/EE desde el origen
- Features enterprise gated estructuralmente desde fundación
- No hay momento histórico de relicensing ni de re-gating

**Exclusion.** Si hubo pivot de licencia o ampliación significativa del gating, no es Tiered from Inception — es Licensing Pivot o Governance Gating.

**Ejemplos (working hypothesis).**
- GitLab

### 4. Commercialization Pivot
**Definición.** El código permanece abierto, pero la experiencia recomendada y económicamente viable se desplaza hacia el servicio gestionado.

**Pregunta del founder:** "¿Cuándo desplazo el centro de gravedad económico hacia managed?"

**Indicadores.**
- Self-host deprecado o desalentado
- Cloud-first explícito en docs y comunicaciones
- Nuevas capacidades lanzadas primero o exclusivamente en cloud
- Fricción operativa creciente fuera del SaaS

**Ejemplos (working hypothesis).**
- PostHog

### 5. Dual-Native Design
**Definición.** Diseña self-host y managed cloud como rutas first-class desde el origen, sin que ninguna funcione como versión degradada de la otra y sin requerir un pivot posterior para monetizar.

**Pregunta del founder:** "¿Cómo balanceo self-host y managed desde día 1?"

**Indicadores (inclusion).**
- Ambas rutas existen desde temprano
- Ambas son viables para producción
- La monetización surge de conveniencia operativa, no de degradación deliberada del self-host

**Exclusion.**
- Self-host degradado para empujar cloud → Commercialization Pivot
- Cloud como única ruta seria → Commercialization Pivot
- Feature gating estructural OSS/Enterprise → Tiered from Inception
- Cambio de licencia como mecanismo principal → Licensing Pivot

**Ejemplos (working hypothesis).**
- Supabase
- Cal.com

---

## Dimensión 2 — Distribution Posture

Estado observable hoy. Independiente de Strategy y Trajectory.

| Valor | Definición |
|---|---|
| `cloud-only` | Única ruta production-grade es managed |
| `cloud-first` | Ambas existen pero cloud es la recomendada/promocionada |
| `dual-path` | Ambas first-class, ninguna degradada |
| `self-host-first` | Self-host es la recomendada, cloud es complemento |

**Nota.** Distribution Posture puede cambiar en el tiempo sin cambiar la Strategy.

---

## Dimensión 3 — Trajectory

Cómo llegó la compañía al estado actual.

| Valor | Definición |
|---|---|
| `native` | Estado actual desde día 1 |
| `pivot` | Cambio estructural significativo (relicensing, posture shift mayor) |
| `evolving` | Transición observable, no cerrada |

---

## Reglas de clasificación

### Regla 1: Primary vs Secondary Strategy

- Cada record tiene **exactly 1 Primary Strategy** (forced choice — apuesta falsable).
- Puede tener **0..N Secondary Strategies**.
- Distribution Posture: **exactly 1**.
- Trajectory: **exactly 1**.

Forced choice de Primary obliga a hacer la apuesta sobre cuál estrategia explica más de la captura de valor. Sin forced choice, una compañía multi-estrategia cuenta para varias categorías y se pierde resolución analítica.

### Regla 2: Orden de captura

Por record, las dimensiones se completan en este orden:

1. **Trajectory** (más observable, menos interpretación)
2. **Distribution Posture** (observable hoy)
3. **Primary Strategy** (forced choice, requiere análisis)
4. **Secondary Strategies** (0..N)

**Prohibición operativa.** No se puede completar Primary Strategy antes de completar Trajectory y Distribution Posture. Esto previene el encastre retrospectivo (decidir la strategy primero y después doblar las otras dimensiones para encajar).

### Regla 3: Working hypothesis vs validated classification

Ningún record recibe clasificación definitiva hasta pasar el ciclo completo de research (Definition of Done de 10 puntos en `open-core-atlas/METHODOLOGY.md`).

Las clasificaciones pre-research son **working hypotheses**:

- No cuentan para métricas.
- No cuentan para síntesis.
- No se citan en outputs públicos.
- Se etiquetan explícitamente como `working_classification` en el record.

Esto previene que priors del autor se conviertan en datos validados.

### Regla 4: Nacimiento de nueva strategy

Una nueva strategy sólo nace cuando un record no puede clasificarse honestamente dentro de ninguna existente.

- No nace porque observamos algo raro.
- Nace cuando la taxonomía falla.

Toda strategy nueva requiere:
- Definición operativa.
- Indicadores de inclusion.
- Indicadores de exclusion (frontera con strategies vecinas).
- Pregunta del founder asociada.
- Mínimo 1 ejemplo validado.

Esto previene proliferación de categorías ad-hoc (hindsight bias en otra dimensión).

---

## Hipótesis abiertas sobre la taxonomía

Sospechas no validadas que la v0 deja explícitas:

- Las 5 strategies probablemente no son exhaustivas. Más strategies emergerán cuando records concretos las fuercen (Regla 4).
- Distribution Posture probablemente necesite más granularidad cuando se clasifiquen 10+ records.
- Trajectory puede necesitar sub-tipos (ej: pivot único vs pivots múltiples, pivot incompleto).

**Estas hipótesis no se resuelven proactivamente. Se resuelven cuando un record concreto las fuerza.**
