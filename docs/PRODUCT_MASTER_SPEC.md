# PatiLife — Product Master Spec

## Product goal
PatiLife is a premium-feeling, local-first pet life companion for Android and iOS. The long-term goal is to cover the daily needs that would otherwise force a pet owner to install several separate apps: health records, medication and vaccines, feeding, weight, routines, reminders, memories, documents, household sharing, pet-sitter handoff, emergency information and useful insights.

This file is the product source of truth. Research may propose changes, but accepted product decisions should be written here before implementation.

## Fixed identity
- Product name: **PatiLife**
- Platforms: **Android + iOS**
- Shared product behavior with platform-native interaction details where appropriate.
- Visual direction: warm, calm, modern, premium, photo-forward.
- Local-first by default. Core records must remain usable offline.
- Dark mode is a first-class design target, not an afterthought.
- Accessibility is part of feature completion.
- Multiple pets must be supported by the data model from the beginning.
- Do not require an account merely to use core local features.

## First priority: reproduce the approved visual direction
Before expanding feature breadth, establish the real design system and the core five-screen shell that matches the approved reference:
1. Onboarding
2. Home / Today
3. Health
4. Diary / Memories
5. Pet Profile

The design reference lives at `docs/assets/patilife-design-reference.jpg` when available. The written source of truth is `docs/DESIGN_SYSTEM.md`.

## Product pillars
### 1. Pet identity
- Multiple pets
- Name, species, breed, sex, birthday/estimated age, adoption date
- Weight and healthy-weight history
- Microchip / ID
- Neutered/spayed state
- Primary vet and emergency contact
- Profile photography

### 2. Health record
- Vaccines and boosters
- Medications and supplements
- Internal/external parasite treatments
- Allergies and sensitivities
- Conditions / diagnoses
- Procedures and surgeries
- Vet visits
- Lab/document attachments
- Symptoms / observations
- Exportable vet summary

### 3. Daily care
- Feeding and water
- Toilet/litter observations
- Walks/activity where applicable
- Grooming
- Sleep / routine notes where useful
- Custom recurring care tasks
- Fast one-tap logging

### 4. Reminders
- Vaccine due dates
- Medication schedules
- Parasite treatment schedules
- Vet appointments
- Feeding/routine reminders
- Snooze, completion and missed-task recovery
- Notification permissions handled respectfully

### 5. Diary and memories
- Photo + short note entries
- Health/care events appear in the timeline
- Search/filter by pet and event type
- “On this day” and yearly memory summaries are future candidates
- Diary must remain useful without turning into a social network

### 6. Household and handoff
Future architecture must leave room for:
- Shared household access
- Pet-sitter handoff
- Emergency card
- Read-only vet/export share
- Clear ownership and privacy boundaries

### 7. Insights
- Weight trends
- Feeding/water trends where captured
- Medication adherence
- Vaccine schedule status
- Routine streaks only when they are helpful, never guilt-driven
- Insights must distinguish logged data from medical interpretation

## UX principles
- Frequent actions should usually complete in a bottom sheet or one short flow.
- Do not make users traverse several screens to log weight, food, medication or toilet status.
- “Unknown / I don’t know” must be available for adoption date, breed, birthday and similar fields.
- Photo is part of the interface, not a tiny decorative avatar.
- Critical pet-care tasks take visual priority over monetization.
- Avoid childish paw-print decoration overload.
- Avoid dashboard clutter and “every metric at once” syndrome.

## Architecture principles
- Cross-platform code is preferred for shared product behavior.
- Platform-specific adapters are allowed for notifications, media/files, photo picking, widgets, app lifecycle and other native capabilities.
- Persistent data layer must be migration-safe.
- Feature work should aim for vertical slices: model -> persistence -> service/state -> UI -> accessibility -> tests.
- Avoid speculative backend dependencies for features that can work locally.

## Monetization / ads
PatiLife may add ads later, so placement abstractions should be designed early without forcing a production ad SDK now.

Forbidden ad locations:
- Onboarding
- Pet creation/edit forms
- Medication and vaccine flows
- Vet and health detail screens
- Emergency information
- Destructive confirmation flows
- Any screen where an ad can be confused with a care action

Possible low-friction placements for the free tier:
- A clearly labeled low-profile native/banner slot after the Today task section
- Sparse native placement deep in the diary feed
- End-of-content placement in low-risk statistics/discovery surfaces

Rules:
- No routine-navigation interstitials.
- No deceptive styling or accidental-tap placement.
- No ads that break accessibility or obscure pet-care information.
- Research findings about ad annoyance should update this policy.

## Quality bar
A feature is not “done” merely because a screen exists. For significant features, completion should normally include:
- Data model
- Persistence
- Error/empty states
- Main UI and navigation
- Light/dark modes
- Accessibility semantics and scalable text
- Android/iOS behavior check
- Tests appropriate to the change
- Documentation/handoff when behavior or architecture changes

## Roadmap order
1. Approved design system + navigation shell
2. Onboarding + real pet creation
3. Local persistent pet profiles
4. Home / Today and quick logging
5. Health records, vaccines, medication and vet visits
6. Reminders/notifications
7. Diary/memories
8. Weight/statistics
9. Documents/export/emergency card
10. Household/pet-sitter handoff
11. Research-driven extensions

This roadmap is directional, not an excuse to ignore strong research evidence. Research handoffs should be evaluated, accepted/rejected explicitly, and folded into this spec when warranted.
