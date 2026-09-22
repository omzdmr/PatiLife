# PatiLife research snapshot — lost-pet recovery, routine care and reminder semantics

**Time:** 2026-09-22 09:23 +08  
**Code changes:** none

## Scope
1. Lost-pet / recovery readiness without turning PatiLife into a social network.
2. Grooming + dental/home-care as recurring routine-care records.
3. Notification reliability and urgency semantics on iOS/Android.
4. Monetization boundary around reminders and recovery.

Market rotation emphasized English/global, French and Japanese current product surfaces; Turkish search produced weaker independent evidence this round and did not justify market-specific requirements.

## Sources and evidence

### Authoritative / platform
- AAHA, **7 Benefits of Microchipping Your Pet**, updated 2026-07-10: https://www.aaha.org/resources/benefits-of-microchipping-your-pet/
  - Microchips are durable identity but do not replace visible ID; registration/contact linkage is what enables reunion.
- AAHA Universal Pet Microchip Lookup: https://www.aaha.org/for-veterinary-professionals/microchip-registry-lookup-tool-aaha-find-your-pets-microchip-registry/
  - A chip number may map to one or multiple registries; lookup does not itself update owner data. Registry/provider matters.
- AAHA, microchip provider closure background: https://www.aaha.org/trends-magazine/publications/microchip-company-closes-unexpectedly-what-it-means-for-pet-owners-veterinary-practices/
  - Provider closure can sever the useful contact linkage while the physical chip remains functional. This strengthens the already-accepted registry + verification metadata requirement.
- Pet FBI lost/found service and action plans: https://petfbi.org/ and https://petfbi.org/i-lost-a-cat/lost-cat-action-plan/
  - Recovery is an action workflow: notify chip company/local agencies, search locally, create/share reports/flyers and keep information current. Species/context changes tactics.
- AAHA dental care, updated 2026-01-26: https://www.aaha.org/resources/your-pets-dental-care/
  - Daily brushing is presented as the best at-home plaque-reduction method; professional dental care remains separate.
- AAHA dental guidelines: https://www.aaha.org/resources/2019-aaha-dental-care-guidelines-for-dogs-and-cats/history-and-physical-examination/ and https://www.aaha.org/resources/2019-aaha-dental-care-guidelines-for-dogs-and-cats/recommending-products/
  - Home dental efforts are clinically useful history; brushing frequency and products can be recorded without PatiLife inventing treatment recommendations.
- Apple local notification scheduling: https://developer.apple.com/documentation/UserNotifications/scheduling-a-notification-locally-from-your-app
  - Local notifications are OS-scheduled and remain usable without a remote server; scheduled requests should be cancelled when the underlying reminder is completed/changed.
- Apple notification authorization: https://developer.apple.com/documentation/UserNotifications/UNUserNotificationCenter/requestAuthorization(options:completionHandler:)
  - Permission should be requested in context; users can later change notification capabilities.
- Apple Time Sensitive interruption level: https://developer.apple.com/documentation/usernotifications/unnotificationinterruptionlevel/timesensitive
  - Time Sensitive can break through Focus/summary, but users can disable it. It is therefore an escalation tool, not a default label for every pet-care reminder.
- Apple notification HIG (Chinese localization): https://developer.apple.com/cn/design/human-interface-guidelines/notifications
  - Important information must remain discoverable inside the app because badges/notification behavior can be disabled.
- Android notification permission behavior: https://developer.android.com/about/versions/13/behavior-changes-all
  - Android 13+ uses runtime POST_NOTIFICATIONS permission.
- Android alarm scheduling: https://developer.android.com/develop/background-work/services/alarms
  - Most apps should use inexact alarms; exact alarms are reserved for genuinely precise user-facing timing and require additional permission on Android 12+.

### Current product surfaces / market signals
- French App Store — PawTrack: https://apps.apple.com/fr/app/soins-chien-chat-pawtrack/id6756696421
  - Current listing groups grooming, dental care, meals, medication and vet tasks under a common reminder vocabulary; local/iCloud and no-account positioning.
- French App Store — PawReminder: https://apps.apple.com/fr/app/pawreminder-soin-des-animaux/id6758776370
  - Grooming appears as a recurring health/care reminder beside vaccine/parasite tasks; activity feed consolidates care events.
- French App Store — Pilou: https://apps.apple.com/fr/app/pilou-carnet-de-sant%C3%A9-animal/id6803716462
  - Current listing includes grooming, nail clipping and dental care in the same health history, with local/no-server/no-ad positioning.
- Japanese App Store — ペットライフ: https://apps.apple.com/jp/app/%E3%83%9A%E3%83%83%E3%83%88%E3%83%A9%E3%82%A4%E3%83%95/id6758835494
  - Current Japanese product includes trimming, nail clipping and tooth brushing as ordinary care records and supports configurable advance reminders.
- Japanese App Store — PetCarely: https://apps.apple.com/jp/app/petcarely-%E3%83%9A%E3%83%83%E3%83%88%E7%AE%A1%E7%90%86/id6760217033
  - Daily care, grooming/care and health notes share one timeline rather than separate app sections.
- French App Store — PokiPaw: https://apps.apple.com/fr/app/pokipaw-carnet-sant%C3%A9-chien/id6761670616
  - Lost/found community, flyer and microchip features demonstrate the breadth possible, but the listing alone is not evidence that PatiLife should build a community network.
- Sniffix: https://sniffix-app.com/
  - Lost/found matching requires live location/community/backend infrastructure, reinforcing that a true public recovery network is a materially different product obligation.
- The Lost Pet HQ: https://thelostpethq.com/
  - A compact recovery utility can generate a flyer/checklist/resources without needing to become the registry/community itself.

## Repeated findings

### 1. Lost-pet value splits cleanly into **readiness** and **live network**
PatiLife already stores the facts needed for recovery readiness: photo, identity, microchip/registry, contacts and health-critical information. Strong evidence supports making those facts easy to verify and rapidly turn into an offline/shareable recovery artifact.

A public lost/found map, community matching, live alerts and hosted public profile are different: they require backend availability, moderation, abuse controls, location/privacy decisions and stale-contact handling. Competitors prove this category exists, not that it belongs in PatiLife core.

**Product interpretation:** strengthen a local-first **Lost Pet Kit** as a projection, not a fifth tab: current photo, distinguishing marks, microchip/registry/verification state, owner/alternate contact, last-seen fields entered at incident time, and a printable/shareable flyer/checklist. External registry/community links may be contextual. Do not claim PatiLife has registered the chip or notified shelters unless an actual integration did so.

### 2. Grooming, nails and dental care are a shared routine-care vocabulary, not three modules
French and Japanese current products repeatedly place grooming/trimming, nail clipping and tooth brushing alongside other recurring care. AAHA independently supports dental home-care history as meaningful health context.

**Product interpretation:** extend custom/routine care with optional presets such as brushing coat, bath, nail trim and tooth brushing. These create ordinary timeline events/reminders and can carry a short note. They do not deserve permanent dashboard cards. Professional grooming/dental appointments remain visit/service events rather than being confused with at-home completion.

Dental safety boundary: PatiLife may track what the owner did and preserve vet instructions; it should not infer that a streak means dental disease is prevented or substitute a home-care streak for professional assessment.

### 3. Reminder reliability requires **urgency semantics**, not “make every alarm exact”
Apple and Android both give the OS/user meaningful control over notification delivery. Android explicitly says most apps should use inexact alarms and reserves exact alarms for strong precise-time use cases. Apple Time Sensitive can break Focus but can be disabled by the user.

**Product interpretation:** reminder occurrence remains source-of-truth. Add an internal urgency/timing policy rather than treating every care task identically:
- routine/low urgency (grooming, nail trim, general feeding routine): normal notification; overdue state remains visible in Today;
- date-sensitive (vaccines, parasite treatment, appointments): configurable advance reminders + due-day reminder;
- genuinely time-sensitive medication dose: may qualify for stronger platform behavior when the user explicitly configures it and platform policy/permission allows.

Do not promise “guaranteed exact delivery.” If notification permission/capability is unavailable, Today/overdue recovery still works. Permission should be requested when the user first enables a reminder, not at cold start.

### 4. Recovery and reminder surfaces remain poor ad/paywall targets
No new evidence justified an ad surface. Lost-pet response is urgent and trust-heavy; reminder completion is an intended action. Interstitial/rewarded gates here would directly conflict with the existing product contract.

Competitor pricing varies widely: free/no-ad, subscriptions, one-time purchases, and pet/reminder limits all exist. Presence of those models does not prove user acceptance. No pricing requirement is changed.

## Contradictions / uncertainty
- Lost-pet community features can be useful, but evidence here is mostly competitor capability plus specialist recovery services, not proof that PatiLife users want another community. Keep public hosting/networking later.
- Dental daily brushing has authoritative support, but adherence gamification/streaks were not independently shown to improve owner behavior in this research. Track completion without guilt mechanics.
- Exact notification behavior is platform- and permission-dependent. Medication may justify stronger timing than grooming, but a blanket exact-alarm entitlement would be poor engineering and product policy.
- Turkish market search in this round produced insufficient independent high-quality signal for a Turkish-specific requirement. Do not manufacture one.

## PatiLife impact / accepted recommendation
1. Add a future **Lost Pet Kit** projection under Profile/Emergency, reusing canonical pet/contact/microchip data and adding incident-only last-seen fields when invoked. Offline/shareable flyer/checklist is core-compatible; public hosted profile/community remains later.
2. Routine-care model should support lightweight grooming/nail/dental presets through the existing event/reminder system, not new modules.
3. Reminder model should carry an urgency/timing class separate from occurrence state. Platform adapters choose appropriate scheduling; UI never promises impossible exact delivery.
4. Reminder permission/capability state should be understandable and recoverable; denied notifications do not erase or complete tasks.
5. ADS_POLICY remains unchanged and should explicitly treat Lost Pet Kit/recovery as emergency-adjacent if implementation ambiguity arises.

## RESEARCH HANDOFF
- **Profile/Emergency:** design Lost Pet Kit as another projection of canonical identity/contact data. Include registry verification state and make stale/missing contact data visible before an incident.
- **Routine care:** add presets only inside existing quick-log/custom-care vocabulary: coat brushing, bath, nail trim, tooth brushing. Keep custom labels for species-specific care.
- **Reminder architecture:** separate `occurrence status` from `delivery policy`; support routine/date-sensitive/time-sensitive classes without defaulting every Android reminder to exact alarms or every iOS reminder to Time Sensitive.
- **Permission UX:** request notification permission contextually on reminder enablement; surface disabled/degraded notification state without blocking local schedules/history.
- **Monetization:** no interstitial/rewarded/paywall in reminder completion/recovery or Lost Pet Kit. No pricing decision from this round.
