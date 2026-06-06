# n8n — Phase 2B Classification

Status: CLOSED (committed)
Phase A re-read during B: NO (isolation rule honored — never opened A_prediction.md; classifier blind to the predicted hypothesis per PHASE2_PROTOCOL v0.3 § Separación de roles)
Evidence opened: YES (classifier opened its own evidence; sources listed in § 0)
Classification author: Claude (Classifier role, Fase B)
Created: 2026-06-06T16:13:00+0000

> Regla de aislamiento (PHASE2_PROTOCOL § Fase B + § Separación de roles v0.3): esta clasificación responde "¿qué veo en los datos?", no "¿se confirma una predicción?". El Classifier no leyó `A_prediction.md` ni vio la predicción concreta en ningún medio. La hipótesis LP no participa de la elección de Primary Strategy.

---

## 0. Anchor data (evidence)

- **stub:** n8n
- **Founded:** 2019, by Jan Oberhauser, Berlin (n8n GmbH). First public commits June 2019; platform launched October 2019. Funding trail: seed Mar 2020 (Sequoia/firstminute), Series A Apr 2021 ($12M), Series B Mar 2025 (€55M), Series C Oct 2025 ($180M, ~$2.5B valuation). *(Wikipedia "N8n"; TechCrunch 2020-03-13 & 2021-04-26.)*
- **License at launch (Oct 2019):** **Apache 2.0 + Commons Clause** — explicitly **not** OSI-approved open source. n8n called itself "open-source" (in quotes) from day 1 and coined the term **"fair-code"** to describe a source-available-but-commercially-restricted model. *(n8n blog "fair-code…"; community.n8n.io "A new license for n8n"; Wikipedia.)*
- **Relicensing event:** **YES — 17 March 2022**, Apache 2.0 + Commons Clause → **Sustainable Use License (SUL)**, which n8n based on Elastic License 2.0. SUL permits use/modify/redistribute but restricts use to internal business purposes (or non-commercial/personal), and redistribution only free-of-charge for non-commercial purposes; core competitive restriction = you may not resell n8n as a competing managed service. *(docs.n8n.io/sustainable-use-license; blog.n8n.io/announcing-new-sustainable-use-license; GitHub issue #2932.)*
- **Self-host vs managed cloud:** Self-hosted **Community Edition** is free, with **unlimited executions** and the full integration catalog; it is **production-grade** (documented queue mode: main instance + Redis broker + worker processes for scale-out). Managed **n8n Cloud** is paid convenience hosting (~€24–€800/mo by execution volume). *(n8n.io/pricing; docs.n8n.io/choose-n8n; docs.n8n.io/hosting/scaling/queue-mode.)*
- **Monetization mechanism:** (a) managed Cloud subscriptions; (b) **paid feature gating** — SSO/SAML, RBAC, Git version control, multiple environments, log streaming and other enterprise/ops features are locked behind a Business/Enterprise **license key** (required even on self-host; the key pings n8n's license server daily); (c) the SUL relicensing as a defensive moat protecting the managed-service business from competitors. *(n8n.io/pricing; docs.n8n.io/choose-n8n.)*

### Negatives validated explicitly
- **"No relicensing"** → **FALSE.** Documented relicensing on 2022-03-17.
- **"Self-host degraded / deprecated to push cloud"** → **FALSE.** Community Edition is free, unlimited-execution, production-grade; this rules out Commercialization Pivot.
- **"Core was previously OSI-open"** → **FALSE.** n8n was Commons-Clause / fair-code from launch; it was *never* OSI open source. (Key finding — see § 5.)
- **"Enterprise feature gating absent"** → **FALSE.** SSO, RBAC, Git, multi-environment, log streaming are gated behind a paid license.

---

## 1. Trajectory

**Value:** `pivot`

Evidence: a documented relicensing event occurred on 2022-03-17 (Apache 2.0 + Commons Clause → Sustainable Use License). The taxonomy explicitly lists "relicensing" as a pivot trigger. Caveat carried to § 5: the pivot was *within* the fair-code / source-available regime (restricted → more-restricted), not the canonical open → source-available transition, so a `native` reading (commercial-restriction intent present since day 1, 2022 being a license-text refinement) is defensible. Literal relicensing event → `pivot`.

---

## 2. Distribution Posture

**Value:** `dual-path`

Evidence: both routes are production-grade and neither is a degraded version of the other. Self-host Community Edition runs production workloads (queue mode, Redis, horizontal workers) with unlimited executions and the full node catalog; managed Cloud is a paid convenience layer. Mild lean toward `self-host-first` is arguable (free unlimited self-host is the heart of the community), but Cloud is first-class and heavily promoted, and enterprise/governance features are gated on *both* routes equally — so neither route is degraded → `dual-path`.

---

## 3. Primary Strategy

**Value:** `GG` (Governance Gating) — estado: **DISPUTED** (genuine competition from LP; see below)

Evidence (inclusion): the free tier (self-host CE and Cloud Starter) keeps the **core automation engine fully usable**, while exactly the enterprise-operational capabilities named in the GG indicators — **SSO/SAML, RBAC, audit/log streaming, plus Git version control and multiple environments** — are gated behind a paid Business/Enterprise license key. This is the direct mechanism that converts the large free user base into paying customers: customers pay to unlock governance/ops features, not to remove a license restriction.

Why **DISPUTED**, not CONFIDENT: Licensing Pivot (LP) is a serious competing primary claim. n8n executed a real, dated relicensing (2022-03-17) whose explicit, stated purpose was commercial value-protection (blocking competitors from reselling n8n as a managed service). One can read LP as the primary value-capture decision and GG as the conversion tactic underneath it. I lean GG because the relicensing is *defensive* (protects revenue) whereas the feature gating is the *active* economic engine — but the call between GG-primary and LP-primary is contestable on the evidence, so the honest state is DISPUTED.

---

## 4. Secondary Strategies

- **LP (Licensing Pivot)** — the 2022-03-17 relicensing to SUL functions as a real value-protection mechanism. Carries a definitional caveat (§ 5): LP's "core previously open" precondition is not strictly met.
- *(Considered and rejected as a category:)* a "managed-convenience" element exists (Cloud hosting), but it does **not** map to Commercialization Pivot because self-host is production-grade, not deprecated; and it does not satisfy Dual-Native Design because DND's exclusion clause rules out a company whose monetization involves a licensing change ("Cambio de licencia como mecanismo principal → Licensing Pivot"). So no third secondary is asserted.

---

## 5. Taxonomy Stress

**Value:** `ambiguo leve` (with one named fourth-scenario candidate for Fase 3)

Two distinct stresses surfaced:

1. **LP precondition gap (the substantive finding).** The Licensing Pivot category is defined as "captura valor modificando la licencia del core **previamente abierto**," with indicator "Relicensing **OSS → source-available**." n8n never had an OSI-open core: it shipped under Apache 2.0 **+ Commons Clause** (already source-available / commercially restricted) from launch, and in 2022 tightened to SUL. So n8n's move was **source-available → more-restrictive source-available**, not open → source-available. The taxonomy v0 has no clean slot for *"born fair-code / never OSI-open, later tightened."* This is a candidate **fourth scenario** the taxonomy does not name — logged here per protocol even though the stub still classifies (it counts as evidence on the taxonomy's explanatory power, not as a reason to abstain).

2. **Trajectory pivot/native ambiguity.** Because the commercial-restriction intent predates the 2022 relicensing, `pivot` (literal relicensing) and `native` (model unchanged in spirit) are both defensible. Resolved to `pivot` on the literal event, but the ambiguity is real.

Net: the company is still placeable (Trajectory `pivot`, Posture `dual-path`, Primary `GG`/DISPUTED, Secondary `LP`) — it is not a "could-go-anywhere" case — so the stress is **leve**, not severe or UNCLASSIFIABLE. The LP-precondition gap is the item worth carrying forward.

---

## 6. Working classification flag

`working_classification: true` — per Strategy Taxonomy v0 Regla 3, this pre-full-research classification does not count for metrics, synthesis, or public outputs until the 10-point Definition of Done is met.

**timestamp:** 2026-06-06T16:13:00+0000
