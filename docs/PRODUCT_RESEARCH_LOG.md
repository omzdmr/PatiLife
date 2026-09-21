# PatiLife Product Research Log

This is the permanent research memory for PatiLife. Detailed source snapshots live under `research/`; this log is the rolling decision/index layer so recurring runs do not rediscover the same evidence.

## Rules for research runs
- Prefer repeated patterns across independent sources over a single loud opinion.
- Include store reviews/listings, communities, competitor support/changelogs and authoritative platform/veterinary sources where relevant.
- Record source links/date and separate evidence from interpretation.
- Do not repeat a finding unless new evidence materially strengthens, narrows or contradicts it.
- Track ad/paywall friction, privacy/account complaints, notification reliability, data loss/export, multi-pet/cross-device expectations and accessibility.
- When evidence changes product requirements, add a **RESEARCH HANDOFF** and update `PRODUCT_MASTER_SPEC.md` only when justified.

---

### 2026-09-22 03:07 +08 — Shared care, reminder recovery, data ownership and monetization trust
**Detailed snapshot:** `research/2026-09-22-0307-shared-care-trust.md`

**Accepted findings**
- Shared care is coordination, not merely profile sharing: care occurrences need status, actor and timestamp to avoid missed/double care.
- Household membership and temporary sitter handoff are distinct permission/lifecycle problems.
- Local-first/no-account core plus optional sync/backup best matches trust and offline needs; PDF + machine-readable export are data-ownership capabilities.
- Notifications are delivery, not source-of-truth; due/completed/skipped/missed occurrences and overdue recovery are required.
- Feature breadth does not justify dashboard/module sprawl; approved four-tab compact shell remains the constraint.
- Routine-navigation, health/logging, reminder-completion and export interstitials remain excluded. Core records/export cannot be held hostage to subscription state.

**Evidence strength:** high for occurrence model, local-first portability and compact-shell direction; medium-high for household-vs-sitter lifecycle; pricing boundary remains unresolved.

---

### 2026-09-22 04:24 +08 — Daily care, life-stage monitoring, timeline retrieval and routine-care monetization
**Detailed snapshot:** `research/2026-09-22-0424-daily-care-life-stage-timeline.md`

**Scope:** feeding/water, litter/toilet, walks/activity, grooming, sleep/routines; puppy/kitten growth; senior/chronic care; diary/timeline search and reports; ad/paywall behavior. Market rotation emphasized English/global, Simplified Chinese, Japanese and German.

**Sources (accessed 2026-09-22):**
- Pewmino App Store — daily food/water/walk/activity/training/weight/dental/mood timeline: https://apps.apple.com/us/app/pewmino-pet-care-tracker/id6802199574
- PetMate App Store — feeding/water/litter/weight/photos timeline, multi-pet, optional iCloud: https://apps.apple.com/us/app/petmate-pet-care-log/id6799696225
- Pet Pawty App Store — detailed elimination + feeding coordination + reports; free report uses rewarded-ad gate: https://apps.apple.com/us/app/pet-pawty/id6755618518
- PetDeets App Store — flexible care intervals, notification completion, assigned-to-me and explicit offline/sync failure handling: https://apps.apple.com/us/app/petdeets-pet-care-tracker/id6757575327
- Petfetti App Store changelog — user-requested arbitrary date-range PDF, category or chronological report: https://apps.apple.com/us/app/pet-health-tracker-petfetti/id6471319447
- CompanAIn App Store — 2026 category filtering + keyword timeline search: https://apps.apple.com/us/app/companain-your-pets-health/id6747678727
- Pet Health & Vaccine Tracker App Store — Sep 2026 daily notes moved into Records with search/filter; gram precision and VoiceOver graph: https://apps.apple.com/us/app/pet-health-vaccine-tracker/id6737129774
- Ralph App Store + senior-dog community feedback — structured QoL trends help, but owners still need frictionless behavior/food/med observation notes: https://apps.apple.com/us/app/ralph-pet-quality-of-life/id6480064704 ; https://www.reddit.com/r/seniordogs/comments/1h5zi6y/created_a_free_app_to_help_track_your_dogs/
- German PetLog — appetite/water, feeding, symptom severity/duration, stool, activity/stress/sleep and vet PDF: https://apps.apple.com/de/app/petlog-haustier-gesundheit/id6747721421
- German Felova — chronic-care symptom/weight history and one-page vet summary: https://felova.app/de/
- Chinese local-only 毛孩子 — 4.3 MB, no account/ads; Today + appetite/water/stool/energy/vomit/weight + 7/14/30-day summaries: https://apps.apple.com/cn/app/%E6%AF%9B%E5%AD%A9%E5%AD%90%E5%AE%A0%E7%89%A9%E5%81%A5%E5%BA%B7%E8%AE%B0%E5%BD%95/id6788202619
- Chinese 毛孩日记 — one-tap feeding/water/elimination/activity/sleep/weight + 7-day trends: https://apps.apple.com/cn/app/%E6%AF%9B%E5%AD%A9%E6%97%A5%E8%AE%B0-%E5%AE%A0%E7%89%A9%E5%81%A5%E5%BA%B7%E8%AE%B0%E5%BD%95-ai%E5%85%BB%E5%AE%A0-%E5%96%82%E9%A3%9F%E9%A5%AE%E6%B0%B4%E6%8E%92%E4%BE%BF%E8%BF%90%E5%8A%A8%E6%89%93%E5%8D%A1/id6779265956
- Japanese Pawlog — weight/food/elimination/visits + photo diary + PDF: https://apps.apple.com/jp/app/pawlog-%E3%83%9A%E3%83%83%E3%83%88%E5%81%A5%E5%BA%B7%E8%A8%98%E9%8C%B2/id6758423404
- Japanese Furiend — training/activity/feeding/weight/reminders/growth: https://apps.apple.com/jp/app/%E3%81%B5%E3%82%8A%E3%81%88%E3%82%93%E3%81%A9-%E3%83%9A%E3%83%83%E3%83%88%E5%81%A5%E5%BA%B7%E8%A8%98%E9%8C%B2/id1130176396
- PetFetch accessibility — VoiceOver/Voice Control/Dynamic Type/non-color state/Reduce Motion: https://petfetch.app/en/accessibility
- PETKIT Reddit Mar 2026 — paid/subscribed user objects to continued in-app product promotion: https://www.reddit.com/r/PETKIT/comments/1rvcemx/ads_in_paid_app/
- WSAVA nutritional monitoring — appetite/intake, body weight/condition, GI signs and activity; growing/senior/diseased pets need closer monitoring: https://onlinelibrary.wiley.com/doi/10.1111/j.1748-5827.2011.01079.x
- AAHA senior care/nutrition + QoL (QoL page updated Dec 16 2025): https://www.aaha.org/resources/2023-aaha-senior-care-guidelines-for-dogs-and-cats/ ; https://www.aaha.org/resources/2023-aaha-senior-care-guidelines-for-dogs-and-cats/nutrition/ ; https://www.aaha.org/resources/how-to-assess-your-senior-pets-quality-of-life/
- AAHA/AAFP senior-cat elimination: https://www.aaha.org/resources/2021-aaha-aafp-feline-life-stage-guidelines/elimination-senior-cats/
- WALTHAM puppy/kitten longitudinal growth charts: https://www.waltham.com/resources/puppy-growth-charts ; https://www.waltham.com/resources/kitten-growth-charts

**Repeated findings**
- Across English, Chinese, Japanese and German products, the useful daily-care vocabulary converges on feeding/appetite, water/thirst, elimination, activity/walk, weight and short observation/symptom. Grooming/sleep/training matter but are lower-frequency/contextual.
- Daily tracking is useful only if entry cost stays tiny. The product opportunity is progressive disclosure: normal meal/toilet/walk can be one or two actions; abnormal or medically relevant events can expand to quantity, consistency, severity, photo/video or note.
- Species/life stage should change suggested quick actions, not create separate data silos or top-level modules. Dog GPS walks and cat litter detail are examples of opt-in depth.
- Growing pets need longitudinal weight *trajectory*, not a universal ideal-weight number. WALTHAM puppy/kitten charts reinforce that growth rate depends on age/size/sex and is interpreted longitudinally.
- Senior/chronic care repeatedly needs appetite, hydration/thirst, elimination, mobility/activity, symptoms and trend context. AAHA QoL guidance adds comfort, happiness/social engagement and good-vs-bad-day pattern. These support optional structured check-ins, not a universal diagnostic health score.
- Long timelines need retrieval. Current 2026 products are adding category filters, keyword search and arbitrary date-range reports. Petfetti explicitly labels date-range reporting user-requested; CompanAIn added category filter then keyword search; another tracker moved notes into the central Records surface and made them searchable.
- Accessibility is compatible with the premium compact identity: Dynamic Type/large text, screen-reader semantics, non-color-only state and reduced motion should remain completion gates rather than a separate “accessible mode.”
- No evidence justified a new ad placement. A rewarded-ad gate on a vet/report action is especially mismatched to PatiLife’s portability/trust model; paid users seeing persistent product promotion also produces explicit resentment.

**Contradictions / uncertainty**
- Many current pet apps have sparse ratings; feature convergence is product-direction evidence, not proof of satisfaction.
- GPS walk recording can be valuable but adds permission, battery and implementation cost. Evidence supports a walk/activity event now, not mandatory first-release GPS maps.
- Exact water volume is often unknowable in shared-bowl/multi-pet homes. PatiLife should permit approximate/qualitative thirst observations rather than forcing milliliters.
- AI “health scores” and anomaly claims are increasingly marketed, particularly in Chinese-language products, but independent evidence is not strong enough to make a generic score a requirement.
- Scientific growth curves are useful, but integrating reference datasets requires source/licensing review. Preserve precise longitudinal measurements now; do not copy a chart dataset blindly.

**What this means for PatiLife**
- Keep the approved four-tab shell. Add depth through one shared per-pet event/timeline model, not more dashboards.
- Quick logging should expose a small common set and use progressive disclosure. Species/life stage and user preference can determine which shortcuts appear.
- Diary/Health/Today should be different views over durable history rather than unrelated histories. As data grows, support date-range + category + free-text retrieval.
- Plan optional senior/chronic check-ins and precise puppy/kitten weight history. Disease-specific tools such as glucose curves or seizure timers are later opt-in modules tied to actual care needs.
- Never require an ad to log care, inspect timeline/trends, generate a vet/export handoff, or access sitter/emergency information.

**RESEARCH HANDOFF**
- Proposed requirement: common daily-care event vocabulary with optional structured detail; default logging remains 1–2 actions. Suggested shortcuts adapt to species/life stage without creating schema/UI silos. **Evidence: high. Priority: before quick-log persistence schema freezes.**
- Proposed requirement: one per-pet chronological history supports date-range, event-category and free-text search/filter; report/export reuses the same filtering model. **Evidence: high. Priority: architecture now, retrieval UI when real history exists.**
- Proposed requirement: preserve precise longitudinal weight measurements and allow optional senior/chronic QoL observations; avoid universal diagnostic health scores. **Evidence: medium-high. Priority: data-model constraint now, specialized UI later.**
- Proposed requirement: condition-specific trackers (e.g. glucose curve, seizure timer) remain opt-in future modules rather than permanent core dashboard elements. **Evidence: medium.**
- Monetization handoff: no rewarded/interstitial gate on routine logging, history/trends, vet/export, emergency or sitter surfaces. **Evidence: high for exclusion; no new allowed placement established this run.**

---
