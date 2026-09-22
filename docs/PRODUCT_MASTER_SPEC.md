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
- Microchip / ID; microchip records may include optional registry/provider and last-contact-verification date because PatiLife is not the registry of record
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
- Durable documents preserve the original attachment where practical and carry type/date/event linkage plus optional external reference metadata. Invoice, insurance/EOB, prescription, lab, discharge note and official travel document are document types, not separate product silos.

### 3. Daily care
- Feeding and water
- Toilet/litter observations
- Walks/activity where applicable
- Grooming
- Sleep / routine notes where useful
- Custom recurring care tasks
- Fast one-tap logging
- Daily-care events use a shared vocabulary and durable timeline rather than isolated feature histories. Suggested quick actions may adapt to species, life stage and user preference.
- Progressive disclosure is the default: routine/normal care should usually log in one or two actions; quantity, consistency, severity, media or notes appear only when useful.
- Water tracking must allow qualitative/approximate observations because exact volume is not always measurable in multi-pet/shared-bowl homes.
- Common at-home maintenance such as coat brushing, bathing, nail trimming and tooth brushing belongs as lightweight presets in the same routine event/reminder system, not as separate permanent modules. Professional grooming/dental visits remain distinguishable from at-home care.

### 4. Reminders
- Vaccine due dates
- Medication schedules
- Parasite treatment schedules
- Vet appointments
- Feeding/routine reminders
- Snooze, completion and missed-task recovery
- Care occurrences use explicit `due / completed / skipped / missed` states; completion keeps timestamp and actor attribution so solo history can later support household coordination without a schema rewrite.
- Dismissing or missing a notification must not silently count as task completion. Unresolved overdue occurrences remain recoverable from Today/history.
- Reminder occurrence state and notification delivery policy are separate concerns. The model must leave room for routine, date-sensitive and genuinely time-sensitive delivery classes; platform adapters choose appropriate OS behavior rather than forcing every Android reminder to exact alarms or every iOS reminder to Time Sensitive.
- Notification capability/permission may be denied or later revoked. Degraded delivery must not block local schedules/history or erase/complete occurrences, and the UI should make disabled/degraded notification state understandable.
- Notification permissions handled respectfully and requested contextually when a user enables reminder behavior rather than at cold start.

### 5. Diary and memories
- Photo + short note entries
- Health/care events appear in the timeline
- Long-lived per-pet history supports lightweight date-range, event-category and free-text retrieval as data grows; export/report filtering should reuse the same model.
- “On this day” and yearly memory summaries are future candidates
- Diary must remain useful without turning into a social network

### 6. Household and handoff
Future architecture must leave room for:
- Shared household access
- Durable household member roles and temporary pet-sitter/handoff grants are separate concepts.
- Pet-sitter/handoff access should be scoped, revocable and time-bounded when remote sharing is implemented; shared passwords are not the handoff model.
- A sitter care brief is a deliberately scoped operational projection: feeding, medication instructions, routine, behavior/fears, bathroom habits, vet/emergency contacts and selected critical health facts. It must not expose unrelated diary, lab or financial history by default.
- The sitter brief must remain printable/offline; remote expiring links can extend it later.
- Emergency card
- Read-only vet/export share
- Clear ownership and privacy boundaries

### 7. Emergency and travel
- Emergency Card is an offline, read-only projection over existing Profile + Health facts rather than a separately maintained emergency database.
- Default emergency facts: pet photo/name/species, ID/microchip, owner/emergency contacts, primary/emergency vet, allergies/conditions, active medications/critical instructions and key vaccination status.
- A future Lost Pet Kit should also project canonical Profile/Emergency facts rather than create a new identity store. It may add incident-only last-seen date/time/location/notes and generate an offline/shareable flyer/checklist. Missing or stale contact/microchip-registry verification should be visible before an incident.
- PatiLife must not imply that merely storing a microchip number registers/updates the chip, nor that shelters/registries were notified unless an actual integration completed that action.
- Public lost-pet maps, community matching, hosted public profiles and live alerts remain optional/later because they introduce backend availability, moderation/abuse, location/privacy and stale-contact obligations.
- Travel Pack may organize scans of official passports/certificates, vaccination/rabies information, microchip identity, medications, vet/emergency contacts and expiry/due dates, and generate an offline/printable summary.
- A PatiLife-generated travel summary must never be represented as an official government/veterinary pet passport or animal health certificate. Official-document scans remain distinguishable from app-generated summaries.
- Country-specific travel-rule guidance is optional/later and requires an authoritative maintained source; do not hard-code a static worldwide legal-rule encyclopedia into the core app.
- Public lost-pet QR/profile hosting is optional/later because it introduces backend availability, abuse/privacy and stale-contact obligations. Core emergency identity must not depend on it.

### 8. Insights
- Weight trends
- Feeding/water trends where captured
- Medication adherence
- Vaccine schedule status
- Growing-pet weight history must preserve enough precision for longitudinal growth trajectories; do not reduce puppy/kitten growth to one universal “ideal weight.”
- Optional senior/chronic observations may cover appetite, hydration/thirst, elimination, mobility/activity, symptoms and quality-of-life context without presenting a generic diagnostic health score as medical truth.
- Disease-specific tools such as glucose curves or seizure timers are opt-in future condition modules, not permanent dashboard furniture for every pet.
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
- First-run optimizes for time-to-first-real-record: collect only the minimum pet identity needed to make Today/Profile useful, then offer progressive completion for breed, birthday, sex, microchip, vet, insurance, history and documents.
- Do not front-load account creation, paywall prompts or a burst of permissions before first value. Ask for notification/photo/other permissions contextually when the user invokes the feature that needs them, with graceful denial.

## Architecture principles
- Cross-platform code is preferred for shared product behavior.
- Platform-specific adapters are allowed for notifications, media/files, photo picking, widgets, app lifecycle and other native capabilities.
- Persistent data layer must be migration-safe.
- Feature work should aim for vertical slices: model -> persistence -> service/state -> UI -> accessibility -> tests.
- Avoid speculative backend dependencies for features that can work locally.
- The local database is the authoritative core record. Optional backup/sync/collaboration may extend it, but must not make an account or network connection necessary to read and edit core records.
- User-owned records must have an exit path: plan a human-readable per-pet/date-range PDF and a machine-readable full-data export. Export must not become inaccessible merely because a paid plan expires.
- Today quick logs, Health records and Diary presentation should project coherent views over durable per-pet history where event semantics overlap, rather than forcing users to reconstruct a story from unrelated silos.
- Medical/legal/insurance source attachments should not be destructively recompressed merely to save space. Generated previews may be optimized separately while the source file remains retrievable.
- PatiLife may store insurance documents, invoices, EOBs and external claim references, but insurer claim status is not authoritative without an integration. Do not create a fake local claim-status truth.
- Backup/sync failure must never block local logging. When optional backup exists, the product should be able to communicate whether it is configured, the last successful backup, and an explicit recovery/export path without nagging users who intentionally remain local-only.

## Monetization / ads
PatiLife may add ads later, so placement abstractions should be designed early without forcing a production ad SDK now.

Forbidden ad locations:
- Onboarding
- Pet creation/edit forms
- Medication and vaccine flows
- Vet and health detail screens
- Emergency information
- Lost Pet Kit / active lost-pet recovery flow
- Destructive confirmation flows
- Any screen where an ad can be confused with a care action
- Reminder completion, care logging, export or data-recovery actions
- Timeline/history retrieval, health trends and sitter/vet handoff actions must not be gated by rewarded or interstitial ads
- Emergency Card, lost-pet identity, sitter handoff, Travel Pack/official-document access and insurance/document retrieval are trust-heavy surfaces and must not be interrupted or unlocked by rewarded/interstitial ads

Possible low-friction placements for the free tier:
- A clearly labeled low-profile native/banner slot after the Today task section
- Sparse native placement deep in the diary feed
- End-of-content placement in low-risk statistics/discovery surfaces

Rules:
- No routine-navigation interstitials.
- No deceptive styling or accidental-tap placement.
- No ads that break accessibility or obscure pet-care information.
- No monetization state may make existing local care records unreadable or block the user's data export.
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

Accessibility release validation should use a common-task matrix rather than isolated spot checks. Before claiming store accessibility support, verify applicable core tasks across VoiceOver/TalkBack, platform large-text/accessibility sizes (including 200%+ where required for Apple's Larger Text label), light/dark contrast, state differentiation without color alone, logical focus order, reduced-motion behavior and platform-appropriate touch targets. Core tasks include first pet creation, pet switching, Today quick logging, medication/reminder completion and recovery, health-record creation, Diary retrieval, Profile/Emergency Card and document/export flows.

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
11. Travel Pack and research-driven extensions

This roadmap is directional, not an excuse to ignore strong research evidence. Research handoffs should be evaluated, accepted/rejected explicitly, and folded into this spec when warranted.

## Research-accepted constraints — 2026-09-22
Evidence is recorded in `docs/PRODUCT_RESEARCH_LOG.md` and the dated snapshots under `research/`.
- Reminder/care data is modeled as recoverable occurrences with status, actor and timestamp; notifications are a delivery mechanism, not the source of truth.
- Core local records stay account-free/offline-capable. Optional sync or household collaboration cannot become the only copy or the only way to access core data.
- Data portability is a trust requirement: PDF handoff plus machine-readable export are planned capabilities, and existing user data is never held hostage to subscription state.
- Household membership and temporary sitter handoff require different permission/lifecycle semantics.
- The approved compact four-tab product shell remains the default response to feature growth; research does not justify a module-grid redesign.
- Daily-care breadth is handled through progressive disclosure and adaptable shortcuts, not giant forms or a top-level module per behavior.
- Per-pet history is a durable product surface: as records accumulate it must remain retrievable by date range, event category and free text; report/export uses the same filtering semantics.
- Life-stage depth is optional and contextual: precise growth trajectories and senior/chronic observations are supported without forcing disease-specific tools or generic medical scores onto healthy-pet users.
- Emergency/sitter/travel experiences should reuse existing identity, health and document records as scoped projections rather than duplicate data stores.
- Microchip reference data should leave room for registry/provider and verification metadata; storing a chip number is not equivalent to registering/updating the chip.
- Generated travel summaries are convenience records, never represented as official passports/certificates.
- Insurance value in the core product is durable document organization/provenance, not insurer-specific claim processing.
- First-run setup is progressive: minimum pet identity reaches a useful local shell before nonessential health/profile enrichment, account prompts, monetization prompts or broad permission requests.
- Accessibility is a release/store-trust requirement measured against common tasks, not a decorative afterthought or a separate mode.
- Optional backup/recovery UX must preserve local authority and expose understandable recovery state rather than making sync success a prerequisite for care logging.
- Lost-pet core is readiness-first: an offline/shareable Lost Pet Kit reuses canonical identity/contact/microchip data; public matching/community hosting remains optional/later.
- Common grooming/nail/dental home care is modeled as routine-care presets/events, not separate top-level modules.
- Reminder delivery has urgency classes independent from occurrence state; OS permissions/capabilities can degrade delivery without degrading the underlying local care record.

## Localization contract

PatiLife must be architected for these **10 first-class UI locales** from the beginning:
- English (`en`) — global fallback
- Turkish (`tr`)
- Spanish, Latin America (`es-419`)
- Portuguese, Brazil (`pt-BR`)
- Simplified Chinese (`zh-CN`)
- Hindi (`hi`)
- Indonesian (`id`)
- Japanese (`ja`)
- German (`de`)
- French (`fr`)

The same ten launch languages are targeted for App Store and Google Play metadata/localized screenshots where the stores support them.

UI language is independent from pet/user-entered data. New user-visible features must use the localization layer rather than hard-coded strings. Locale-sensitive dates, numbers and units must be formatted by locale. Accessibility labels are localized. English is the global fallback; a partially translated screen must not be presented as complete support for that language.

See `docs/LOCALIZATION.md` for locale/store mappings and engineering rules.

## Compact-app contract

PatiLife should remain compact without cutting useful features. The strategy is dependency and asset discipline:
- system fonts by default
- no bundled stock-photo/video packs in production
- resize/compress user photos on import instead of shipping media assets
- avoid duplicate libraries that solve the same problem
- keep ad SDKs isolated and absent until monetization is actually enabled
- measure Android and iOS binary-size deltas in reproducible release builds

See `docs/APP_SIZE_BUDGET.md`.
