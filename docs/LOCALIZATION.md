# PatiLife Localization Contract

## First-class UI languages
PatiLife is designed from the beginning for:
1. English (`en`)
2. Simplified Chinese (`zh-Hans`)
3. Japanese (`ja`)
4. Korean (`ko`)
5. German (`de`)
6. French (`fr`)
7. Turkish (`tr`)

English is the global fallback.

## Product rules
- UI locale is independent from pet names, veterinary names and user-entered notes.
- User content is never machine-translated silently.
- New feature copy must go through the localization layer before the feature is release-ready.
- Date, time, number and measurement formatting must be locale-aware.
- Long German/French copy, CJK density and large accessibility text are part of layout review.
- System fonts are preferred for compactness and native glyph coverage.
- A locale must not be advertised as complete while important screens remain partially untranslated.

## Market rationale
The initial set targets distinct major/high-value App Store economies while avoiding duplicate language work for countries that share English. Market assumptions are research inputs and may be revisited, but locale removals require an explicit product decision.
