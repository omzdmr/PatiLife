# Care Journeys II — introductions, post-procedure recovery, and moving home

**Research date:** 2026-09-26 +08  
**Scope:** resident-pet introductions; post-procedure recovery; moving-home transition; journey notification/monetization boundaries.  
**Market rotation:** EN plus DE/FR community/product signals. Turkish search signal was too weak/marketing-heavy to create a market-specific requirement.

## Sources reviewed

Authoritative / welfare / veterinary:
- https://www.americanhumane.org/public-education/introducing-cats-to-cats/
- https://education.rspca.org.uk/en/web/rspca/adviceandwelfare/pets/cats/company
- https://www.bluecross.org.uk/advice/pets/introducing-dogs-and-cats
- https://www.acvs.org/small-animal/postoperative-care-after-surgery-what-animal-owners-should-expect/
- https://vcahospitals.com/veterinary-care/primary/know-your-pet/post-operative-instructions-in-dogs
- https://vcahospitals.com/amor/know-your-pet/post-operative-instructions-in-cats
- https://www.cats.org.uk/help-and-advice/home-and-environment/moving-home-with-your-cat
- https://www.bluecross.org.uk/advice/pets/wellbeing-and-care/microchipping-your-dog-or-cat

Current product / market patterns:
- https://apps.apple.com/us/app/pawcovery/id6758590652
- https://furmacy.org/
- https://www.tierschutzbund.de/haustierapp/
- https://carnet-animal.wamiz.com/

Current owner/community signals:
- https://www.reddit.com/r/CatAdvice/comments/1sediyy/introducing_new_cat_to_resident/
- https://www.reddit.com/r/CatAdvice/comments/1v9uk20/how_to_encourage_resident_cat_new_cat_to_get/
- https://www.reddit.com/r/Katzengruppe/comments/1pn2dol/katzenzusammenf%C3%BChrung/
- https://www.reddit.com/r/Katzengruppe/comments/1rzol1z/zusammenf%C3%BChrung_katze_6_jahre_und_kater_9_monate/
- https://www.reddit.com/r/Katzengruppe/comments/1uqqvra/erfahrungen_mit_katzenzusammenf%C3%BChrung/
- https://www.reddit.com/r/chats/comments/1r80bvc/d%C3%A9m%C3%A9nager_avec_un_chat/
- https://www.reddit.com/r/chats/comments/1tyk639/passer_de_maison_%C3%A0_appartement/
- https://www.reddit.com/r/chats/comments/1u975mj/d%C3%A9m%C3%A9nagement_besoin_de_conseils/

## Evidence synthesis

### 1. Pet introductions are readiness-gated, not calendar-gated
American Humane and RSPCA both describe staged introductions: separation/safe room, scent exchange, positive association, controlled visual contact and progressively closer interaction. RSPCA explicitly says the process can take from a week to several months. Blue Cross similarly says pets differ and the pace should follow their comfort.

Current 2026 owner reports show the practical failure mode: owners can make apparent progress and then see stalking/chasing/fear or fighting after allowing freer contact. German community reports likewise describe introductions lasting weeks or months.

**PatiLife implication:** an Introduction Journey must not say “Day 4: open the door.” It should show a stage plus observable readiness questions. The user can hold, step back, or advance. A setback is not failure and should not erase history.

Candidate stages:
1. Prepare separate safe resources/space.
2. Scent-only familiarization.
3. Positive association through barrier/separation.
4. Controlled visual contact.
5. Short supervised interaction.
6. Gradually expanded shared time.
7. Unsupervised access only when the owner is comfortable/safe.

Exact steps vary by species pairing; cat-cat and cat-dog need different presets. No universal duration.

### 2. Journey engine needs reversible progression
The previously accepted Care Journey model supported recomputing dates and preserving completion. Introduction evidence adds a different mechanic: **progress can legitimately move backward**. This is not the same as marking a task incomplete.

The engine should therefore distinguish:
- checklist completion (“safe room prepared”)
- stage/readiness (“comfortable at barrier”)
- current journey phase
- setback/hold/step-back decision

A completed factual checklist item remains completed even if the current phase rolls back.

### 3. Post-procedure recovery is useful, but discharge instructions are canonical
ACVS states that the veterinary surgeon supplies discharge instructions, commonly covering pain management, activity restriction, incision care/monitoring and nutrition/hydration. VCA dog/cat guidance demonstrates why generic recovery advice cannot safely become a universal timed protocol: activity limits, suture removal and return-to-normal depend on the procedure and veterinarian instructions.

Current recovery products (e.g. Pawcovery) show clear demand for a single place combining medications, incision photos, daily check-ins, exercise/rehab and vet-visit preparation. Furmacy also positions medication/symptom/record tracking for post-surgery recovery. These are product claims, not proof that AI healing scores are clinically reliable.

**PatiLife implication:** Recovery Journey should be a **container around imported/entered discharge instructions**, not a procedure encyclopedia that invents dates. It can organize:
- procedure date/type and clinic
- source discharge document
- prescribed medications/reminders
- vet-entered activity restrictions
- incision/photo observations
- appetite/mobility/pain-or-comfort observations
- follow-up appointment / suture or recheck date when explicitly supplied
- questions for next vet visit

Generic guidance can explain how to organize recovery and what to record, while individualized limits/dates must cite the source/vet instruction.

Reject automatic AI “healing score” as a core requirement. Photo timeline is useful as documentation; interpretation is a separate future evidence/safety question.

### 4. Moving home is a real multi-phase journey and connects existing PatiLife data
Cats Protection provides a clear before/during/after structure: prepare safe rooms before the move, secure transport during it, settle initially in a safe room, update microchip details, arrange a new vet/records and update insurance/address. Current French owner discussions repeatedly focus on territory loss, outdoor access and escape/return-to-old-home risk.

**PatiLife implication:** Moving Journey is unusually good product fit because most actions already map to canonical Profile/Emergency/Travel data:
- before: carrier, safe-room plan, medication/food continuity, vet/record transfer if needed
- day-of: secure transport and escape-risk checklist
- after: actual move date anchor, settling observations, microchip/contact verification, vet/insurance address follow-up
- outdoor access: species/context-specific guidance, never a universal countdown presented as a guarantee of safety

Address changes should prompt **verification tasks** for external registries/providers; PatiLife must not imply that editing the local profile updated the microchip registry, insurer or vet.

### 5. Content provenance matters
Journey cards should be able to carry a lightweight source/provenance class:
- PatiLife general guidance backed by maintained authoritative source
- user-created task
- veterinarian/source-confirmed instruction
- external legal/provider requirement where applicable

This lets the UI say why an item exists without turning Today into citation soup. Time-sensitive/legal guidance needs maintenance/versioning rather than being baked forever into the binary.

### 6. Notifications and monetization
These journeys contain safety-critical/high-attention moments. Informational stage guidance should not spam OS notifications. User-accepted tasks/reminders follow the existing reminder delivery model.

No new safe interstitial/rewarded placement was identified. Introduction progression, surgery recovery, medication/incision logging, moving-day escape prevention and identity/microchip verification should remain interruption-free.

## Accepted product findings
- Care Journey progression supports **hold / advance / step back**, not only linear completion.
- Journey factual checklist completion is separate from current phase/readiness.
- Recovery Journey treats vet discharge instructions and explicit professional dates as canonical; generic templates organize rather than prescribe.
- Moving Journey should project existing Profile/Emergency/Health records and create verification prompts for external systems, not duplicate identity data.
- Journey guidance benefits from source/provenance metadata so general guidance, user tasks and professional instructions remain distinguishable.
- No new ad surface or pricing change is justified.

## Rejected / insufficient
- Fixed “day N” pet-introduction progression.
- Universal surgery recovery dates derived only from procedure name.
- AI incision/healing score as an accepted core requirement.
- Local profile address edit implying microchip/insurance/vet systems were updated.
- Mandatory notifications for informational journey steps.
- Separate top-level modules for introductions, surgery recovery or moving.

## RESEARCH HANDOFF
1. Extend Care Journey state model with reversible phase progression: hold / advance / step-back, while preserving factual completed checklist items.
2. Support species/context journey variants rather than a single universal introduction template.
3. Recovery Journey references canonical procedure/medication/visit/document records; vet/source instructions override generic guidance.
4. Add lightweight provenance/source class for journey items.
5. Moving Journey reuses Profile/Emergency data and emits explicit external-verification tasks for microchip/vet/insurance/contact changes.
6. Keep four-tab shell and existing reminder/ad boundaries.
