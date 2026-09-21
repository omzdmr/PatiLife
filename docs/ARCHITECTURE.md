# PatiLife Architecture Direction

## Product boundary
PatiLife is one Android+iOS product. Shared behavior should remain cross-platform where practical while system integrations may use native adapters.

## Current phase
The current codebase is the approved visual foundation. The next engineering milestone is real data:
1. persistent first-run onboarding
2. real multi-pet creation
3. migration-safe local persistence
4. active-pet state
5. quick logs persisted as events
6. user photo import/resizing
7. notifications/reminders
8. export/backup/handoff

## Package discipline
Prefer a small dependency surface. A package is added because a real feature needs it, not because it saves a few lines.

## Vertical slice rule
Meaningful work should normally travel through:
domain/model -> persistence -> state/service -> UI/navigation -> accessibility -> tests.

## Ads
Monetization is an isolated boundary. No ad network SDK belongs in health or domain code. The current disabled placement contract exists so monetization can be added without redesigning critical care flows.
