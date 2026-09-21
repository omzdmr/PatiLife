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

**Accepted findings**
- First value should precede complete profile setup; nonessential profile fields, account, paywall and broad permission prompts come later/contextually.
- Accessibility needs a common-task release matrix across screen reader, 200%+ text, contrast, non-color state, reduced motion, focus and touch targets.
- FR/DE competitors strengthen local-first/no-account positioning; future backup UX should expose configured state, last successful backup and recovery/export while local writes remain authoritative.
- No evidence justified expanding ad surfaces or choosing a pricing model.

**Evidence strength:** high for progressive onboarding/contextual permissions/accessibility; medium-high for backup-state UX; pricing remains unresolved.

---

### 2026-09-22 07:25 +08 — Medication safety, vaccine provenance, vet-visit continuity and document handoff
**Detailed snapshot:** `research/2026-09-22-0725-medication-records-vet-visit.md`

**Scope:** medication/vaccine/parasite adherence; conditions/labs/document provenance; vet appointment before/after continuity; health-flow monetization. Market rotation: English/global plus French, Turkish and Japanese product surfaces.

**Key sources (accessed 2026-09-22):**
- FDA Veterinary Medication Errors: https://www.fda.gov/animal-veterinary/product-safety-information/veterinary-medication-errors
- FDA medication questions for pet owners: https://www.fda.gov/animal-veterinary/animal-health-literacy/medications-your-pet-questions-your-vet
- AAHA feline vaccine permanent-record guidance: https://www.aaha.org/resources/2020-aahaaafp-feline-vaccination-guidelines/adverse-postvaccination-reactions/
- KibblRx: https://apps.apple.com/us/app/kibblrx/id6760588981
- Remewdy: https://apps.apple.com/us/app/remewdy-pet-med-tracker/id6761487030
- PetDose: https://apps.apple.com/us/app/petdose-pet-med-reminders/id6758732979
- Pet Pill: https://apps.apple.com/us/app/pet-pill-dog-cat-care-app/id6760020801
- Whispet FR: https://apps.apple.com/fr/app/whispet-sant%C3%A9-soins/id6760017949
- Muzzly FR: https://apps.apple.com/fr/app/muzzly-m%C3%A9dicaments-rappels/id6761260557
- Furo TR: https://apps.apple.com/tr/app/furo-evcil-hayvan-takibi/id6775974424
- PokiPaw JP: https://apps.apple.com/jp/app/pokipaw-%E3%83%9A%E3%83%83%E3%83%88%E5%81%A5%E5%BA%B7%E7%AE%A1%E7%90%86-%E7%8A%AC%E7%8C%AB%E3%81%8A%E4%B8%96%E8%A9%98%E9%8C%B2%E6%89%8B%E5%B8%B3/id6761670616
- CovePet: https://covepet.com/
- Petio vet-visit notes, 2026-09-01: https://www.petiogo.com/blog/vet-visit-notes-template
- FamilyPet+ discussion, 2026-06-29: https://www.reddit.com/r/SideProject/comments/1uixmy3/
- PawProof discussion, 2026-06-29: https://www.reddit.com/r/apps/comments/1uitubn/
- VetKeeper discussion, 2026-09-17: https://www.reddit.com/r/SideProject/comments/1wivu2g/

**Repeated findings**
- Medication definition and individual dose occurrences are different records. Current apps repeatedly need one-time, multi-time/day, every-other-day/every-N-day and PRN schedules; Remewdy's current changelog documents real bugs from retroactive occurrence generation and prematurely marking future doses skipped.
- FDA safety material supports preserving drug name/strength/form/route/instructions and a current list of prescription + OTC + supplements. PatiLife should store professional instructions, not invent universal missed-dose advice.
- Refill/supply tracking recurs across medication-focused competitors and solves a different failure from adherence. Keep it optional and correction-friendly inside medication rather than create an inventory module.
- AAHA's permanent vaccine record is substantially richer than name/date: product/manufacturer, serial/lot, expiry, administrator, route/site and adverse events can matter. PatiLife should expose these as progressive optional provenance fields while keeping the fast path small.
- Vet visits work better as one durable timeline event with pre-visit reason/questions/current context and post-visit instructions, documents, medication changes and follow-up tasks, instead of disconnected appointment/note/document silos.
- Document scanning/import is useful mainly as friction reduction. Original source attachment stays canonical; OCR/extraction must be reviewable and source-linked.
- No new safe ad surface emerged. Health records, medication/vaccine, vet visits, documents and handoff remain trust-heavy and uninterrupted.

**Contradictions / uncertainty**
- Many 2026 medication apps have sparse independent reviews; feature convergence is competitive evidence, not satisfaction proof.
- FDA/AAHA detail is authoritative but U.S.-centric; detailed provenance fields should not become mandatory worldwide.
- Vaccine schedules depend on product/species/age/risk/region/veterinarian; evidence argues against a universal hard-coded booster calculator.
- Refill forecasting has repeated competitor support but limited independent user-review volume; keep optional.
- Turkish/French/Japanese current listings did not provide enough independent complaint volume to justify locale-specific health schemas.

**RESEARCH HANDOFF**
- Separate medication definition/schedule from editable dose occurrences; enforce effective start/end so schedule edits do not create phantom historical misses. **Evidence: high.**
- Support a compact recurrence core: one-time, fixed times/day, selected weekdays/every-N-days and PRN; richer cycles can remain later. **Evidence: high.**
- Preserve optional medication safety/provenance fields and source prescription/label; record vet-provided missed-dose/storage/food instructions rather than generating medical advice. **Evidence: high.**
- Add optional, correction-friendly supply/refill tracking inside medication. **Evidence: medium-high.**
- Vaccine UI uses progressive disclosure: core given/next-due plus optional manufacturer/lot/expiry/clinic/route/site/source document; no universal auto-protocol. **Evidence: high.**
- Model vet appointment/consultation as one durable visit event spanning preparation -> actual visit -> documents/instructions -> follow-up. **Evidence: medium-high.**
- ADS_POLICY unchanged; pricing/package unresolved. **Evidence for new ad placement: insufficient.**

---
