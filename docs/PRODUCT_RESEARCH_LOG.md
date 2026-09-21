# PatiLife Product Research Log

This is the permanent research memory for PatiLife.

## Rules for research runs
- Search for real user pain, praise and unmet needs in pet-care / pet-health / pet-tracker products.
- Prefer repeated patterns across multiple independent sources over a single loud opinion.
- Include App Store / Google Play reviews when accessible, Reddit/community discussions, competitor support/changelogs and official product documentation.
- Record source links and date.
- Separate evidence from interpretation.
- Do not repeat the same finding every hour unless new evidence materially strengthens or contradicts it.
- Explicitly research ad annoyance, paywall friction, privacy/account complaints, notification reliability, data loss/export, multi-pet support and cross-device expectations.
- Research both Android and iOS expectations.
- When a finding is strong enough to change product requirements, add a short **RESEARCH HANDOFF** section and update PRODUCT_MASTER_SPEC only when justified.

## Entry format
### YYYY-MM-DD HH:mm — Topic
**Sources:** links

**Repeated findings**
- ...

**Contradictions / uncertainty**
- ...

**What this means for PatiLife**
- ...

**RESEARCH HANDOFF**
- Proposed requirement:
- Evidence strength:
- Suggested implementation priority:
- Risks / what not to over-interpret:

---

### 2026-09-22 03:07 +08 — Shared care, reminder recovery, data ownership and monetization trust

**Scope:** multi-pet/household coordination; family and sitter handoff; offline/local-first backup/export; medication/reminder reliability and missed-task recovery; ad/paywall tolerance. Market spot checks included English/global, Japanese, German, French and Turkish surfaces. This was the first external research entry, so no prior finding was duplicated.

**Sources (accessed 2026-09-22):**
- Bean — shared household status, local-first/no-account first pet, offline logging, free export, cancellation behavior: https://bean.pet/
- Notepet — multi-pet medication use, family roles, stock tracking, cloud backup/sync: https://notepet.io/
- DosePaw — offline, family/sitters, encrypted sync, vet-ready PDF: https://www.dosepaw.com/
- Remewdy — local-only core, sitter link, family sync, free CSV/JSON export, lifetime option: https://remewdy.com/
- Burrow — missed-dose alert, caregiver link, adherence history, PDF export: https://www.getburrow.app/
- PetDiary App Store — medication schedules, taken/skipped history, forgotten-dose nudge, PDF/CSV export: https://apps.apple.com/us/app/petdiary-pet-health-tracker/id6770299811
- PetPill App Store — catch-up on unlogged doses, household sharing, widgets, local/iCloud model: https://apps.apple.com/us/app/pet-pill-dog-cat-health-care/id6760020801
- PillPaw App Store — persistent reminders, household attribution, refill/waste tracking, PDF: https://apps.apple.com/us/app/pillpaw/id6787207498
- PawDose App Store — local/no-account/no-ads, care team, quiet hours, PDF/calendar export, lifetime purchase: https://apps.apple.com/us/app/pet-medication-tracker-pawdose/id6760734157
- Everkin App Store — expiring sitter access, family sharing, PDF/CSV export, Dynamic Type: https://apps.apple.com/gb/app/everkin-pet-health-tracker/id6751292489
- Petfetti App Store changelog — user-requested date-range PDF reports and performance work: https://apps.apple.com/us/app/pet-health-tracker-petfetti/id6471319447
- 11pets App Store / Google Play — broad feature set but navigation complaint in review; current Google Play rating 2.2/5 across ~5.69K reviews, illustrating that breadth alone does not create a trusted product: https://apps.apple.com/us/app/11pets-pet-care/id1232470530 and https://play.google.com/store/apps/details?id=com.m11pets.elevenpets
- FamilyPet+ Reddit launch/user feedback — household source-of-truth problem; commenter explicitly asks for export/reminders that survive app abandonment and another asks for prescription/vet-note attachments: https://www.reddit.com/r/SideProject/comments/1uixmy3/i_launched_familypet_one_health_tracker_for_every/
- General medication-app Reddit discussion — offline/no-signup preference and caregiver-count limitation signal: https://www.reddit.com/r/androidapps/comments/1pfx7su/medisafe_no_longer_free_from_2026_best/
- Apple local notification docs — OS can deliver scheduled local notifications when app is not running; pending requests can be inspected/cancelled: https://developer.apple.com/documentation/usernotifications/scheduling-a-notification-locally-from-your-app
- Google Play Ads policy — unexpected full-screen interstitials interrupting another intended action are prohibited: https://support.google.com/googleplay/android-developer/answer/9857753
- Japan: Muzzly JP App Store — persistent reminders, snooze/skip, complex schedules, local/offline core, sitter/family sharing and backup: https://apps.apple.com/jp/app/muzzly-%E3%83%9A%E3%83%83%E3%83%88%E8%96%AC%E7%AE%A1%E7%90%86-%E3%83%AA%E3%83%9E%E3%82%A4%E3%83%B3%E3%83%80%E3%83%BC/id6761260557
- France: Keia — co-parent sharing, full history, one-time premium; Notes4Pets/Animoo — family sharing, PDF, emergency/sitter card: https://keia.app/fr ; https://notes4pets.app/ ; https://animoo.app/
- Turkey: PawCal and Petsita — health/reminder/all-in-one positioning; Petsita explicitly advertises free/no-ads: https://pawcal.net/tr ; https://petsita.com/
- Chinese-language signal: FurNote — food/weight/symptoms/toilet/vet/vaccine/deworming/meds + PDF and multiple-family-member care: https://furnote.io/

**Repeated findings**
- Shared care is not merely “share a profile.” The repeated problem is *coordination*: everyone must see whether a task/dose was done, who did it, and when. Bean, Notepet, PillPaw, Muzzly, Everkin and FamilyPet+ converge on this. The safety-sensitive case is avoiding duplicate medication; the mundane equivalent is avoiding duplicate feeding or missed routine care.
- Sitter handoff is a different permission problem from permanent household membership. Strong implementations use a link or scoped/expiring access instead of asking a sitter to share the owner password or fully join the household. Remewdy and Everkin are particularly explicit here.
- Data portability is part of trust, not an “advanced export” novelty. PDF is for vets/sitters/humans; CSV/JSON is for ownership/backup/migration. Multiple 2026 competitors advertise export as a trust feature, and a recent FamilyPet+ commenter specifically fears lock-in if the app is abandoned.
- Local-first reminders are technically compatible with PatiLife’s architecture. Apple explicitly supports OS-scheduled local notifications that can fire while the app is not running. Competitors increasingly advertise offline reminders/logging rather than requiring a server for basic care.
- A reminder firing is not enough. Products are converging on occurrence states (due/given/skipped/missed), snooze, persistent or follow-up reminders, catch-up for unlogged past doses, and refill/stock warnings. PetDiary’s July 2026 release explicitly added a forgotten-dose nudge; PetPill’s current listing highlights catching up doses nobody logged.
- “All in one” has demand, but breadth can become a liability. 11pets advertises an unusually broad record set, yet its current Google Play surface is 2.2/5 with ~5.69K reviews and an App Store reviewer describes navigation as difficult. This is not proof of a single cause, but it supports PatiLife’s existing compact-shell rule: add capabilities behind coherent surfaces rather than multiplying dashboards and menus.
- Ad-free/privacy-first/no-account language is repeatedly used as a differentiator in 2026 pet-care apps. This is partly competitor marketing, not direct satisfaction evidence, so it should not alone ban ads. However, Google’s current policy independently confirms that unexpected interstitials interrupting user actions are unacceptable. PatiLife’s existing prohibition on routine-navigation and health-flow interstitials is strengthened, not weakened.
- Subscription resistance exists, but willingness to pay is contextual. Current competitors successfully test monthly/annual plans while others prominently sell lifetime purchases or no-subscription positioning. The stronger cross-source principle is: core records, reminders and user-owned data should not become inaccessible when payment stops; premium can reasonably monetize collaboration scale, convenience, richer reports or cloud sync without holding care history hostage.

**Contradictions / uncertainty**
- Most 2026 niche competitors have too few public ratings for statistically useful satisfaction analysis; their feature pages prove product direction, not user approval.
- Persistent/escalating alerts can help chronic-care adherence but can also become notification spam. PatiLife should not blindly copy “nag until acknowledged” for feeding, grooming or low-risk routines. Escalation must be per-task and opt-in/appropriate to importance.
- Local-only storage maximizes privacy and offline behavior but creates device-loss risk. Cloud-only sync improves recovery but conflicts with no-account core use. The evidence favors local-first + optional user-controlled backup/sync rather than either extreme.
- Lifetime pricing gets goodwill in several current apps, but ongoing sync/storage has recurring cost. No pricing requirement is accepted from this research alone.

**What this means for PatiLife**
- Model care as attributable occurrences from the start: `due / completed / skipped / missed`, completion actor and timestamp. This supports solo use today and safe household sync later without redesigning medication history.
- Keep account-free local use. Treat optional backup/sync and household collaboration as add-ons to the local record, not prerequisites for seeing or editing core pet data.
- Plan two distinct sharing modes: household members with durable roles, and sitter/handoff access that is scoped, revocable and preferably expires automatically.
- Make export a product capability, not an afterthought: readable date-range PDF per pet plus machine-readable full-data export. Export should remain available even if a paid plan expires.
- Reminder UX should include snooze, skip with optional reason, missed/unconfirmed recovery and a clear “what is overdue?” Today state. Refill/remaining-quantity tracking is valuable for medications but should not bloat the first generic reminder model.
- Preserve the approved four-tab premium shell. Search, export, documents, sharing and deeper health types should live under coherent existing surfaces rather than spawning a grid of top-level modules.
- Preserve current ad exclusions. If ads are introduced later, keep them passive and clearly separated after non-critical content; no interstitial may gate navigation, save, logging, reminder completion, export or health access.

**RESEARCH HANDOFF**
- Proposed requirement: Care/reminder occurrences must support due/completed/skipped/missed state, actor attribution and timestamp; missed/unconfirmed occurrences remain recoverable instead of silently disappearing.
- Evidence strength: **High** — repeated across current pet-specific competitors, App Store changelogs/listings and household-care problem reports; technically aligned with OS-local notification support.
- Suggested implementation priority: **High, before reminder persistence schema is frozen.** Build the local occurrence model first; collaboration transport can come later.
- Proposed requirement: Core records must be account-free/local-first and exportable; future household/sync features must not make local records or export inaccessible after subscription expiry.
- Evidence strength: **High** for portability/local-first trust direction; **medium** for exact free-vs-paid boundary.
- Suggested implementation priority: **Architecture now; user-facing export at roadmap step 9.**
- Proposed requirement: Separate durable household roles from scoped sitter handoff; sitter access should be revocable and time-bounded where remote sharing exists.
- Evidence strength: **Medium-high** — convergent current competitor pattern with a clear real-world permission distinction.
- Suggested implementation priority: **Design/data-model constraint now; implementation at household/handoff milestone.**
- Risks / what not to over-interpret: Do not turn PatiLife into a medication-only app, do not add server dependency just to imitate real-time competitors, do not infer that every user wants persistent alerts, and do not change the approved visual system based on competitor feature density.

---
