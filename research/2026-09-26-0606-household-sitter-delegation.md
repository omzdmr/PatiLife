# PatiLife Research Snapshot — Household roles, sitter handoff, delegation and offboarding

Date: 2026-09-26 06:06 +08
Scope: household/family sharing permissions and ownership; temporary sitter handoff; delegated/missed-task recovery; shared-care privacy/monetization.
Market rotation: es-419 / Spanish-language surfaces, pt-BR, hi/India, id/Indonesia, plus EN/global control sources. Market-specific independent review volume was uneven, so no locale-specific behavior is promoted without corroboration.

## Why this run
Earlier research already accepted actor-attributed occurrences, temporary sitter as a distinct lifecycle, local-first core, overdue recovery and conflict-safe completion. This run tests the next layer: what membership/ownership semantics are actually needed so sharing does not become a miniature enterprise permissions product.

## Current evidence
### Household and sitter are different relationships
Multiple current products converge on persistent household membership versus bounded caregiver access. ClickPet has family sharing plus time-limited sitter access and deletion protection. Collie uses exact-date sitter invites, pet scope, automatic expiry and revocation. Pett has temporary caretaker expiry and Away mode. PawDone exposes per-pet access, roles and time-limited grants. HuddleCare exposes feature-level view/edit and expiry. Indi Pet uses Viewer/Caretaker/Co-owner roles and ownership transfer. DogLog advertises PIN/view-limit/expiry options.

This is strong convergence across independently positioned products. The user problem is not merely invite someone; it is avoiding permanent over-sharing after a trip and preventing helpers from changing/deleting canonical records.

### Shared care needs attribution, but competitive scoring is not core
Current products repeatedly expose who completed a task and when (PawLog, Who Fed Henry, Pett, PetApps, Collie). That supports safety and coordination. Pawlo additionally markets household contribution summaries and Kima markets leaderboards/streaks. Those are positioning choices, not evidence that competitive caregiver ranking improves pet care. PatiLife should preserve actor/time audit while avoiding default scoreboards that can turn care into household surveillance.

### Delegation should change responsibility, not duplicate the task
Who Fed Henry supports assigning a task to a member; Collie and Pett show that completion by another caregiver must immediately become visible to everyone. Collie also explicitly describes idempotent behavior when two offline caregivers complete the same occurrence. This reinforces the existing occurrence model: assignment is metadata on one canonical occurrence, not a copied reminder per person.

Compact semantics: optional responsible member = who is expected to act; completed-by member = who actually acted; reassignment changes responsibility, not occurrence identity/history; another authorized caregiver may complete when needed with attribution retained. No evidence justifies mandatory assignment. Unassigned any-caregiver tasks remain first-class.

### Offboarding is a safety workflow
Petchecka's July 2026 changelog specifically says ending pairing now fully removes caregiver access immediately. Pett fixed lingering reminders after a user leaves/removes a pet. Indi Pet advertises ownership transfer. These are concrete failure signals: revoking membership must stop future access and future notifications without erasing historical actor attribution.

Implications: revocation/expiry blocks future scoped reads/writes; future assigned occurrences return to needs-attention or explicit reassignment; historical entries retain former-caregiver attribution without requiring live membership; ownership transfer is explicit and cannot strand a household with no controlling owner.

### Sitter handoff should be a projection, not a cloned database
Sitter products repeatedly center feeding, medication instructions, emergency vet/contact, routines, notes and visit/check-in reports. A 2025 Reddit sitter discussion independently adds a concrete need: sitters want medication compliance, not merely a free-text medication card.

PatiLife can satisfy this without another data silo: generate a time-bounded sitter view from canonical pet/routine/medication/emergency data, allow scoped task completion plus notes/photos, and preserve visit summaries in the same timeline.

### Monetization signal is contradictory
Kervo gates household invites/roles behind Pro. Kima gates unlimited members/full history behind Premium. PawLog explicitly keeps family sharing free. PawKit says core family sharing is free and monetizes AI/unlimited documents. Pett gives caretakers access on its free tier while Pro focuses on unlimited pets/AI. Collie moved to fully free shared care.

This is market experimentation, not evidence of user acceptance. There is no basis to lock safety-critical coordination, sitter completion, or access revocation behind a paywall. A household-wide entitlement is less hostile than per-seat pricing if premium sharing enhancements ever exist, but pricing remains unresolved.

## Locale / market notes
- Spanish-language current surfaces (PetApps, Petovi, Muzzly, Snout) strongly reproduce family/caregiver sharing and shared reminder/history needs.
- Brazil: Collie's current changelog explicitly added Brazilian Portuguese; shared household + sitter semantics are identical rather than market-specific.
- India: Indi Pet has unusually explicit Viewer/Caretaker/Co-owner roles and ownership transfer. Other India products skew toward service marketplaces; this does not justify turning PatiLife into booking/tele-vet commerce.
- Indonesia: this run did not find enough high-quality, current independent Indonesian user evidence to justify a locale-specific requirement. Keep global semantics and validate localized copy later.

## Accepted product implications
1. Keep persistent household member and temporary caregiver/sitter as separate membership lifecycles.
2. Use a small role model, not arbitrary ACL sprawl: owner/co-owner, caregiver/editor, viewer, plus temporary expiry and per-pet scope. Sensitive subsets may be hidden from temporary caregivers where needed.
3. Assignment is optional responsibility metadata on a canonical occurrence. Completion always records actual actor/time and stays idempotent.
4. Revocation/expiry immediately removes future access/notifications but never destroys historical attribution; unresolved future assignments need recovery.
5. Sitter brief/visit report is a projection over canonical records/timeline, not a duplicate sitter database.
6. No caregiver leaderboard/contribution score as a default requirement.
7. No new safe ad surface. Household setup, medication delegation, sitter handoff, access/revocation and care completion remain ad-free intended-action/trust surfaces.
8. Pricing unchanged: evidence conflicts on whether sharing should be premium.

## Rejected / not yet justified
Marketplace for sitters/walkers; social chat as a required module; mandatory task assignment; household contribution leaderboard; per-seat pricing; full enterprise-style permission matrix in launch UI.

## Sources
- https://apps.apple.com/us/app/clickpet-pet-care-organizer/id6793457205
- https://apps.apple.com/us/app/collie-pet-care-sitting/id6761584978
- https://apps.apple.com/us/app/pett-pet-care-reminders/id6773452497
- https://apps.apple.com/us/app/pawdone-pet-care-tracker/id6777430187
- https://apps.apple.com/us/app/petchecka-pet-care-sitter/id6771052043
- https://apps.apple.com/us/app/who-fed-henry-pet-care-tracker/id6761395192
- https://kervo.io/
- https://www.pawlog.pet/
- https://indipet.app/en
- https://huddlecare.app/
- https://doglog.app/
- https://www.petsapps.com/
- https://petovi.app/es/
- https://apps.apple.com/es/app/muzzly-medicamentos-y-alertas/id6761260557
- https://apps.apple.com/es/app/snout-salud-de-mascotas/id6760656923
- https://pawkit.io/
- https://www.getkima.com/
- https://www.reddit.com/r/SideProject/comments/1mq21tw
- https://www.reddit.com/r/SideProject/comments/1uixmy3/i_launched_familypet_one_health_tracker_for_every/

## RESEARCH HANDOFF
Developer priority when shared care is implemented: canonical occurrence identity + actor attribution first; then persistent-vs-temporary membership lifecycle and revocation; then optional assignment/reassignment recovery; finally sitter projection/visit report. Keep the launch UI compact. Do not create a new top-level Household or Sitter tab solely to expose these semantics.
