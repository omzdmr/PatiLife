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

**Accepted findings**
- Daily care converges on feeding/appetite, water/thirst, elimination, activity/walk, weight and short observation/symptom; progressive disclosure prevents giant forms.
- Species/life stage changes suggested quick actions, not top-level modules or separate histories.
- Growing pets need longitudinal weight trajectory; senior/chronic care benefits from optional appetite/hydration/elimination/mobility/symptom/QoL observations without a generic diagnostic score.
- Long histories require date-range, category and free-text retrieval; report/export should reuse the same filters.
- Accessibility remains a completion gate; no separate accessible mode is needed.
- No new safe ad placement was justified; logging/history/trends/vet-export/sitter/emergency remain outside rewarded/interstitial gates.

**Evidence strength:** high for shared daily-event vocabulary and timeline retrieval; medium-high for life-stage observations; GPS walks and disease-specific trackers remain optional/later.

---

### 2026-09-22 05:26 +08 — Emergency identity, travel, sitter handoff and document provenance
**Detailed snapshot:** `research/2026-09-22-0526-emergency-travel-handoff-documents.md`

**Accepted findings**
- Emergency, sitter and travel workflows should project the same Profile/Health facts rather than create duplicate databases.
- Microchip reference data benefits from registry/provider and last-verification metadata; a chip number is not proof of current registration.
- Generated Travel Packs are convenience summaries, never official passports/certificates.
- Sitter briefs should be scoped operational handoffs rather than full-history sharing.
- Insurance usefulness in core is durable document organization/provenance, not pretending to know insurer claim state.
- No new safe ad surface emerged for emergency/sitter/travel/document retrieval.

**Evidence strength:** high for projection/document architecture and scoped handoff; public lost-pet hosting/live global travel rules remain later/insufficient.

---

### 2026-09-22 06:05 +08 — Onboarding, accessibility, local-first recovery trust and monetization
**Detailed snapshot:** `research/2026-09-22-0605-onboarding-accessibility-trust.md`

**Scope:** first-run friction/time-to-value, accessibility and large-text/dark-mode completion, account/backup trust, monetization boundaries. Market rotation: English/global plus French/German competitor listings and Japanese Apple platform guidance.

**Key sources (accessed 2026-09-22):**
- Apple Accessibility Nutrition Labels: https://developer.apple.com/help/app-store-connect/manage-app-accessibility/overview-of-accessibility-nutrition-labels
- Apple Japanese accessibility guidance: https://developer.apple.com/jp/help/app-store-connect/manage-app-accessibility/overview-of-accessibility-nutrition-labels
- Apple Sign in with Apple HIG: https://developer.apple.com/design/human-interface-guidelines/sign-in-with-apple/
- Android accessibility: https://developer.android.com/guide/topics/ui/accessibility/apps
- Android/Google Play accessibility testing: https://developer.android.com/guide/topics/ui/accessibility/testing
- PokiPaw current listing/changelog: https://apps.apple.com/us/app/pokipaw-pet-health-tracker/id6761670616
- PetPal AI+ current listing/changelog: https://apps.apple.com/us/app/petpal-ai/id6759816292
- Awwdit accessibility declarations: https://apps.apple.com/us/app/pet-care-tracker-awwdit/id6746352479
- Whispet FR: https://apps.apple.com/fr/app/whispet-sant%C3%A9-soins/id6760017949
- FurFamily FR: https://apps.apple.com/fr/app/furfamily-carnet-sant%C3%A9-animal/id6764331745
- Pilou FR: https://apps.apple.com/fr/app/pilou-carnet-de-sant%C3%A9-animal/id6803716462
- Pfotentagebuch DE: https://apps.apple.com/de/app/pfotentagebuch-haustier-app/id6800088082
- Pet Health+ DE: https://apps.apple.com/de/app/pet-health-vaccine-tracker/id6737129774
- Snout discussion (2026-09-14): https://www.reddit.com/r/iOSAppsMarketing/comments/1wg2kma/
- PawProof discussion (2026-06-15): https://www.reddit.com/r/apps/comments/1u6wddb/
- Pet-manager discussion (2026-03-30): https://www.reddit.com/r/AppIdeas/comments/1s7ixtn/

**Repeated findings**
- First value should precede complete profile setup. Current competitors explicitly shorten onboarding, allow guest/no-account use, or reduce typing; platform guidance supports delaying sign-in and optional data collection.
- PatiLife's first-run minimum should be enough to create a coherent local pet record and enter the shell; breed/birthday/sex/microchip/vet/insurance/history/documents can be progressively completed later. Unknown remains valid.
- Permission requests should be contextual. Do not front-load notification/photo/account/paywall prompts before the user sees why they help.
- Accessibility is now store-visible product information on Apple platforms. Apple expects common tasks to work for declared capabilities; Google Play pre-launch testing audits touch targets, contrast, labels and accessibility implementation.
- PatiLife therefore needs a common-task accessibility release matrix, not scattered semantics checks: pet creation/switching, quick log, medication/reminder recovery, health record, Diary retrieval, Profile/Emergency Card, document/export.
- FR/DE competitors repeatedly position no-account/offline/device-private storage as a benefit. Existing local-first direction is strengthened. A useful future backup UX should show configured state and last successful backup/recovery without making local logging depend on sync.
- Monetization models remain heterogeneous (subscription, lifetime, free-one-pet, premium export/multi-pet, no-ads). No evidence justifies expanding PatiLife ad surfaces or choosing a pricing model yet.

**Contradictions / uncertainty**
- Many current pet apps are young with sparse reviews; feature/paywall choices are market signals, not satisfaction proof.
- Developer launch posts are not independent validation and were used only for architecture/positioning context.
- iCloud-only patterns do not solve Android parity; cross-platform backup provider/merge behavior still needs technical research.
- This run found insufficient independent current Korean/Chinese/Turkish review evidence for a new market-specific requirement; none was invented.

**RESEARCH HANDOFF**
- First-run: minimum pet identity -> usable Today/Profile -> progressive completion; no account/paywall/permission burst before first value. **Evidence: high.**
- Contextual permissions with graceful denial and account-free core. **Evidence: high.**
- Add a release accessibility matrix covering screen reader, 200%+ text, dark/light contrast, non-color status, reduced motion, focus order and touch targets before claiming store support. **Evidence: high.**
- Backup/recovery UI should eventually expose backup state + last success + explicit recovery/export while local writes remain authoritative. **Evidence: medium-high.**
- ADS_POLICY unchanged; pricing/package remains unresolved. **Evidence for new ad placement: insufficient.**

---
