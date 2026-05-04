# Company Research — [COMPANY NAME]

**Slug:** `[company-slug]`
**Category:** `[databases | observability | devtools | ai-infra | security | data-pipeline | analytics-bi | workflow-orchestration | content-cms | niche-emerging]`
**Date started:** `YYYY-MM-DD`
**Status:** `pending → in-progress → verified → published`

---

## Phase 0 — Pre-research scan (5 min)

Quick orientation before deep dive:
- [ ] Skim company About page (1 min)
- [ ] Skim Wikipedia entry if exists (2 min)
- [ ] Skim Crunchbase (1 min)
- [ ] Note 1-line "what does this company do"

> **One-line description:** _______________________________

---

## Phase 1 — Identity (10 min)

Required fields:
- [ ] **Founded year** — source: ___________
- [ ] **HQ country** (ISO 3166-1 alpha-2: US, DE, FR, GB, etc.) — source: ___________
- [ ] **HQ city** — source: ___________
- [ ] **Funding stage** (controlled vocab) — source: ___________
- [ ] **Total raised USD** — source: ___________ + cross-check: ___________
- [ ] **Last valuation USD** or market cap — source: ___________
- [ ] **Is public** Y/N — source: ___________
- [ ] **Ticker** if public — source: ___________

Cross-source rule: total_raised_usd requires ≥2 independent sources.

---

## Phase 2 — License (15 min)

Required:
- [ ] Open primary repo on GitHub
- [ ] Open `LICENSE` or `COPYING` file
- [ ] **Primary license CURRENT** (SPDX identifier preferred) — source: ___________
- [ ] Open Wayback Machine, navigate to repo LICENSE for 2018-2020-2022-2024 — note any changes
- [ ] If license changes found:
  - [ ] **From license** — source: ___________
  - [ ] **To license** — source: ___________
  - [ ] **Year/month** of change
  - [ ] **Public rationale** (find blog post / press release) — source: ___________
- [ ] Check `CONTRIBUTING.md` or CLA bot config — **CLA required** Y/N
- [ ] **Dual license**? — note any second license offered

---

## Phase 3 — Commercial Model (10 min)

- [ ] Read company "/pricing" page or equivalent
- [ ] Classify type:
  - [ ] `pure-open-core` (OSS feature-complete + commercial features paid)
  - [ ] `hosted-first` (OSS real, revenue from hosted)
  - [ ] `hybrid` (multiple parallel commercial offerings)
  - [ ] `services-support` (revenue from services/support only)
  - [ ] `saas-with-oss-marketing` (OSS is lead magnet, commercial is real product)
- [ ] **Disambiguation:** if a typical user could realistically run the OSS in production for >50% of their use cases without commercial features, it's `hosted-first`. If the OSS would frustrate a real user trying to use it for production, it's `saas-with-oss-marketing`.
- [ ] Identify primary revenue stream from public statements (earnings, interviews, blog)
- [ ] Source for classification: ___________

---

## Phase 4 — Pricing (15 min)

- [ ] **Free tier exists?** Y/N
- [ ] **Self-hosted free indefinite?** Y/N (note any usage limits)
- [ ] **Cloud entry price USD/month**:
  - Find lowest paid tier (e.g., "Pro $9/mo")
  - If no public price → mark `null` and note "undisclosed" in `_notes`
- [ ] **Pricing model:** per-seat | usage | capacity | hybrid | custom-only
- [ ] **Enterprise minimum declared** (in pricing page or quoted by sales rep publicly) — USD ___________
- [ ] **Self-serve ceiling** (when "Contact us" appears) — USD ___________
- [ ] **Pricing page URL:** ___________
- [ ] **Snapshot pricing page to Wayback Machine NOW** (https://web.archive.org/save)
- [ ] Pull 3 historical Wayback snapshots (2024, 2025, latest 2026)

---

## Phase 5 — Feature Gating Matrix (10 min)

For each, classify as: `oss` | `commercial` | `partial` | `na`. Reference the comparison table on /pricing or /features pages:

- [ ] **SSO/SAML**
- [ ] **RBAC fine-grained**
- [ ] **Audit logs / compliance reporting**
- [ ] **SLA / support tier**
- [ ] **Multi-region / HA**
- [ ] **White-label / branding removal**
- [ ] **Advanced analytics / dashboards**
- [ ] **API rate limits**

Notes for each (especially `partial` cases): ___________

---

## Phase 6 — GitHub Velocity (10 min)

**Snapshot date:** `YYYY-MM-DD`

Use the bundled script: `./scripts/github_stats.sh owner/repo`

Manual fallbacks (if `gh` CLI unavailable):
- Stars + last push: visit repo page
- Contributors: `https://github.com/{owner}/{repo}/graphs/contributors`
- Commit activity: `gh api repos/{owner}/{repo}/stats/commit_activity` (sum totals)
- Releases: `https://github.com/{owner}/{repo}/releases`

Required:
- [ ] **Primary repo URL**
- [ ] **Stars**
- [ ] **Contributors total**
- [ ] **Contributors L12M** (last 12 months)
- [ ] **Commits L12M** (sum of weekly totals)
- [ ] **Releases L12M**
- [ ] **Latest release date**
- [ ] **Latest release version**

---

## Phase 7 — Strategic Signals (10 min)

- [ ] **License changes L24M** — Y/N + link to announcement
- [ ] **Funding rounds L24M** — date, round, amount, lead, source
- [ ] **Notable customer logos** (top 5 from /customers page)
- [ ] **Pricing page changes L24M** — qualitative observation from Wayback diff

---

## Phase 8 — Verification (10 min)

- [ ] All required fields filled or marked `null` with `metadata.notes` reason
- [ ] Every atomic claim has source URL + accessed_date in section `sources` array
- [ ] Cross-checked at least 2 sources for funding/valuation
- [ ] Snapshotted pricing page to Wayback Machine
- [ ] Run `python scripts/validate_schema.py` — passes
- [ ] **24h cool-off** before flipping `status` to `verified`
- [ ] Re-read on day 2 — sanity check / typo / pattern recognition

---

## Estimated time per company

- Phases 0-7: **75-90 min**
- Phase 8 (verification, including 24h cool-off): **10-15 min active + 1 day calendar time**

For 30 companies: **~38-45 hours total active work** spread over Weeks 2-4.

---

## Notes for Atlas curator (optional)

> [Anything weird, edge case, or judgment call worth flagging in `METHODOLOGY.md`. Examples: "Pricing page only shows pricing on a `Contact Sales` form, no public USD figures." or "License history reconstruction required Wayback diff because the company never publicly announced the change."]
