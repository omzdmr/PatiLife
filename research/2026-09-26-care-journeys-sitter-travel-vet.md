# Care Journeys II — sitter handoff, travel readiness, symptom-to-vet continuity

**Research date:** 2026-09-26 +08
**Scope:** temporary caregiver handoff/return; travel preparation; observation-to-vet continuity; trust/monetization. Market rotation included current pt-BR, es-419 and India surfaces where useful.

## Sources
Authoritative:
- https://www.aaha.org/resources/preparing-for-the-unexpected-essential-pet-sitter-instructions/
- https://www.aaha.org/resources/storm-preparedness-for-pets/
- https://www.aaha.org/resources/2023-aaha-senior-care-guidelines-for-dogs-and-cats/senior-care-kits/
- https://www.aaha.org/resources/how-to-make-a-pet-first-aid-kit-and-actually-use-it/
- https://catfriendly.com/be-a-cat-friendly-caregiver/getting-cat-veterinarian/
- https://www.aphis.usda.gov/pet-travel
- https://www.aphis.usda.gov/pet-travel/pet-travel-process-overview
- https://www.aphis.usda.gov/pet-travel/us-to-another-country-export/frequently-asked-questions-about-traveling-your-pet

Current products/markets:
- https://www.gopuppy.app/pt
- https://www.petsapps.com/
- https://petiapp.ai/
- https://oitopet.com.br/
- https://pawddy.app/
- https://www.petnimbus.com/
- https://barnaby.in/

Current owner/community signal:
- https://www.reddit.com/r/petsitting/comments/1rvcznx/your_sitters_cat_is_dying_your_dog_is_home_alone/
- https://www.reddit.com/r/seniordogs/comments/1ui0l3r/going_to_vet_tomorrow_help_advocating_for_my_dog/

## Repeated findings

### 1. Temporary care is a bounded episode, not merely household membership
AAHA's sitter guidance combines pet identity/personality, triggers, diet, medication/supplements, microchip, activity, hiding places, current photo, vet/emergency contacts, insurance and emergency procedures. Current shared-care products in Brazil/Spanish markets emphasize everyone seeing the same routine and who completed it. The product problem is therefore not just access: it is a temporary **handoff -> execution -> handback** episode.

PatiLife implication:
- Start/end dates and selected pets.
- Scoped operational brief generated from canonical records.
- During handoff, sitter-facing Today emphasizes only assigned feeding/walk/medication/routine and emergency facts.
- Completion retains actor/time to prevent double care.
- Owner can leave explicit exceptions/instructions without exposing unrelated diary/lab/financial history.
- Handback should summarize completed/missed/skipped care and notable observations, then expire/revoke temporary access.
- Emergency backup contact/decision authority is a distinct optional field; AAHA senior guidance specifically highlights authorization and payment planning when the primary caregiver is unavailable.

This strengthens existing household-vs-sitter semantics rather than requiring another database.

### 2. Travel Journey should be deadline-driven but authority-linked
APHIS explicitly says international requirements vary by destination and can take weeks to months; health certificates and tests have country-specific timing windows. Current official country pages demonstrate materially different requirements. Therefore a static embedded worldwide checklist would age badly.

PatiLife implication:
- Journey inputs: destination(s), departure/return date, transport mode, pet.
- Universal preparation can be local: carrier/crate acclimation, ID/microchip verification, medication supply, copies of records, emergency/vet contacts, food/water/comfort items.
- Regulatory tasks must carry authoritative source URL + checked/updated date and should be framed as verification tasks unless backed by a maintained integration.
- Travel Pack reuses canonical documents; app-generated summary is not an official certificate.
- Deadline model needs relative windows and dependencies (e.g. document/test before certificate) but should not fabricate country rules.
- Carrier acclimation is itself a pre-travel journey: Cat Friendly Homes notes it can take days or weeks, supporting early, gradual prompts rather than “put pet in carrier on departure day.”

### 3. Symptom-to-vet is a continuity journey, not AI diagnosis
The existing symptom-episode model already preserves onset/severity/media. Current owner evidence shows why this matters: intermittent pain/behavior may disappear during the appointment, while videos and a concise chronology help the owner advocate. Current products market symptom diaries, visit recordings and AI summaries, but marketing is not evidence that autonomous diagnosis is desirable.

PatiLife implication:
- A symptom episode can expose “Prepare for vet” without inventing urgency/diagnosis.
- Generate a compact pre-visit brief from selected facts: onset/time course, frequency/severity observations, appetite/water/elimination/activity changes, medications, recent changes, photos/videos, and owner questions.
- The user selects what is relevant; PatiLife should not dump the whole lifetime history on the vet.
- After visit, attach professional instructions/documents/follow-up to the same continuity chain; confirmed instructions supersede generic journey suggestions.
- Optional future transcription/OCR can reduce typing, but original media/document and user review remain canonical.

### 4. Care Journey engine needs trigger + scope + authority, not hundreds of bespoke screens
The three scenarios reinforce a general structure:
- trigger/anchor: trip, sitter start, symptom episode, arrival, procedure, move;
- scope: selected pet(s), people, destination/context;
- contextual suggestions;
- explicit promotion to tasks/reminders;
- canonical records linked rather than copied;
- source/authority metadata where claims can change;
- completion/dismissal preserved when the journey recalculates;
- end-state/handoff summary.

This keeps PatiLife compact while supporting many real-life situations.

## Market notes
- pt-BR: GoPuppy foregrounds shared routines and caregiver participation; OitoPet foregrounds agenda/documents/reports.
- es-419/Spanish: PetApps foregrounds shared custody, roommates, travel and sitter coordination.
- India: Peti emphasizes portable health records/expiring vet sharing; current Indian products also lean heavily into booking/AI/marketplace. The latter does not justify PatiLife abandoning local-first for a marketplace.
- No sufficiently independent current evidence justified a market-specific UI fork.

## Ads / monetization
No new safe interstitial/rewarded surface emerged. Temporary-care execution, travel-document verification, symptom preparation, emergency contacts and handback are high-intent/trust flows. Do not interrupt them or gate user-owned records. A future paid tier may monetize convenience infrastructure (remote collaboration, maintained regulatory integrations, compute-heavy transcription) without locking local briefs, records or export.

## Rejected / not accepted
- Static global travel-rule encyclopedia.
- Automatic “safe to travel” verdict.
- AI diagnosis/triage requirement from symptom media.
- Giving sitters the owner's complete health/diary/financial history by default.
- Permanent sitter membership when the relationship is temporary.
- Marketplace/booking/community expansion merely because regional competitors have it.

## RESEARCH HANDOFF
1. Extend Care Journey semantics with bounded episode lifecycle: start, active, handback/complete, optional expiry.
2. Temporary caregiver journey should project selected canonical facts/tasks and produce a return summary; actor/timestamp remains on care occurrences.
3. Travel Journey separates durable universal preparation from volatile authoritative regulatory verification; source URL/date/provenance belongs with changing rule tasks.
4. Symptom episode may generate a user-selected vet-prep brief and link post-visit professional instructions back to the episode; no inferred diagnosis.
5. Journey engine should support trigger/anchor + scope + authority/source + suggestion/task promotion + preserved resolution state + completion summary.
6. No new tab, no ad-policy relaxation, no marketplace requirement.
