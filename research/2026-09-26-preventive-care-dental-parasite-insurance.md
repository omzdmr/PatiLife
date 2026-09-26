# Preventive Care Journeys: dental, parasite prevention, insurance/admin

Research date: 2026-09-26 +08
Scope: dental/home care; flea/tick/worm/heartworm prevention; insurance/admin document continuity; reminder/monetization boundaries.
Market rotation: English/global with current Turkish, German, French/Japanese product surfaces where useful.

## Sources reviewed
- https://www.aaha.org/resources/your-pets-dental-care/
- https://capcvet.org/guidelines/general-guidelines/
- https://capcvet.org/guidelines/heartworm/
- https://capcvet.org/guidelines/ascarid/
- https://www.esccap.org/travelling-pets-advice/
- https://apps.apple.com/us/app/pawdental-brushing-habit/id6758264494
- https://lumosignite.com/apps/pawdental/
- https://apps.apple.com/jp/app/muzzly-%E3%83%9A%E3%83%83%E3%83%88%E8%96%AC%E7%AE%A1%E7%90%86-%E3%83%AA%E3%83%9E%E3%82%A4%E3%83%B3%E3%83%80%E3%83%BC/id6761260557
- https://apps.apple.com/de/app/haustier-pflege-hund-katze/id6767791040
- https://petsita.com/
- https://pavlovpet.app/tr
- https://apps.apple.com/us/app/embrace-pet-insurance/id1446529885
- https://apps.apple.com/us/app/pets-best-pet-health-insurance/id1177692522
- https://nadeco.app/en
- https://www.reddit.com/r/petinsurancereviews/comments/1p37z7g/do_not_get_metlife/
- https://www.reddit.com/r/petinsurancereviews/comments/1qc8tph/how_are_yall_seeing_how_much_your_premiums_are/
- https://www.reddit.com/r/petinsurancereviews/comments/1th3gd7/hp_senior_increase_notification/
- https://www.reddit.com/r/petinsurancereviews/comments/1v8wjnu/california_akc_pet_insurance_the_famous_365day/
- https://www.reddit.com/r/petinsurancereviews/comments/1vt7744/spot_pet_insurance_increase_after_1st_year/

## Evidence synthesis

### Dental care is a habit plus escalation journey, not another health silo
AAHA's 2026 update says daily brushing is the best home method to reduce plaque accumulation and identifies bad breath, red gums, drooling and difficulty eating as reasons for a dental exam. Current PawDental exists solely because consistency is hard: one-tap completion, gentle reminders, optional timer and multi-pet/household coordination. German all-in-one products also include tooth cleaning in ordinary recurring care.

PatiLife implication: keep tooth brushing as an existing routine-care preset, but allow an optional Dental Care Journey that helps establish the habit gradually, records completion without guilt, and connects concerning oral observations to vet prep. Do not create a proprietary dental-health score, diagnose disease from streaks/photos, or imply brushing replaces professional assessment. A timer can be contextual inside brushing, not a permanent surface.

### Parasite prevention must preserve the prescribed schedule and react to context
CAPC currently recommends broad year-round prevention in the US, while testing frequency and risk explicitly vary with health, environment, outdoor exposure, travel and animal contact. ESCCAP travel advice varies by destination and says treatment decisions depend on age, health, breed, prior travel and vaccination history, with veterinary consultation before travel.

PatiLife implication: parasite care is treatment/product + source/prescriber + actual administration occurrence + user/vet-confirmed next due date. A Journey can prompt review when circumstances change, e.g. new puppy/kitten, outdoor-access change, travel/import, missed/late dose or new veterinarian. It must not synthesize a universal flea/tick/worm/heartworm calendar from species/age/location alone. Travel Journey may link to authoritative regional guidance but must not silently mutate the standing schedule.

### Missed prevention is recovery, not shame
Existing reminder research already separates occurrence state from notification delivery. When prevention is late/missed, preserve what happened and offer review/reschedule/ask-vet paths rather than auto-marking completion or inventing catch-up timing. Current Muzzly changelog also suppresses a reminder if another caregiver already administered the treatment, strengthening actor-attributed occurrence semantics.

### Insurance value is document/admin continuity, not insurer emulation
Current insurer apps market claim submission/status, policy documents, renewal dates and coverage details. Current owner complaints repeatedly concern missing documents, inability to add information/reopen a claim, confusing status/history, renewal price/coverage changes and uncertainty about which document/version governs.

PatiLife implication: remain insurer-neutral. Store original policy/renewal/claim documents with provider, policy period, optional claim/reference ID and user-entered status/note. Allow renewal/review reminders and a claim packet projection containing selected invoices, vet records and supporting documents. Do not claim live coverage, reimbursement, deductible or claim status without an integration. Original documents remain canonical. Future document-diff assistance is plausible but not launch-critical.

### New Journey primitive: review windows
Not every Journey should end in a task. Preventive/admin care often needs a review window:
- dental habit review after adaptation;
- parasite-plan review when exposure/travel/life stage changes;
- insurance renewal review before the new policy period.

A review window can offer: still appropriate, changed, ask professional, not applicable. User-confirmed changes then update reminders/metadata. This prevents task explosion.

## Monetization
No new safe interstitial/rewarded surface emerged. Dental logging, parasite administration/missed-dose recovery, policy/claim document retrieval and renewal review are trust/intended-action surfaces. Existing ad policy remains unchanged. Advanced document comparison could be premium later, but original policies, invoices, care records and export remain accessible regardless of entitlement.

## Rejected / insufficient
- Universal parasite schedules from age/species alone.
- Automatic catch-up dosing after a missed treatment.
- Dental disease score inferred from brushing streaks/photos.
- Standalone dental or parasite tabs.
- Insurer-like local claim status presented as authoritative.
- AI insurance interpretation as launch-critical.
- New ads in preventive/admin flows.

## RESEARCH HANDOFF
1. Reuse routine/reminder occurrence model for dental and parasite care.
2. Add optional Journey review-window semantics alongside timed suggestions/readiness gates.
3. Parasite records preserve treatment/product, source/prescriber, actual administration and confirmed next due; context changes prompt review, not automatic medical rescheduling.
4. Dental Journey can establish brushing and connect concerning observations to existing vet-prep; no proprietary health score.
5. Insurance remains document/provenance workflow: policy periods, renewals, invoices/claims/supporting records and exportable claim packet; no fake insurer truth.
6. Keep four-tab shell, local-first authority, DESIGN_SYSTEM and ADS_POLICY unchanged.
