# PatiLife research snapshot — medication safety, health records and vet-visit continuity

**Run:** 2026-09-22 07:05–07:25 +08  
**Code changes:** none  
**Market rotation:** English/global + French + Turkish + Japanese spot-check  
**Focus:** medication/vaccine/parasite adherence; health-record/document provenance; vet appointment before/after continuity; monetization boundaries.

## Sources checked

### Authoritative / veterinary safety
- FDA, Veterinary Medication Errors (accessed 2026-09-22): https://www.fda.gov/animal-veterinary/product-safety-information/veterinary-medication-errors
- FDA, Medications for Your Pet — Questions for Your Vet (accessed 2026-09-22): https://www.fda.gov/animal-veterinary/animal-health-literacy/medications-your-pet-questions-your-vet
- FDA, Properly Store Medications to Keep Your Pet Safe (accessed 2026-09-22): https://www.fda.gov/animal-veterinary/animal-health-literacy/properly-store-medications-keep-your-pet-safe
- AAHA, Feline vaccination adverse-reaction / permanent-record guidance (2020 guideline, accessed 2026-09-22): https://www.aaha.org/resources/2020-aahaaafp-feline-vaccination-guidelines/adverse-postvaccination-reactions/
- AAHA, feline vaccine types (2020 guideline, accessed 2026-09-22): https://www.aaha.org/resources/2020-aahaaafp-feline-vaccination-guidelines/types-of-vaccines/

### Current competitor/product surfaces
- KibblRx App Store, current 2026 listing: https://apps.apple.com/us/app/kibblrx/id6760588981
- Remewdy App Store, current 2026 listing/changelog: https://apps.apple.com/us/app/remewdy-pet-med-tracker/id6761487030
- PetDose App Store, current 2026 listing/changelog: https://apps.apple.com/us/app/petdose-pet-med-reminders/id6758732979
- Pet Pill App Store, current 2026 changelog: https://apps.apple.com/us/app/pet-pill-dog-cat-care-app/id6760020801
- Whisker App Store, current 2026 listing: https://apps.apple.com/us/app/whisker-pet-health/id6767415331
- French Whispet listing: https://apps.apple.com/fr/app/whispet-sant%C3%A9-soins/id6760017949
- French Muzzly listing: https://apps.apple.com/fr/app/muzzly-m%C3%A9dicaments-rappels/id6761260557
- French Keia listing: https://apps.apple.com/fr/app/keia-suivi-sant%C3%A9-animale/id6759483192
- French PawReminder listing: https://apps.apple.com/fr/app/pawreminder-soin-des-animaux/id6758776370
- Turkish Furo listing: https://apps.apple.com/tr/app/furo-evcil-hayvan-takibi/id6775974424
- Japanese PokiPaw listing: https://apps.apple.com/jp/app/pokipaw-%E3%83%9A%E3%83%83%E3%83%88%E5%81%A5%E5%BA%B7%E7%AE%A1%E7%90%86-%E7%8A%AC%E7%8C%AB%E3%81%8A%E4%B8%96%E8%A9%98%E9%8C%B2%E6%89%8B%E5%B8%B3/id6761670616
- CovePet vet-visit record model: https://covepet.com/
- Petio vet-visit note template, 2026-09-01: https://www.petiogo.com/blog/vet-visit-notes-template

### Community / user-problem signals
- FamilyPet+ discussion, 2026-06-29: https://www.reddit.com/r/SideProject/comments/1uixmy3/
- PawProof document-scanning discussion, 2026-06-29: https://www.reddit.com/r/apps/comments/1uitubn/
- VetKeeper archive + one-pager problem discussion, 2026-09-17: https://www.reddit.com/r/SideProject/comments/1wivu2g/
- Pet medication tracker discussion, 2026-08-05: https://www.reddit.com/r/SideProject/comments/1vgcz1v/

## Evidence synthesis

### 1. A medication is not just a name + alarm
Current medication-focused apps repeatedly expose schedule shapes beyond “daily”: multiple times/day, every other day, weekly/monthly, every X days/weeks, one-time doses, courses and PRN/as-needed logging. Remewdy’s 2026 changelog is especially useful failure evidence: it fixed phantom earlier-today occurrences created when a schedule was added later in the day, future doses incorrectly appearing skipped, historical doses being counted before a medication existed, and performance degradation when reminder history grew. Pet Pill added editable logged dose time/amount, single-dose medication, early reminders and refill forecasting; PetDose exposes every-other-day and short-course use; Muzzly exposes cycles and PRN.

**PatiLife implication:** recurrence generation needs effective start/end boundaries and must not back-create missed doses. A logged occurrence must be editable/correctable without rewriting the prescription/schedule definition. Support at least one-time, fixed-times/day, selected weekdays/every-N-days and PRN; richer cycles can remain later unless demanded. “Skipped” must be an explicit user/recovery state, not inferred merely because a future clock time has not arrived.

### 2. Medication safety context is valuable, but PatiLife must not become a prescribing engine
FDA explicitly identifies medication errors from drug-name confusion, strength, dosage form, route, devices, abbreviations, instructions and home administration. FDA tells owners to keep a current list including prescription drugs, OTC products and supplements, and to know what to do for a forgotten dose, vomiting/spitting out a dose, food timing, storage and course completion. The label itself carries drug name, strength, dosage form, route, quantity, lot and expiry information.

**PatiLife implication:** medication records should allow owner-entered/prescription-derived structured fields such as display name, active ingredient when known, strength, dose amount/unit, dosage form, route, schedule, start/end, instructions, prescribing vet/pharmacy/reference, refill/supply metadata and original prescription/label attachment. However PatiLife should preserve veterinarian instructions rather than invent a universal “missed dose” answer. Free text such as “if missed / if vomited / with food / storage” is useful when copied from professional instructions. OCR can be a later import accelerator only if every extracted field is reviewable before save.

### 3. Refill/supply is a distinct failure mode from adherence
KibblRx, PetDose, Muzzly and Pet Pill independently implement pill/supply count or refill forecasting. This is not the same problem as “did I give today’s dose?” A perfectly followed schedule still fails if the owner runs out.

**PatiLife implication:** optional supply tracking belongs inside a medication, not as a separate inventory module. It can estimate low supply from confirmed logged doses, but user correction must be possible because spills, split tablets, injections, changed prescriptions and outside administrations break naive arithmetic. Refill reminders should remain optional to avoid clutter for short courses.

### 4. Vaccine provenance is deeper than vaccine name + next date
AAHA’s feline guideline says the permanent record should include vaccine name, serial number, expiration date, manufacturer, administration date, administering person, site and route; adverse events should be conspicuous for future visits. AAHA also notes products aimed at the same pathogen should not simply be assumed equivalent.

**PatiLife implication:** keep the fast path small (vaccine/type, given date, next due) but allow an expandable provenance section for manufacturer/product, lot/serial, expiry, clinic/vet, route/site and source certificate/photo. Do not auto-infer equivalence or a medical booster interval merely from a generic vaccine label. User/vet-entered next-due date is authoritative unless a future maintained regional protocol source exists.

### 5. “Vet appointment” should become one durable visit event, not three disconnected features
CovePet frames the owner problem around answering “when did it start / has it happened before / what is the dose?” Petio’s current visit template joins pre-visit changes/questions with current medications and post-visit instructions/follow-up. Current pet apps commonly store appointment, notes, documents and reminders, but splitting them into unrelated modules forces the owner to reconstruct the encounter.

**PatiLife implication:** a vet visit event can have progressive phases while staying one timeline item: scheduled reason + optional pre-visit questions/selected recent history; afterward actual date, clinic/vet, owner notes, diagnoses/observations as stated by the clinic, attached originals, medication changes, and follow-up/recheck tasks. This reuses the existing timeline/document/reminder architecture instead of creating a fifth module.

### 6. Documents have an archive problem and a handoff problem
Recent PawProof/VetKeeper discussions independently describe records scattered across clinics, PDFs, camera roll and paper, plus the separate need for a concise one-page proof/summary. French Keia explicitly emphasizes sending the original stored file, not a screenshot. Whisker/Whispet and several newer apps compete on local/private document storage.

**PatiLife implication:** retain original attachments plus metadata and link them to visits/vaccines/medications/labs. Generated vet summaries are views over canonical data and never replace source documents. OCR/extraction, if added, creates suggested structured fields with source linkage and confirmation, not silent mutation of the medical record.

## Monetization/ad check
No credible evidence in this run supports loosening the current ad exclusions. Health-record, medication, vaccine, appointment, document and vet-handoff flows are trust-heavy and error-sensitive. Several current competitors use “no ads” as part of their privacy/trust positioning. Some competitors paywall PDF export, multi-pet or advanced medication/refill features, but this is packaging evidence, not proof users like it. PatiLife’s existing rule that existing records and export cannot be held hostage remains stronger for long-term trust.

## Contradictions / uncertainty
- Most 2026 medication apps are new and have sparse independent reviews. Their feature lists establish competitive expectations, not user satisfaction.
- FDA/AAHA sources are authoritative for safety/record content but U.S.-centric; PatiLife should not turn their exact fields into mandatory worldwide forms.
- Automatic vaccine next-due calculations vary by product, species, age, risk, region and clinician plan. Current evidence argues against a universal hard-coded calculator.
- Refill forecasting is useful across several competitors but independent owner-review evidence remains limited; keep it optional rather than dashboard furniture.
- This run found current Turkish/French/Japanese product signals but not enough independent country-specific complaint volume to justify different core health schemas by locale.

## RESEARCH HANDOFF
1. **Medication definition and dose occurrence must be separate.** Effective start/end boundaries, editable occurrence history, PRN/one-time/flexible recurrence and no retroactive phantom misses. Evidence: high.
2. **Medication record should preserve safety/provenance context without giving medical instructions.** Strength/form/route/instructions/source attachment are optional structured details; missed-dose advice is recorded from vet/label, not invented. Evidence: high.
3. **Optional supply/refill tracking belongs within medication and is correction-friendly.** Evidence: medium-high.
4. **Vaccines use progressive disclosure:** fast core fields plus optional manufacturer/lot/expiry/clinic/route/site/source document; no universal auto-equivalence or booster protocol. Evidence: high.
5. **Vet appointment becomes a durable visit event** that can collect pre-visit reason/questions and post-visit instructions/documents/follow-up while projecting into the existing timeline/reminder system. Evidence: medium-high.
6. **Original medical documents remain canonical attachments.** OCR/import may suggest fields but requires review and source linkage. Evidence: high.
7. **ADS_POLICY unchanged:** no ads/interstitial/reward gates in medication, vaccine, vet visit, document or handoff flows. Pricing/package remains unresolved.
