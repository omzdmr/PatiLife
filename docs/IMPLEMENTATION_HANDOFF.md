# PatiLife implementation handoff

## 2026-09-22 — Design shell milestone B

The approved design reference is now treated as a **design gate**, not merely inspiration. Feature expansion should not redefine the visual language while this milestone is active.

### What changed in milestone B
- Expanded the design tokens into a coherent light/dark system: semantic sage, warm peach, surfaces, typography, controls, navigation, inputs and motion timing.
- Rebuilt Home/Today around a genuinely photo-forward hero contract rather than a flat green placeholder card.
- Added reusable premium surfaces and section hierarchy so future screens do not invent their own card language.
- Reworked Today timeline, quick actions and care snapshot to match the calm lifestyle/health direction.
- Rebuilt Health with a prominent weight-trend surface, care-plan hierarchy and compact record shortcuts.
- Rebuilt Diary as a memory-first feed with a large photo surface, tags and separate care-event language.
- Rebuilt Profile around a large shared pet-photo hero, compact facts, clean details and one restrained emotional moment.
- Rebuilt onboarding with a strong visual opening and species cards rather than generic ChoiceChip-only UI.
- Upgraded the quick-log sheet so it behaves like the intended short one-sheet action pattern.
- Preserved four-tab navigation, no giant FAB, no visible ad placeholders inside care flows.
- Added/expanded widget tests covering navigation, quick logging, Health/Profile content and onboarding selection.

### Photography contract
Real user-selected pet photography will replace the branded fallback through the shared PetPhotoSurface API. The design-reference collage itself is **not** shipped as pet content. Until pet creation/persistence lands, the fallback keeps layout, overlays, contrast and photo proportions stable without introducing a remote-image dependency.

### Design gate for hourly development
Until the visual milestone is explicitly closed:
1. New feature work must use the central theme/tokens and shared surfaces.
2. Do not add a fifth visual card language, giant FAB, paw-print decoration, broad gradients or navigation interstitials.
3. Home hero, Health summary, Diary memory card, Profile hero and quick-log sheet are the visual anchors.
4. Dark mode and text scaling must stay part of completion.
5. Product research can recommend feature priority, but should not silently replace the approved visual direction.

### Next product slice after design gate
Wire real first-run onboarding + multi-pet profile persistence, then feed the active pet and their chosen photo into the existing visual shell. After that, make quick logs persistent.
