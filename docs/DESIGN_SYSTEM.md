# PatiLife Design System

## Approved direction
The approved visual reference is a calm, modern, premium pet-care UI. It should feel closer to a polished lifestyle/health product than a playful pet-store app.

Reference image: `docs/assets/patilife-design-reference.jpg`

## Design words
**Warm · Simple · Fluid · Premium**

## Palette
These are starting tokens, not arbitrary decorations:
- Background light: warm off-white around `#F7F7F4`
- Primary text: near-black around `#171717`
- Primary accent: sage/soft green around `#6F9E86`
- Secondary warm accent: muted peach around `#E8A87C`
- Dark background: around `#111211`
- Dark surfaces: around `#1B1D1B`
- Dark primary text: around `#F2F3F1`

Use semantic color tokens rather than hard-coding values across widgets.

## Shape
- Large content cards: soft radius roughly 20–28 px
- Smaller chips/controls: 12–18 px depending on density
- Avoid excessive borders. Prefer spacing, subtle tonal surfaces and controlled shadows.
- Cards should not all look identical; hierarchy matters.

## Typography
- Clean system-friendly sans serif.
- Strong but not oversized page titles.
- Body text must survive large Dynamic Type / font scaling.
- Use weight and spacing before introducing extra colors.

## Photography
Pet photography is a core UI layer:
- Home hero card should feature the active pet prominently.
- Profile hero can use a larger edge-to-edge or strongly framed image.
- Diary entries should support meaningful photo presentation.
- Do not reduce pets to tiny avatars everywhere.

## Navigation
Primary structure for first release:
- Home
- Health
- Diary
- Profile

Avoid a giant permanent center “+” action unless research/user testing proves it better. Frequent logging belongs in contextual quick actions and bottom sheets.

## Motion
Motion must explain state change, not decorate it.
- Bottom sheets: short spring-like entrance
- Pet switching: slide/crossfade
- Completed task: restrained check transition + optional subtle haptic
- Graph updates: animate from previous state, not from zero every time
- Shared-element style pet photo transition is desirable where technically reliable
- Respect reduced-motion accessibility settings

## Core screen intent
### Onboarding
- Full-screen, photo-forward opening
- Short human copy, not feature dumping
- Species selection using high-quality cards
- Allow unknown birthday/breed details
- Pet setup should be skippable in non-essential fields

### Home / Today
- Greeting + active pet
- Photo hero card
- Today timeline
- Quick log row: weight, food, medication, toilet, note/photo
- Future ad placement, if enabled, appears only after meaningful care content and must be clearly labeled

### Health
- Clear health summary
- Weight trend
- Vaccines
- Medications
- Parasite treatment
- Vet visits
- Allergies/conditions/documents as product grows

### Diary
- Chronological life timeline
- Photos + short notes
- Care and health events can appear naturally
- Filters should be lightweight
- No social feed mechanics

### Profile
- Large pet photo
- Age, weight, sex, neuter state
- Birthday/adoption date
- Microchip/ID
- Vet
- Additional details
- Warm emotional touches are welcome when they do not reduce clarity

## Platform behavior
Do not force pixel-identical interaction on Android and iOS.
- iOS: native-feeling sheets, swipe/navigation, haptics, context behavior
- Android: predictive back, Material-appropriate motion and system conventions
- Brand and content hierarchy stay consistent across both.

## Dark mode
Dark mode is designed simultaneously with light mode.
- Preserve hierarchy, not merely inverted colors.
- Avoid pure black for every surface.
- Pet images should remain prominent and not be crushed by overlays.

## Accessibility
- Minimum sensible tap targets
- Screen-reader labels for icon-only controls
- Do not encode health status only by color
- Test large text
- Respect reduced motion
- Sufficient contrast in both themes

## Anti-patterns
- Paw prints on every surface
- Childish “cute” visual overload
- Excessive gradients
- Three nested cards for one piece of information
- Giant FAB obscuring content
- Ads placed beside save/confirm/care actions
- UI that requires five taps for a one-number log


## Implementation lock — 2026-09-22

The approved board in `docs/assets/patilife-design-reference.jpg` is the visual source of truth. Future development may improve responsiveness, accessibility and platform-native behavior, but must not casually replace the established palette, hierarchy, photography-first surfaces, rounded-card language or restrained motion.

The mockup board contains an obsolete temporary “PawLife” footer mark. **PatiLife** is the authoritative product name everywhere.

Before changing the visual system, a development run must have either:
1. an explicit user design decision, or
2. strong research evidence recorded in GitHub and a documented design handoff.
