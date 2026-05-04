# The 7 Hypotheses

The Open Core Atlas tests seven testable claims about commercial open source software economics. Each hypothesis is **falsifiable**: we expect the data to support some and refute others. Counter-evidence is at least as valuable as confirmation.

---

## H1 — License migration is trend, not exception

**Claim:** Among COSS companies that have raised USD 50M+, more than 35% have changed their primary license at least once during their lifetime.

**Why it matters:** Founders typically choose their first license expecting it to be permanent. If migration is a >35% phenomenon at scale, license should be considered a strategic decision subject to revision, not a foundational commitment.

**Test:** For each company with `identity.total_raised_usd >= 50_000_000`, check whether `license.primary_first` differs from `license.primary_current`. Compute ratio.

**Failure case:** If ratio is <20%, license is genuinely sticky for most. The "license fluidity" narrative inverts.

**Companies serving as test cases:** MongoDB, CockroachDB, Grafana, Sentry, PostHog, n8n, Airbyte, Directus, Mattermost.

---

## H2 — SSO/SAML is the universal gating feature

**Claim:** More than 85% of open core companies in the dataset gate SSO/SAML to commercial tier.

**Why it matters:** Founders deciding what to gate need an anchor. SSO is hypothesized to be the most consensus-gated feature, useful as a reference point for "what is normal to gate".

**Test:** Among companies with `commercial_model.type ∈ {pure-open-core, hosted-first, hybrid}`, compute share with `feature_gating.sso_saml = "commercial"`.

**Failure case:** If <70%, gating consensus is weaker than the narrative suggests. Useful counter-evidence for founders making feature decisions.

**Companies serving as edge cases:** Authentik (auth product itself — SSO is the product), Plausible (might not have SSO at all in product).

---

## H3 — AI infrastructure companies post-2023 skip the open-core dance

**Claim:** Among AI infra companies founded 2022 or later, fewer than 30% follow the classical "pure-open-core" model. Most go OSS-first permissive (no commercial features behind license) or SaaS-first (commercial primary).

**Why it matters:** If true, this suggests a generational shift in how open source businesses build a commercial layer — newer companies skipping the staged commercialization model classic OSS companies followed.

**Test:** Among `category = "ai-infra"` AND `identity.founded_year >= 2022`, share with `commercial_model.type = "pure-open-core"`.

**Failure case:** If >50%, AI infra is following the classic playbook. The generational shift narrative inverts.

**Companies serving as test cases:** Hugging Face, LangChain, Mistral AI.

---

## H4 — Cloud entry pricing converges to USD 25-99/month

**Claim:** Median `pricing.cloud_entry_price_usd_month` across the dataset is USD 25-99, regardless of category.

**Why it matters:** Founders pricing their first cloud tier often anchor on competitor-watching. A category-agnostic median is a useful anchor.

**Test:** Compute median entry price across full dataset. Also compute per-category medians and report variance.

**Failure case:** If median is <USD 15 or >USD 150, the "cloud entry pricing convergence" narrative is too clean. Bands may be wider than assumed.

---

## H5 — Databases and observability dominate license relicensing

**Claim:** More than 60% of license-change events in the dataset occur within `category ∈ {databases, observability}`.

**Why it matters:** Implies cloud-monetization-pressure (the canonical reason for relicensing) is category-specific, not universal. Founders in other categories may not face the same pressure.

**Test:** Count license-change events. Among events, share with parent company in {databases, observability}.

**Failure case:** If <50%, relicensing is more spread across categories. Pressure is broader. Directus (CMS, BSL 2024) is the key potential refuter.

---

## H6 — Time-to-commercial varies 4× by funding stage

**Claim:** Companies with `total_raised_usd >= 50_000_000` have median 12-18 months between OSS launch and first commercial offer; companies with `total_raised_usd <= 5_000_000` have median 24-36 months.

**Why it matters:** Capital accelerates commercialization. Founders deciding whether to raise can use this as a heuristic for expected timeline shift.

**Test:** Estimate "OSS launch" date from earliest commit / first GitHub release. Estimate "first commercial offer" from press release / first cloud tier introduction. Compare medians by raised tier.

**Failure case:** If medians are within 6 months of each other, capital is less determinative than the narrative suggests.

**Companies serving as edge cases:** Plausible (bootstrapped, slow commercialization expected), Ghost (foundation/nonprofit, different commercialization model entirely).

---

## H7 — Permissive licenses dominate AI infra; copyleft and source-available dominate databases/observability/security

**Claim:** Within `category = "ai-infra"`, more than 70% use Apache 2.0, MIT, or BSD. Within `category ∈ {databases, observability, security}`, fewer than 40% use these permissive licenses.

**Why it matters:** Suggests license choice is vertical-specific, driven by community expectations and category-specific incentives (defensibility against hyperscalers in databases vs. ecosystem leverage in AI).

**Test:** Per category, compute share of companies with `license.primary_current ∈ {Apache-2.0, MIT, BSD-3-Clause}`.

**Failure case:** If AI infra permissive share <50% or DB/obs/security >60%, the vertical pattern is weaker than claimed.

**Companies serving as test cases:** Hugging Face, LangChain, Mistral (permissive AI), MongoDB, CockroachDB (source-available DB), Grafana, Sentry (source-available obs), Falco, OPA (Apache security — counter-evidence!).

---

## Counter-evidence requirement

The Atlas dataset is curated to balance hypothesis-confirming and hypothesis-refuting cases. For each H, the 30-company sample includes at least 4 companies that could serve as counter-evidence. Confirmation bias is mitigated by:

1. **License-change history** includes both pre-2020 (older defensive moves) and 2024+ (recent moves) — not only the famous 2018-2019 wave.
2. **AI infra** category includes Mistral (commercial models alongside OSS) as a hybrid case, not only pure-permissive examples.
3. **Bootstrapped/sustainable** companies (Plausible, Ghost) test H6 from outside VC dynamics.
4. **Counter-vertical examples** (Falco, OPA in security with permissive licenses) test H7's strength.

If the data significantly refutes a hypothesis, **that finding becomes the headline of the analysis section** — refutation is more useful than confirmation.

---

## Reporting format

Each hypothesis gets one analysis writeup in `analysis/h{N}_{slug}.md` with:
- The original claim
- The test methodology
- The data result (with N, percentage, confidence as applicable)
- The interpretation (confirmed / refuted / partial / inconclusive)
- The implication for founders/VCs/leaders making decisions

Visualizations live in `visualizations/h{N}_*.svg` — one chart per hypothesis.
