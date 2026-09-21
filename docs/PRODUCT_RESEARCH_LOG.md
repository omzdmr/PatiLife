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

**Scope:** emergency/lost-pet identity, microchip metadata, travel records, temporary sitter care brief, insurance/claim document organization, monetization/privacy. Market rotation: English/global, French, German, Japanese, Turkish; official EU and AAHA sources used for travel/emergency facts.

**Sources (accessed 2026-09-22):**
- EU pet travel rules (last checked 2026-09-01): https://europa.eu/youreurope/citizens/travel/carry/pets-and-other-animals/index_en.htm
- European Commission intra-EU movement: https://food.ec.europa.eu/animals/live-animal-movements/dogs-cats-and-ferrets/movements-within-eu_en
- European Commission non-EU entry: https://food.ec.europa.eu/animals/live-animal-movements/dogs-cats-and-ferrets/bringing-pet-eu-non-eu-country_en
- AAHA microchip lookup: https://www.aaha.org/for-veterinary-professionals/microchip-registry-lookup-tool-aaha-find-your-pets-microchip-registry/
- AAHA emergency preparedness: https://www.aaha.org/resources/storm-preparedness-for-pets/
- OnePaw sitter care sheet: https://apps.apple.com/us/app/onepaw-pet-records-and-care/id6759019806
- PetHandoff: https://pethandoff.app/
- Pettioe travel record: https://www.pettioe.com/pet-passport
- Keia FR/DE: https://keia.app/fr ; https://keia.app/de
- BobbyPet DE: https://apps.apple.com/de/app/bobbypet/id6739954015
- Animoo FR: https://apps.apple.com/fr/app/animoo-carnet-sant%C3%A9-animal/id6756840538
- Petport JP: https://apps.apple.com/jp/app/petport-%E3%83%9A%E3%83%83%E3%83%88%E3%81%AE%E8%A8%98%E9%8C%B2%E3%81%A8%E5%81%A5%E5%BA%B7%E7%AE%A1%E7%90%86/id6810294176
- Petsita TR: https://petsita.com/
- PetGuru TR: https://www.petguru.app/
- Fetch current listing/reviews: https://apps.apple.com/us/app/fetch-pet-insurance/id925165009
- Pets Best current listing/reviews: https://apps.apple.com/us/app/pets-best-pet-health-insurance/id1177692522
- Spot upload complaint, 2026-08-04: https://www.reddit.com/r/SpotPetInsurance/comments/1vfhgr9/app_online_portal_trouble/
- Pets Best records complaint, 2026-06-01: https://www.reddit.com/r/petinsurancereviews/comments/1ttvp6u/pets_best_closed_my_claim_for_no_medical_records/
- Rover omitted-medication-instructions case, 2025-03-11: https://www.reddit.com/r/RoverPetSitting/comments/1j8ttlu

**Repeated findings**
- Emergency, sitter and travel workflows repeatedly reuse the same compact identity/health facts. PatiLife should project them from Profile/Health rather than create duplicate databases.
- Microchip number alone is incomplete operationally. Registry/provider and a last-verification date are useful because owner contact data lives in registries and registry availability can change.
- A PatiLife-generated travel PDF must be called a travel record/pack, not an official passport. EU passports and animal health certificates are official vet/state documents with changing legal requirements.
- Temporary caregivers need a scoped operational brief: food, medication instructions, routine, behavior/fears, bathroom, vet/emergency contacts and selected critical health facts. Full diary/lab/financial history should not be shared by default.
- Insurance usefulness is mostly document organization, provenance and retrieval. Recent complaints repeatedly involve missing uploads, opaque receipt/status and inability to prove what was submitted. PatiLife should preserve original invoices/records and useful metadata, not become an insurer portal.
- Broad competitor apps add community/maps/adoption/weather/AI/social lost-pet feeds, but this run found no strong evidence those should become core PatiLife modules. Emergency card, sitter brief and travel pack add breadth by reusing existing records, which better fits the compact identity.
- No new safe ad surface emerged. Emergency, sitter, travel-document and insurance/document retrieval/export are trust-heavy and should remain outside interstitial/rewarded gates.

**Contradictions / uncertainty**
- Niche apps often have sparse ratings; their feature sets reveal problems but do not prove satisfaction.
- Public lost-pet QR/profile hosting may help, but creates backend availability, abuse/privacy and stale-contact obligations. It is not justified as core-v1.
- PatiLife cannot know authoritative insurance claim status without insurer integration; do not invent a local status as truth.
- Country travel rules change; static worldwide rule content would be a reliability liability without a maintained authoritative update path.

**RESEARCH HANDOFF**
- Emergency Card: offline/read-only projection from existing pet/health data; no duplicate emergency store. **Evidence: high.**
- Microchip: store number plus optional registry/provider and last verification date; clearly distinguish reference data from registry registration. **Evidence: high.**
- Sitter Care Brief: printable/offline, deliberately scoped operational handoff; reuse later for expiring remote share. **Evidence: high.**
- Travel Pack: official document attachments + expiry/due metadata + clearly non-official generated summary. **Evidence: high.**
- Document architecture: preserve original files and type/date/event/external-reference metadata; insurance/EOB/invoice are document types rather than a new dashboard. **Evidence: high.**
- Public lost-pet hosting, live global travel rules and insurer APIs remain optional/later. **Evidence for core inclusion: insufficient.**

---
