# PatiLife Product Research Log

This is the permanent research memory for PatiLife. Detailed source snapshots live under `research/`; this log is the rolling decision/index layer so recurring runs do not rediscover the same evidence.

## Rules for research runs
- Prefer repeated patterns across independent sources over a single loud opinion.
- Include store reviews/listings, communities, competitor support/changelogs and authoritative platform/veterinary sources where relevant.
- Record source links/date and separate evidence from interpretation.
- Do not repeat a finding unless new evidence materially strengthens, narrows or contradicts it.
- Track ad/paywall friction, privacy/account complaints, notification reliability, data loss/export, multi-pet/cross-device expectations and accessibility.
- When evidence changes product requirements, add a **RESEARCH HANDOFF** and update `PRODUCT_MASTER_SPEC.md` only when justified.

---

### 2026-09-22 03:07 +08 — Shared care, reminder recovery, data ownership and monetization trust
**Detailed snapshot:** `research/2026-09-22-0307-shared-care-trust.md`

**Accepted findings**
- Shared care is coordination, not merely profile sharing: care occurrences need status, actor and timestamp to avoid missed/double care.
- Household membership and temporary sitter handoff are distinct permission/lifecycle problems.
- Local-first/no-account core plus optional sync/backup best matches trust and offline needs; PDF + machine-readable export are data-ownership capabilities.
- Notifications are delivery, not source-of-truth; due/completed/skipped/missed occurrences and overdue recovery are required.
- Feature breadth does not justify dashboard/module sprawl; approved four-tab compact shell remains the constraint.
- Routine-navigation, health/logging, reminder-completion and export interstitials remain excluded. Core records/export cannot be held hostage to subscription state.

**Evidence strength:** high for occurrence model, local-first portability and compact-shell direction; medium-high for household-vs-sitter lifecycle; pricing boundary remains unresolved.

---

### 2026-09-22 04:24 +08 — Daily care, life-stage monitoring, timeline retrieval and routine-care monetization
**Detailed snapshot:** `research/2026-09-22-0424-daily-care-life-stage-timeline.md`

**Accepted findings**
- Daily care converges on feeding/appetite, water/thirst, elimination, activity/walk, weight and short observation/symptom; progressive disclosure prevents giant forms.
- Species/life stage changes suggested quick actions, not top-level modules or separate histories.
- Growing pets need longitudinal weight trajectory; senior/chronic care benefits from optional appetite/hydration/elimination/mobility/symptom/QoL observations without a generic diagnostic score.
- Long histories require date-range, category and free-text retrieval; report/export should reuse the same filters.
- Accessibility remains a completion gate; no separate accessible mode is needed.
- No new safe ad placement was justified; logging/history/trends/vet-export/sitter/emergency remain outside rewarded/interstitial gates.

**Evidence strength:** high for shared daily-event vocabulary and timeline retrieval; medium-high for life-stage observations; GPS walks and disease-specific trackers remain optional/later.

---

### 2026-09-22 05:26 +08 — Emergency identity, travel, sitter handoff and document provenance
**Detailed snapshot:** `research/2026-09-22-0526-emergency-travel-handoff-documents.md`

**Accepted findings**
- Emergency, sitter and travel workflows should project the same Profile/Health facts rather than create duplicate databases.
- Microchip reference data benefits from registry/provider and last-verification metadata; a chip number is not proof of current registration.
- Generated Travel Packs are convenience summaries, never official passports/certificates.
- Sitter briefs should be scoped operational handoffs rather than full-history sharing.
- Insurance usefulness in core is durable document organization/provenance, not pretending to know insurer claim state.
- No new safe ad surface emerged for emergency/sitter/travel/document retrieval.

**Evidence strength:** high for projection/document architecture and scoped handoff; public lost-pet hosting/live global travel rules remain later/insufficient.

---

### 2026-09-22 06:05 +08 — Onboarding, accessibility, local-first recovery trust and monetization
**Detailed snapshot:** `research/2026-09-22-0605-onboarding-accessibility-trust.md`

**Accepted findings**
- First value should precede complete profile setup; nonessential profile fields, account, paywall and broad permission prompts come later/contextually.
- Accessibility needs a common-task release matrix across screen reader, 200%+ text, contrast, non-color state, reduced motion, focus and touch targets.
- FR/DE competitors strengthen local-first/no-account positioning; future backup UX should expose configured state, last successful backup and recovery/export while local writes remain authoritative.
- No evidence justified expanding ad surfaces or choosing a pricing model.

**Evidence strength:** high for progressive onboarding/contextual permissions/accessibility; medium-high for backup-state UX; pricing remains unresolved.

---

### 2026-09-22 07:25 +08 — Medication safety, vaccine provenance, vet-visit continuity and document handoff
**Detailed snapshot:** `research/2026-09-22-0725-medication-records-vet-visit.md`

**Scope:** medication/vaccine/parasite adherence; conditions/labs/document provenance; vet appointment before/after continuity; health-flow monetization. Market rotation: English/global plus French, Turkish and Japanese product surfaces.

**Accepted findings**
- Medication definition/schedule and individual dose occurrences are separate records; schedule edits need effective dates and must not create phantom historical misses.
- Compact recurrence needs one-time, fixed times/day, selected weekdays/every-N-days and PRN; professional instructions/source labels remain canonical rather than app-generated medical advice.
- Optional supply/refill tracking solves a different failure from adherence and belongs inside medication, not a new inventory module.
- Vaccine fast entry remains small while optional manufacturer/lot/expiry/clinic/route/site/source-document provenance is preserved.
- Vet appointment/consultation is one durable visit event spanning preparation, visit, documents/instructions and follow-up.
- Original health documents remain canonical; OCR/import is reviewable friction reduction.
- No new safe ad surface or pricing model was justified.

**Evidence strength:** high for medication occurrence/schedule separation and vaccine provenance; medium-high for refill and visit continuity.

---

### 2026-09-22 08:04 +08 — Multi-pet routine attribution, correction/backfill and feeding scope
**Detailed snapshot:** `research/2026-09-22-0804-multipet-routine-attribution.md`

**Scope:** multi-pet daily-care identity; feeding/water/litter routines; correction/backfill; Simplified Chinese/German/Turkish local-first patterns; pet-count/history monetization.

**Accepted findings**
- Multi-pet correctness is event-level: every normal care/health write needs explicit pet identity, and changing the active pet must not silently retarget an in-progress entry.
- Shared litter/water/food can create genuinely ambiguous attribution. For applicable care types, a visibly unattributed/shared-resource observation is more truthful than forcing a pet; it must not become pet-specific health evidence until assigned.
- Quick logs default to now, but durable events need editable occurrence date/time. `occurredAt` is distinct from created/updated metadata; reminder due/completion times remain separate.
- Bulk actions can reduce taps but are risky. Any future multi-pet bulk action explicitly selects and previews affected pets; medication/health is never bulk-completed by default.
- Core feeding remains a quick occurrence with optional amount/food/note. This run does not justify a universal calorie database, barcode scanner, pantry/inventory module or automatic nutrition prescription.
- Current CN products provide additional evidence that no-account/offline/private-cloud/manual-backup approaches are viable product differentiators; network login must not gate local care.
- Competitors commonly monetize pet count/history, but evidence does not establish user acceptance. No PatiLife pricing decision follows; existing records/export cannot become unreadable when entitlement changes.
- Google Play's current disruptive-ads policy reinforces the existing ban on unexpected interstitials around user actions; no new safe ad placement emerged.

**Evidence strength:** high for explicit pet attribution and editable occurrence time; medium-high for honest unattributed shared-resource records and bulk-action safeguards; insufficient for nutrition-suite expansion or pricing changes.

**RESEARCH HANDOFF**
- Data/event layer: explicit `petId` for ordinary writes; preserve `occurredAt` independently from audit timestamps and allow correction/backfill.
- UX: keep active pet visually obvious in quick-log surfaces; freeze/confirm target pet for an in-progress entry rather than silently following a later switch.
- Shared-resource observations: allow `unattributed` only for applicable event types and visually preserve uncertainty.
- Bulk actions: explicit selected-pet scope + preview; never default bulk medication/health completion.
- Feeding: prioritize fast logging and optional reusable food presets before considering calories/inventory/scanning.
- ADS_POLICY and pricing remain unchanged.

---

### 2026-09-22 09:23 +08 — Lost-pet readiness, grooming/dental routines and notification delivery semantics
**Detailed snapshot:** `research/2026-09-22-0923-recovery-routine-reminder-semantics.md`

**Scope:** lost-pet/recovery readiness; grooming/nail/dental home care; iOS/Android notification scheduling/permission behavior; reminder/recovery monetization. Market rotation: English/global + French + Japanese; Turkish-specific signal was too weak to create a requirement.

**Accepted findings**
- Lost-pet core value is readiness, not building a social network: canonical photo/identity/contact/microchip data can generate an offline/shareable Lost Pet Kit with incident-time last-seen details. Public matching/maps/hosted profiles remain later because they create backend, moderation, location/privacy and stale-data obligations.
- Microchip registry/provider + verification metadata is further strengthened by current AAHA evidence; PatiLife must not imply that storing a chip number means the registry is current.
- Grooming, nail trim and tooth brushing repeatedly appear as ordinary recurring care in current French/Japanese products. They belong as presets in the existing routine event/reminder vocabulary, not permanent modules/cards.
- AAHA supports home dental-care history as clinically relevant context, but completion/streaks must not be presented as proof that dental disease is prevented or as a substitute for professional assessment.
- Reminder occurrence state and notification delivery policy are separate. Routine, date-sensitive and genuinely time-sensitive reminders need different platform behavior; do not make every Android reminder an exact alarm or every iOS reminder Time Sensitive.
- Notification permission is contextual and revocable. Denial/degraded delivery never deletes/completes the local occurrence; Today/overdue recovery remains authoritative.
- No new safe ad/paywall surface emerged. Lost-pet recovery and reminder completion remain trust-heavy/intended-action surfaces.

**Evidence strength:** high for microchip verification, routine-care consolidation and platform notification semantics; medium-high for local Lost Pet Kit; insufficient for public lost/found network or a pricing change.

**RESEARCH HANDOFF**
- Profile/Emergency: future Lost Pet Kit is a projection over canonical data plus incident-only last-seen fields; offline/shareable flyer/checklist first, public hosting later.
- Routine care: add coat brushing/bath/nail trim/tooth brushing as presets inside existing quick-log/custom-care infrastructure.
- Reminder architecture: separate occurrence status from delivery policy; support routine/date-sensitive/time-sensitive classes and platform capability/permission state.
- Permission UX: ask when the user enables reminders, surface disabled/degraded state, never block local schedules/history.
- ADS_POLICY and pricing remain unchanged.

---

### 2026-09-22 10:07 +08 — Symptom episodes, lab provenance, senior/QoL and health-data privacy
**Detailed snapshot:** `research/2026-09-22-1007-symptom-labs-qol-privacy.md`

**Scope:** conditions/symptom episodes; longitudinal labs and vet handoff; senior/chronic QoL; health-data privacy/AI boundaries; health-insight monetization. Market rotation: English/global + German + Japanese + Simplified Chinese; Korean signal was insufficient for a market-specific requirement.

**Accepted findings**
- Symptoms are durable episodes/observations, not diagnoses: preserve occurrence/onset, optional resolution, severity/frequency, note/media and optional explicit linkage to a known condition. Logging a symptom never silently creates a diagnosis.
- Lab usefulness starts with provenance: preserve collection date, original value/unit/reference interval/flag, source lab/clinic and source-report linkage. OCR/import remains reviewable; trend presentation does not turn an out-of-range value into a diagnosis.
- Senior/chronic tracking should be opt-in and sustainable: a compact configurable check-in around observable dimensions plus good/bad-day context. Recognized QoL frameworks such as HHHHHMM may be supported explicitly, but PatiLife should not invent a universal pseudo-clinical health score.
- AAHA explicitly frames QoL scales as support for, not replacement of, veterinarian conversations; current Ralph reviews add real longitudinal user evidence that simple daily tracking can remain usable for months and help owners communicate difficult changes.
- Current 2026 privacy-first competitors increasingly make local/no-account/no-tracking boundaries part of the product value. Future PatiLife cloud/AI actions should be explicit, data-minimized and clear about outbound fields, retention and training use; local health history remains usable without AI.
- Health records/content must not become advertising-profile input. No evidence justified rewarded/interstitial gates for symptoms, QoL, labs, trends or vet handoff; optional future compute-heavy AI can be monetized separately without locking the user's own records.

**Evidence strength:** high for lab provenance/source linkage and QoL humility; medium-high for symptom episode structure and explicit AI data-flow disclosure; insufficient for AI triage/diagnosis, cross-lab automatic normalization or a new pricing model.

**RESEARCH HANDOFF**
- Shared timeline: add symptom episodes and senior/chronic observations to the existing event vocabulary rather than creating new tabs.
- Conditions remain explicit facts; symptoms may link to a condition but never infer one automatically.
- Labs: provenance/source document first, OCR/AI second. Preserve original values, units and reference intervals.
- Senior mode: opt-in preset/profile adaptation; show underlying observations/trends before scores and use named recognized scales if a scale is offered.
- Privacy: local core does not depend on AI. Future outbound AI/cloud processing is explicit and minimal; health data stays outside ad profiling.
- ADS_POLICY and pricing remain unchanged.

---
