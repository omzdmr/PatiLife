# PatiLife research snapshot — activity/walk, puppy/kitten development, location privacy

**Run:** 2026-09-22 11:02 +08  
**Research-only:** no application code changed.

## Why this run
Prior runs already established shared care occurrences, daily-care vocabulary, timeline retrieval, life-stage context, notification semantics, emergency/travel, medication provenance, multi-pet attribution, grooming presets and senior/QoL. This run deliberately tested three less-covered questions: how deep walk/activity tracking should go, whether puppy/kitten development deserves a new module, and what privacy/battery constraints GPS introduces.

## Sources reviewed
### Current store listings / user reviews
- PawPath (US App Store, current listing; GPS, Apple Watch, family sharing, CSV export, precise/background location disclosure): https://apps.apple.com/us/app/pawpath-dog-walking-tracker/id6756942148
- TreatWalk (US App Store; current listing + reviews describing missing/inaccurate distance and input-unit bugs): https://apps.apple.com/us/app/treatwalk-dog-walk-gps-tracker/id6654918214
- dogwalk personal (US App Store; review reports unreliable manual start and desire for duplicate/backfill): https://apps.apple.com/us/app/dogwalk-personal/id493213011
- Fi (US App Store; review history includes implausible car-motion activity and need to correct/reclassify bad activity): https://apps.apple.com/us/app/fi-gps-dog-tracker/id1438036784
- PupIQ (US App Store; 67 ratings; reviews repeatedly ask for explicit accident logging, praise family sharing/no-account/export, and complain about freezes): https://apps.apple.com/us/app/puppy-potty-log-pupiq/id6756012049
- Pup to Date (US App Store; 879 ratings; long-term review evidence for potty/meal/nap/med/bath custom tracking beyond puppyhood): https://apps.apple.com/us/app/pup-to-date-puppy-schedule/id1515338968
- PuppyOnTrack (US App Store; current review reports battery drain/freezes/heat): https://apps.apple.com/us/app/puppyontrack/id6757566265
- Doggy Time (US App Store; 602 ratings; broad puppy/routine tracking and long-term use): https://apps.apple.com/us/app/doggy-time-puppy-potty-log/id1514159866
- DoggyWalk (Japan App Store; 176 ratings; GPS route/surface temperature/family; review requests adding photos later by chosen date): https://apps.apple.com/jp/app/doggywalk-%E7%8A%AC%E3%81%AE%E3%81%8A%E6%95%A3%E6%AD%A9%E8%A8%98%E9%8C%B2%E3%82%A2%E3%83%97%E3%83%AA/id6737010987
- LuWoof / 遛遛汪 (China App Store; 2.6 MB, one-time purchase, no ads, local walk history): https://apps.apple.com/cn/app/%E9%81%9B%E9%81%9B%E6%B1%AA-%E8%AE%B0%E5%BD%95%E8%90%8C%E5%AE%A0%E6%AF%8F%E6%AC%A1%E5%87%BA%E9%97%A8%E6%95%A3%E6%AD%A5/id6783218926
- 去遛狗 (China App Store; 11.7 MB, local storage, GPS route, multi-dog walk): https://apps.apple.com/cn/app/%E5%8E%BB%E9%81%9B%E7%8B%97-%E9%81%9B%E7%8B%97%E8%AE%B0%E5%BD%95%E4%B8%8E%E5%96%82%E9%A3%9F%E7%AE%A1%E7%90%86/id6760640197
- PawTrack (Korea App Store; 23.5 MB, one-tap care + GPS + no account/iCloud + no ads/tracking): https://apps.apple.com/kr/app/%EA%B0%95%EC%95%84%EC%A7%80-%EA%B3%A0%EC%96%91%EC%9D%B4-%EA%B1%B4%EA%B0%95-%EA%B4%80%EB%A6%AC-pawtrack/id6756696421
- 포울리 (Korea App Store; GPS walks integrated with diary/care history): https://apps.apple.com/kr/app/%ED%8F%AC%EC%9A%B8%EB%A6%AC-%EA%B0%95%EC%95%84%EC%A7%80-%EA%B3%A0%EC%96%91%EC%9D%B4-%EC%9D%BC%EA%B8%B0/id6757907165
- Woog (France App Store; 137 ratings, GPS activity/community): https://apps.apple.com/fr/app/woog-balade-pour-chien/id1468519399
- PawTrack (France App Store; local/iCloud, no account, GPS, compact one-tap care): https://apps.apple.com/fr/app/soins-chien-chat-pawtrack/id6756696421
- Pisteo (France; GPS + household + health): https://pisteo.fr/
- Hani Walk (Germany; walk tracking + daily checklist + health record): https://haniwalk.com/de
- MeinSchnuff (Germany; GPS + health + diary + meds/docs/feeding): https://meinschnuff.de/

### Current competitor/product surfaces
- Walky: explicit no-account/no-ads/local/offline walk tracking; optional later sync: https://apps.apple.com/gb/app/walky-dog-walk-tracker/id6759896890
- Pawmi: GPS/activity goals and gamification; claims breed-adjusted goals: https://pawmi.app/
- Povalo: GPS and wellness-score product, with route history/advanced activity behind Pro: https://povalo.com/
- PawKit: all-in-one care + walk timer + family sharing: https://pawkit.io/

### Veterinary / platform authority
- AAHA canine life-stage overview: https://www.aaha.org/resources/how-often-should-my-dog-go-to-the-vet-a-dog-life-stage-guide/
- AAHA canine life-stage checklist (puppy): https://www.aaha.org/wp-content/uploads/globalassets/02-guidelines/canine-life-stage-2019/caninelifestage_checklists_puppy.pdf
- AAHA feline kitten behavior/environment: https://www.aaha.org/resources/2021-aaha-aafp-feline-life-stage-guidelines/behavior-and-environmental-needs-kittens/
- Android background-location battery guidance: https://developer.android.com/develop/sensors-and-location/location/battery
- Android background-location access guidance: https://developer.android.com/develop/sensors-and-location/location/background
- Android 2026 battery technical-quality enforcement: https://developer.android.com/blog/posts/battery-technical-quality-enforcement-is-here-how-to-optimize-common-wake-lock-use-cases
- Google Play sensitive/location permission policy: https://support.google.com/googleplay/android-developer/answer/9888170
- Apple Core Location background guidance: https://developer.apple.com/documentation/corelocation/handling-location-updates-in-the-background
- Apple App Review Guidelines: https://developer.apple.com/app-store/review/guidelines/

## Repeated signals
### 1. Walk tracking is useful, but the durable record is the walk event, not the GPS trace
Across US, French, German, Japanese, Korean and Chinese products, the stable common denominator is **walk duration/history**; GPS route/distance is a common enhancement. Current user reviews also show route capture can fail, fail to start, record zero/incorrect distance, or misclassify movement. This is important for PatiLife because a failed GPS session must not erase the fact that the walk happened.

**Product implication:** a walk is a normal timeline/care event with pet attribution, occurrence/start/end, duration and optional note/events. GPS route/distance is optional evidence attached to that event. Users must be able to save/correct a walk when route capture is absent or wrong. Do not make map geometry the primary key or truth source.

### 2. Multi-dog walk attribution needs an explicit participant set
Current Walky, Chinese 去遛狗 and German/French products explicitly support multiple dogs on one walk. This strengthens the prior event-attribution decision but reveals a legitimate many-pet exception: a single walk can belong to several selected pets.

**Product implication:** ordinary health/care writes stay single-pet, but a walk session may explicitly select multiple participating pets before/at save. It must not silently mean “all household pets.” This is narrower and safer than a generic bulk-event mechanism.

### 3. GPS must be user-initiated and lifecycle-bounded
Android and Apple both advise limiting background location to user-visible features that genuinely need it; Android explicitly notes significant battery impact and in 2026 began store-quality treatments for excessive wake locks. Current app reviews independently report battery/heat problems and unreliable GPS/activity data.

**Product implication:** PatiLife should not continuously track pet-owner location. Location is requested contextually when the user starts optional GPS walk tracking, clearly indicates active tracking, and stops when the walk ends/cancels/times out. A manual/no-GPS walk remains first-class. Background route capture, if implemented, is only for an explicitly active walk.

### 4. Raw walk routes are privacy-sensitive and unnecessary for advertising
A route can reveal home/work/routine even though the subject is “the dog's walk.” Current privacy-first products increasingly advertise local storage/no tracking. Google Play treats precise location as personal/sensitive data and requires minimum scope; Apple places strong restrictions around sensitive fitness/health data and behavioral advertising.

**Product implication:** raw route coordinates stay out of ad targeting/profiling and generic analytics payloads. Local-first route storage is preferred. Export/share is user-initiated. Future cloud sync should minimize route retention and make route sharing explicit rather than piggybacking on a care-record share.

### 5. Puppy/kitten value is contextual guidance and routine presets, not a new permanent module
AAHA life-stage guidance shows puppy/kitten needs are genuinely age-sensitive: growth, socialization/handling, behavior, nutrition, parasite/vaccine discussions and more frequent veterinary care. But veterinary schedules are individualized by species, breed/size, risk and veterinarian; current puppy apps that auto-date everything from birthday are product conveniences, not authoritative care plans.

Current user evidence from PupIQ/Pup to Date shows the practical pain is much simpler: “when did they last pee/eat/sleep/wake?”, accidents, household coordination and quick logging. These are already PatiLife daily-care/reminder primitives.

**Product implication:** use a **life-stage preset/lens** that can suggest relevant quick actions and optional checklists (potty/accident, meal, water, nap/sleep, weight, socialization/handling note, vet/vaccine reminders entered/confirmed by owner). Do not add a fifth puppy tab or hard-code a universal medical schedule from birth date alone.

### 6. Development milestones should be memories/observations, not fake pass/fail health tests
Milestone tracking appears in current products and fits Diary. But developmental timing varies. AAHA emphasizes sensitive periods and individual variation rather than a rigid universal score.

**Product implication:** optional milestone entries (first home day, first walk, first successful toilet routine, first grooming handling, etc.) can be Diary/timeline events. They should be editable/custom and emotionally useful, not diagnostic gates or a “development score.”

## Contradictions / uncertainty
- GPS is widespread, but prevalence is not proof that every PatiLife user wants route maps. Cats, indoor pets and many species gain little from it. Treat it as contextual dog/activity depth, not shell furniture.
- Breed/age-based activity goals are heavily marketed by Pawmi/Povalo and others, but this run did **not** find enough independent veterinary/user evidence to justify PatiLife prescribing a precise universal daily step/distance target. Keep user-set/vet-guided goals possible; do not invent a “scientific” target engine yet.
- Automatic walk detection sounds convenient, but false positives and battery/location cost are real. No requirement accepted for passive always-on walk detection.
- Puppy prediction apps can be useful, but reviews show predictions can remain approximate. PatiLife should surface observed patterns before promising prediction accuracy.
- Korean was included in the requested market-rotation list, but the repository's current localization contract is 10 locales and does not include Korean. Korean market evidence was used for product research only; this run does not silently alter localization scope.

## Monetization / ads
No new safe interstitial/rewarded placement emerged. In particular:
- never interrupt an active walk with an interstitial;
- never place ads near Start/Pause/Stop/Save walk controls;
- raw location/route history is not ad-profile input;
- route/history correction and export are user-data functions, not rewarded gates.
A low-profile ad after completed non-critical Today content remains the least risky existing candidate; this run does not broaden ADS_POLICY.

## Accepted product delta
1. Walk becomes a first-class shared timeline event with optional GPS route attachment; manual/no-GPS logging and correction/backfill remain supported.
2. Walk sessions may explicitly select multiple participating pets; this is a scoped exception, not generic bulk health logging.
3. GPS collection is contextual, user-initiated and bounded to an active walk; no always-on passive location requirement.
4. Raw route coordinates are excluded from ad targeting/profiling and generic analytics.
5. Puppy/kitten support is a life-stage preset/lens over existing quick logs, reminders, growth and Diary milestones, not a new top-level module or universal auto-generated medical schedule.
6. No precise breed-based activity target engine, automatic walk detection, social walk map or sleep sensor integration is accepted from this evidence.

## RESEARCH HANDOFF
- **Event model:** allow a walk event/session with selected participant pet IDs, start/end/occurredAt, duration, optional manual distance, optional route attachment and correction metadata. Keep route failure independent from event validity.
- **UX:** start GPS only from an explicit walk action; show active tracking clearly; support Stop/Cancel/recovery and a no-GPS/manual path. Keep this inside Today/Diary rather than a new tab.
- **Life stage:** puppy/kitten mode should tune suggested quick actions/checklists and Diary milestones. Medical due dates remain owner/vet-confirmed records, not silently generated clinical truth.
- **Privacy/performance:** raw coordinates local-first by default; never ad-profile them; request minimum location scope and benchmark battery/thermal behavior before claiming GPS walk completion.
- **Design:** no evidence justifies changing the approved four-tab/photo-forward design system.
- **Monetization:** ADS_POLICY unchanged; active walk and route-history correction/export are protected intended-action/data surfaces.
