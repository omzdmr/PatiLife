# PatiLife App Size Budget

PatiLife should be feature-rich without becoming a bloated download. Compact means engineering discipline, not deleting useful product capability.

## Bundle rules
- No bundled demo video library.
- No large stock pet-photo pack in production.
- Prefer system fonts and platform/Material symbols.
- User photos are data, not bundle assets; resize/compress them on import.
- A new dependency must justify its capability and binary-size cost.
- Do not add two packages for the same responsibility.
- Keep ad SDKs isolated and absent until ads are actually enabled.
- Optional provider integrations must not drag large unused assets into the core app.

## Measurement gate
When reproducible Android/iOS release builds exist, every release milestone records:
- Android App Bundle / relevant split download size
- iOS archive/App Store estimated download size where available
- delta from the prior milestone
- major new dependency or asset contributors

A meaningful size regression must be explained. No arbitrary MB target is invented before the first reproducible release baseline exists.
