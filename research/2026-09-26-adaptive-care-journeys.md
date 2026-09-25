# Adaptive Care Journeys — pre-arrival, arrival and first-month guidance

**Research date:** 2026-09-26 +08  
**Scope:** pre-adoption/pre-arrival preparation; first day/week/month; kitten/puppy and newly adopted adult-pet adjustment; adaptive calendar semantics; guidance vs scheduled care.

## Evidence reviewed

Authoritative / veterinary:
- https://www.aaha.org/resources/new-kitten-checklist/
- https://www.aaha.org/resources/what-to-do-before-you-bring-home-a-new-puppy/
- https://www.aaha.org/resources/what-to-do-when-you-first-bring-home-a-new-puppy/
- https://www.aaha.org/resources/new-dog-checklist-your-step-by-step-guide-to-a-successful-start/
- https://www.aspca.org/adopt-pet/adoption-tips
- https://www.aaha.org/resources/2021-aaha-aafp-feline-life-stage-guidelines/behavior-and-environmental-needs-kittens/

Current product / competitor patterns:
- https://apps.apple.com/us/app/pet-care-checklist-dog-cat/id6477887778
- https://apps.apple.com/us/app/purrwell-puppy-care-plan/id6760733683
- https://play.google.com/store/apps/details?id=com.halil.purrwell
- https://www.builtbydusty.com/tools/new-puppy-checklist

Current owner/community signals:
- https://www.reddit.com/r/CatAdvice/comments/1vhj35t/what_do_i_need_to_get_for_a_kitten/
- https://www.reddit.com/r/puppy101/comments/1re1a6e/new_puppy_routine_reality_check_what_actually/
- https://www.reddit.com/r/CatAdvice/comments/1vpuckb/firsttime_cat_owner_what_do_you_wish_you_knew/
- https://www.reddit.com/r/CatAdvice/comments/1vr268s/what_do_you_wish_youd_known_when_you_first_got_a/
- https://www.reddit.com/r/CatOwners/comments/1wgp1jy/i_put_together_everything_i_wish_i_knew_before/
- https://www.reddit.com/r/CatAdvice/comments/1wjoomb/what_do_you_wish_someone_had_told_you_before_you/

## Repeated signals

1. **The owner problem begins before the pet arrives.** Current AAHA guidance explicitly covers questions to ask breeder/rescue, continuity of food/routine, household rules, safe-space setup and realistic expectations before pickup. New-kitten guidance likewise places home preparation and first-vet planning before/around arrival.

2. **Arrival is a transition, not a generic age milestone.** AAHA/ASPCA guidance repeatedly treats the first days/weeks as a distinct decompression/adjustment period. Calm environment, safe space, gradual exploration, routine and not forcing interaction recur across kitten, puppy and adopted-adult guidance.

3. **A sequenced journey is more useful than an encyclopedia.** A current pickup-date tool explicitly sequences preparation around pickup date; current care apps also personalize Today/care-plan surfaces. Community posts repeatedly ask “what do I need before pickup / what should I do in week one?” rather than requesting a large reference library.

4. **Generic schedules must not masquerade as confirmed medical plans.** Veterinary sources consistently route vaccination, parasite prevention, socialization risk and individual health planning through the veterinarian. Existing PatiLife research already rejects birthday-derived universal medical due dates. This run strengthens the distinction between informational suggestions and confirmed scheduled occurrences.

5. **The journey must adapt to reality.** Owners may adopt earlier/later than expected, adopt an adult rather than a puppy/kitten, already have supplies, already have veterinary records, or have resident pets. A rigid checklist would create stale/noisy tasks. Arrival date, species/life stage, household context and completion/dismissal state should shape suggestions.

6. **Adjustment is individual.** ASPCA/AAHA explicitly note that some animals settle quickly and others need more time. Therefore “day 3 = pet must do X” should not be a pass/fail milestone. Time anchors are prompts, while progression can also be gated by owner-observed readiness.

## Product interpretation

### Accept: Care Journey layer
PatiLife should have a lightweight **Care Journey** guidance layer over existing Today + reminder + timeline/profile infrastructure.

Candidate journeys:
- Considering/adopting a pet
- Preparing for arrival
- First day home
- First week / first month
- Puppy/kitten development
- Newly adopted adult decompression
- Introducing a new pet to resident pets
- Moving home
- Later candidates: post-procedure recovery, travel preparation, senior transition

This is **not** a fifth tab and not a separate content database per feature.

### Journey item semantics
A journey item should distinguish:
- **Suggestion / guidance:** informational, contextual, can be done/dismissed/not-applicable; not automatically a care-history fact.
- **Suggested calendar action:** user can explicitly promote it into a reminder/appointment/task.
- **Confirmed scheduled care:** user/vet-provided date, normal reminder occurrence semantics.
- **Observation/readiness checkpoint:** optional owner input that can reveal the next guidance step without scoring the pet.

Useful states: suggested, accepted/scheduled, completed, already-done, skipped/not-applicable, snoozed. Recalculating a journey must preserve user decisions and must not resurrect dismissed/completed items.

### Anchor model
Primary anchors can include:
- planned arrival/pickup date
- actual arrival date
- estimated birthday/age/life stage
- adoption source/context when known
- resident-pet context
- vet-confirmed dates

If planned arrival changes, relative preparation suggestions move. If the pet arrives early, the actual-arrival anchor takes over for post-arrival guidance. Vet-confirmed dates override generic timing suggestions rather than coexisting as duplicate due tasks.

### Progressive guidance, not alarm spam
Today should surface only a few timely, high-value journey items. The full journey can live behind a compact calendar/journey view. Informational tips should not become OS notifications by default. Notification permission and reminder semantics remain separate.

### Safety/content boundary
PatiLife may say “consider/book a first veterinary visit” based on authoritative general guidance, but should not fabricate an individualized vaccine/medication schedule. Medical dates become authoritative only when entered/imported/confirmed from a professional/source record.

## Rejected / insufficient
- A rigid universal day-by-day schedule for every puppy/kitten.
- Automatic medical due dates generated only from birthday or pickup date.
- “3-3-3” or other adjustment heuristics as deterministic pass/fail rules.
- A large standalone article/learning tab.
- Mandatory notifications for informational journey tips.
- Gamified completion scores that imply pet wellbeing.

## Monetization / ads
No new safe ad surface was identified. Arrival-day, first-week safety, medical planning and emergency-adjacent guidance should remain uninterrupted. A future optional content library could have low-risk monetization only if it does not gate the actionable core journey.

## RESEARCH HANDOFF
1. Model Care Journey as a projection/orchestration layer over canonical pet/profile/reminder/timeline data, not a duplicate care database.
2. Preserve separate semantics for guidance suggestion vs user-scheduled/confirmed care.
3. Support planned and actual arrival anchors; recompute relative suggestions without losing completion/dismissal history.
4. Use readiness/context gates where appropriate; do not treat adjustment dates as pass/fail milestones.
5. First implementation target should be pre-arrival -> first day -> first week -> first month, with puppy/kitten and adopted-adult variants.
6. Keep Today compact: a few timely journey cards, deeper plan on demand; no fifth tab.
