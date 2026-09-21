# PatiLife Advertising Policy

PatiLife may be ad-supported in a future free tier. The product should be architected so monetization can be added without redesigning critical care flows.

## Non-negotiable exclusions
Never place ads in:
- onboarding
- pet creation/edit forms
- medication/vaccine scheduling or completion
- health/vet detail
- emergency information
- destructive confirmation dialogs
- permission prompts
- save/confirm button neighborhoods where accidental taps are plausible

## Allowed candidates
Only after research confirms they remain acceptable:
- clearly labeled low-profile native/banner slot after Today care content
- sparse diary feed native slot with strong visual separation
- end-of-content slot in non-critical statistics/discovery surfaces

## Behavior
- No routine-navigation interstitials.
- No ad on every tab change.
- No fake notification badges.
- No ads styled as pet-care tasks.
- No forced video to save or view health data.
- Ad failure must never break the care experience.
- Paid/ad-free architecture may be considered later but must not hold user data hostage.

## Engineering
Use an abstract placement layer (for example AdSlot / AdPlacement) before binding the product to a specific ad network. Development builds can use disabled or placeholder implementations. Keep SDK code isolated from domain and health data.
