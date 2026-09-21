# PatiLife Localization Contract

PatiLife ships one cross-platform product for Android and iOS. The first public localization set is fixed at **10 UI languages**.

| UI locale | Language | App Store metadata | Google Play listing |
| --- | --- | --- | --- |
| `en` | English | English (U.S./U.K. as appropriate) | en-US / en-GB |
| `tr` | Turkish | Turkish | tr-TR |
| `es-419` | Spanish (Latin America) | Spanish (Mexico) | es-419 |
| `pt-BR` | Portuguese (Brazil) | Portuguese (Brazil) | pt-BR |
| `zh-CN` | Simplified Chinese | Chinese (Simplified) | zh-CN |
| `hi` | Hindi | Hindi | hi-IN |
| `id` | Indonesian | Indonesian | id |
| `ja` | Japanese | Japanese | ja-JP |
| `de` | German | German | de-DE |
| `fr` | French | French | fr-FR |

## Fallback
English is the global fallback. Spanish resolves to Latin American Spanish, Portuguese to Brazilian Portuguese, and Chinese to Simplified Chinese unless a later product decision adds regional variants.

## Engineering rules
- All new user-visible UI strings must come from Flutter gen-l10n ARB resources.
- Pet names, breeds, notes and other user-entered data are never translated.
- Locale-sensitive dates, numbers, weights and units must use locale formatting rather than embedded demo strings as persistence work lands.
- Accessibility labels are localized too.
- A language is not considered release-complete while a visible production screen still falls back to another language.
- Store metadata and screenshots should be localized for the same ten launch locales.
- Translation changes must preserve layout under long German/French strings and non-Latin scripts.
- Do not bundle language-specific fonts unless system fallback is demonstrably insufficient.

## Why these ten
This set balances broad download reach (including India, Brazil and Indonesia), major mobile monetization markets (English-speaking markets, Japan, Germany and France), iOS reach in Simplified Chinese, and Turkish as a first-class home/product language.
