# PatiLife Design Implementation Checklist

This file prevents future development from “remembering” the approved design differently.

## Visual character
- Warm, calm, premium lifestyle/health product.
- Never childish pet-store kitsch.
- Warm off-white + sage is the light-mode backbone.
- Dark mode uses layered charcoal surfaces, not flat pure black.
- Pet photography is a first-class surface once the user provides photos.
- Minimal shadow; hierarchy comes from spacing, tone and typography.

## Locked screen hierarchy
1. Onboarding: cinematic/photo-forward opening, short copy, strong CTA, species cards.
2. Home: greeting, large active-pet hero, Today timeline, quick logging.
3. Health: filters, prominent weight/trend card, vaccines/medicine/vet/documents.
4. Diary: lightweight filters, photo/memory-first chronological cards.
5. Profile: large pet hero, vital stats, “days together” strip, structured identity details.
6. Logging: short bottom sheet; one-number logging must not become a multi-page wizard.

## Motion
- Tiny state feedback: ~160–180 ms.
- Normal state transitions: ~280 ms.
- Deliberate/hero transitions: up to ~420 ms.
- Motion explains state. It is not decoration.
- Reduced-motion support is required before release.

## Density
- Page padding baseline: ~20 px.
- Large cards: ~24–32 px radius.
- Compact controls/chips: ~14–20 px radius.
- Do not nest cards without information hierarchy.

## Monetization
- Existing ad boundary remains disabled until monetization work is explicitly approved.
- Never place ads in onboarding, pet forms, health detail, medicine/vaccine completion, emergency or save/confirm neighborhoods.

## Compactness
- No custom font is required by the visual identity.
- No stock pet-photo pack is required by the app bundle.
- Empty/photo-less states use branded tonal placeholders.
- Real pet photography comes from user-selected media.
