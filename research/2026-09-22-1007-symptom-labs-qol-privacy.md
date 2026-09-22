# PatiLife research snapshot — symptoms, labs, senior/QoL and privacy

**Run:** 2026-09-22 10:07 +08
**Mode:** product research only; no code.

## Scope
1. Conditions/symptom episodes and how they should survive into vet handoff.
2. Lab-result provenance/trends without turning PatiLife into a diagnostic product.
3. Senior/chronic quality-of-life tracking that stays sustainable and clinically humble.
4. Privacy/AI/monetization boundaries around health records.

Market rotation included English/global, German, Japanese, Simplified Chinese and Korean search surfaces. Stronger product evidence was available in English/German/Japanese/Chinese; Korean search signal in this pass was too thin to justify a market-specific requirement.

## Sources and dates
Authoritative / veterinary:
- AAHA, “How to Assess Your Senior Pet’s Quality of Life,” updated 2025-12-16: https://www.aaha.org/resources/how-to-assess-your-senior-pets-quality-of-life/
- AAHA, “Supporting Your Senior Pet: Veterinary Care Recommendations,” published 2024-10-01: https://www.aaha.org/resources/supporting-your-senior-pet-veterinary-care-recommendations/
- AAHA, senior dog/cat diagnostic tests and recommended frequencies, published 2022-12-12: https://www.aaha.org/resources/2023-aaha-senior-care-guidelines-for-dogs-and-cats/diagnostic-tests-and-recommended-frequencies-for-senior-dogs-and-cats/

Current products / stores:
- Pawsitive App Store listing, current crawl 2026-09: https://apps.apple.com/uy/app/pawsitive-pet-healthcare/id6759310183
- Ralph Pet Wellbeing Tracker App Store listing, current crawl 2026-09: https://apps.apple.com/us/app/ralph-pet-wellbeing-tracker/id6753349694
- Ralph Pet Quality of Life App Store listing/reviews, current crawl 2026-09: https://apps.apple.com/us/app/ralph-pet-quality-of-life/id6480064704
- GoldenYears Pet Tracker App Store listing, current crawl 2026-09: https://apps.apple.com/us/app/goldenyears-pet-tracker/id6771975684
- PetLog Germany App Store listing, current crawl 2026-09: https://apps.apple.com/de/app/petlog-haustier-gesundheit/id6747721421
- Keia German product page, current crawl 2026-09: https://keia.app/de
- Mofuly Japanese product page, current crawl 2026-09: https://www.mofuly.com/
- PetNexa China App Store listing, current crawl 2026-09: https://apps.apple.com/cn/app/petnexa-%E7%8C%AB%E7%8B%97%E5%AE%A0%E7%89%A9%E5%81%A5%E5%BA%B7%E8%AE%B0%E5%BD%95-ai%E5%85%BD%E5%8C%BB%E5%9C%A8%E7%BA%BF%E9%97%AE%E8%AF%8A/id6756158864
- PawChat China product page, current crawl 2026-09: https://www.pawchat.com.cn/index.html
- PawChart, current crawl 2026-09: https://getpawchart.com/
- PawDoc privacy policy, updated 2026-06: https://getpawdoc.com/privacy
- PawLyf privacy policy, updated 2026-05-09: https://pawlyf.health/privacy
- Felova privacy policy, updated 2026-08-03: https://felova.app/privacy
- Pawza privacy/product page, updated 2026-06-06: https://lagerland-apps.github.io/apps/pawza/
- ANMLVR product/privacy page, current crawl 2026-09: https://anmlvr.com/
- Cinna product page, current crawl 2026-09: https://cinna.pet/
- iPaw product page, current crawl 2026-09: https://ipaw.app/

Community / user signal:
- Ralph App Store reviews include a 7-month real-world use case, a user managing a dog with hemangiosarcoma, and a vet-recommended good/bad-day journal; current crawl 2026-09: https://apps.apple.com/us/app/ralph-pet-quality-of-life/id6480064704
- Recent FamilyPet+ Reddit thread includes concern about durable export/reminders and prescription/vet-note attachments; 2026-06/07: https://www.reddit.com/r/SideProject/comments/1uixmy3/i_launched_familypet_one_health_tracker_for_every/
- Older Reddit health-record discussion shows continued fragmentation between clinic portals, email scans and paper records; 2024-01: https://www.reddit.com/r/Pets/comments/19er1lj

## Evidence synthesis

### 1. Symptoms should be episodes, not a pile of disconnected notes
Across PetLog, Keia, Ralph, Pawsitive, PetParent/Pawtient-style products and recent owner/developer discussions, the useful unit is a dated symptom/observation that can recur and be shown to a vet. Ralph exposes severity/frequency and custom symptoms; Pawsitive combines symptoms with labs/feeding/meds in vet-ready reports; German products emphasize one chronological health record.

**PatiLife implication:** a symptom occurrence should minimally support pet, symptom/observation type, onset/occurrence time, optional severity/frequency, note and optional photo/video/document. Repeated observations can be linked to a known condition when the user chooses, but logging a symptom must not silently create a diagnosis. Resolution/end time is useful when known. The same event belongs in the durable timeline and report filters already accepted.

This is not a reason for a new permanent “Symptoms” tab. Health can expose symptom history contextually while Today/Diary remain projections over the same event history.

### 2. Labs need provenance before interpretation
Pawsitive’s current listing is unusually concrete: manual/OCR lab entry, trends, and preservation of the reference ranges printed on the report. PawChart emphasizes extracted facts cited back to source documents. AAHA’s senior guidance reinforces that repeated CBC/chemistry/urinalysis are normal longitudinal care for older animals.

The critical product problem is not “add a green/red lab score.” It is keeping the original result trustworthy across time.

**PatiLife implication:** a structured lab result should preserve collection date, analyte/test name, original value, original unit, original reference interval/flag when supplied, source lab/clinic when known, and a link to the original report. OCR/imported values remain reviewable until accepted. Do not destructively replace the source report or silently normalize units/ranges. Trend charts should compare like-with-like and retain source context; an out-of-range marker is not a diagnosis.

This adds depth to the existing Health/Documents architecture without creating a standalone lab-analysis product.

### 3. Senior/QoL tracking works when it is sustainable, not maximally granular
AAHA explicitly describes HHHHHMM dimensions and says QoL scales support rather than replace veterinarian conversations. Current Ralph reviews are especially useful because one owner used the app consistently for seven months, another was managing hemangiosarcoma day by day, and another reports a vet specifically recommending a good/bad-day journal. The developer’s response to a request for a 1–10 scale also highlights the tension: more granularity feels precise, but a smaller scale is easier to sustain daily.

Current senior-focused apps converge on mobility, appetite/eating, hydration, pain/comfort, happiness/mood/engagement, hygiene/elimination, cognition/energy and good/bad-day context. GoldenYears and Grey add more scoring/AI layers, but this is marketing/product design evidence, not proof that a composite score is medically superior.

**PatiLife implication:** offer an optional Senior/Chronic check-in preset using a small set of observable dimensions and a simple overall-day/good-bad-day marker. Let the user choose which dimensions matter and add notes. If a recognized scale such as HHHHHMM is offered, label it by name and preserve its dimensions; do not invent a PatiLife “health score” that blends weight, vaccines, mood and activity into pseudo-clinical certainty. Trends should show the underlying observations first. A composite, if shown for a validated scale, is decision support/context and never diagnosis or an automated euthanasia recommendation.

### 4. Health privacy is becoming a product differentiator, not boilerplate
Current 2026 products repeatedly market local-first/no-account/no-tracking as a reason to choose them: Pawza, ANMLVR, Mamori/Felova-class products and PawDoc all make data-flow boundaries part of the product story. PawDoc is particularly clear: local records stay on-device; only a user-invoked AI check sends selected symptom/photo data, transiently, with explicit claims about retention/training. PawLyf similarly distinguishes stored records, authorized vet sharing and AI processing. Other products use cloud accounts and broad AI context by default.

**PatiLife implication:** local health history remains authoritative and usable without AI. If PatiLife later adds cloud/AI extraction or symptom assistance, it should be an explicit action with a concise pre-send disclosure of what leaves the device, why, whether it is retained, and whether it is used for model training. AI should receive the minimum context needed for that action rather than silently uploading the whole pet history. Local OCR/on-device extraction is preferable when practical and size/capability budgets allow it.

Health content must not become advertising-profile input. Existing ADS_POLICY already isolates ad SDKs from domain/health data; this run strengthens that boundary.

### 5. Monetization: health interpretation is a tempting but trust-sensitive gate
Current products vary widely: GoldenYears and several AI-first apps put analysis/reporting behind subscriptions; PetIQ explicitly offers more symptom/food assessments in exchange for rewarded ads; other privacy-first apps sell multi-pet/sync/scanning while keeping basic records local. This proves market experimentation, not user acceptance.

There is insufficient independent evidence to justify rewarded ads inside PatiLife symptom/QoL/lab interpretation. A worried owner should not have to watch an ad to understand their own saved observations or retrieve a vet handoff. Optional compute-heavy AI assistance could be a paid extra later, but raw records, trends based on the user’s own data, source documents and export remain accessible under the existing trust contract.

## Contradictions / uncertainty
- Users ask for more granular QoL scoring, while sustainable daily adherence favors simpler scales. Do not resolve this by inventing a universal 1–10 PatiLife score; use optional recognized frameworks plus configurable observations.
- AI-first competitors aggressively market symptom urgency and lab explanations, especially in Chinese/Japanese/German surfaces, but marketing claims are not evidence of diagnostic accuracy or user trust. No AI-triage requirement is accepted from this run.
- Lab trend usefulness is strong, but safe cross-lab/unit normalization is a deeper domain problem. Preserve originals first; sophisticated normalization/interpretation remains later.
- Korean-specific current evidence was too weak in this pass to create a Korea-only requirement.

## Accepted product impact
1. **Symptom episode model:** onset/occurrence, optional end/resolution, severity/frequency, note/media, optional link to an existing condition; symptom does not create diagnosis.
2. **Lab provenance model:** original value/unit/reference interval/flag + collection date + source + original report; OCR is reviewable; trend is not diagnosis.
3. **Optional senior/chronic check-in:** observable dimensions + good/bad-day context, configurable and compact. Recognized QoL scales may be supported explicitly; no invented universal health score.
4. **Health-data processing boundary:** local core works without AI; future cloud/AI actions disclose and minimize transmitted data. Health records are not ad-profile input.
5. **No monetization expansion:** no rewarded/interstitial gate for symptom logging, QoL, lab history/trends or vet handoff. Optional future AI compute may be monetized separately without locking the user’s own records.

## RESEARCH HANDOFF
- Extend the shared event vocabulary rather than adding tabs: symptom episodes and senior/chronic observations are Health/Today/Diary projections over the same durable timeline.
- When lab work begins, prioritize provenance and source-document linkage before OCR magic or AI explanations.
- Senior mode should be an opt-in preset/profile adaptation, not a separate app-within-the-app. Show observations/trends before any score.
- Keep condition records clinician/user-entered facts; symptoms can link to a condition but never infer one automatically.
- Preserve ADS_POLICY. Future AI/cloud features must be separable from the local database and explicit about outbound health data.
