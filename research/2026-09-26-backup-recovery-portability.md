# Backup, recovery, migration and data-portability trust

**Research date:** 2026-09-26 +08
**Scope:** local-first backup/recovery, device migration, cross-device sync, export/import, media coverage, subscription/data-access boundaries.
**Market rotation:** English/global + Japanese + Simplified Chinese + German/French surfaces where current evidence was useful. No Korean scope.

## Sources and context

Platform / authoritative:
- Android Auto Backup: https://developer.android.com/identity/data/autobackup
- Android Large Backups API: https://developer.android.com/identity/data/large-backups
- Apple iCloud Backup overview: https://support.apple.com/108770
- Apple restore workflow: https://support.apple.com/118105
- Apple Core Data + CloudKit mirroring: https://developer.apple.com/documentation/CoreData/mirroring-a-core-data-store-with-cloudkit

Current products / support:
- 11pets export support: https://www.11pets.com/en/news/export-data
- PETNOTE Japan App Store: https://apps.apple.com/jp/app/petnote/id6798993628
- 念宝宠物记 App Store: https://apps.apple.com/us/app/%E5%BF%B5%E5%AE%9D%E5%AE%A0%E7%89%A9%E8%AE%B0/id6810975614
- 宠伴记 App Store CN: https://apps.apple.com/cn/app/%E5%AE%A0%E4%BC%B4%E8%AE%B0-ai%E5%AE%A0%E7%89%A9%E5%81%A5%E5%BA%B7%E5%8A%A9%E6%89%8B-%E7%8C%AB%E7%8B%97%E7%BF%BB%E8%AF%91%E5%99%A8-%E5%96%82%E5%85%BB%E4%BD%93%E9%87%8D%E8%AE%B0%E5%BD%95%E4%B8%8E%E7%85%A7%E6%8A%A4%E6%8F%90%E9%86%92/id6799696225
- HeyPaw: https://heypaw.ai/
- Bean: https://bean.pet/
- Remewdy: https://remewdy.com/

User-review evidence:
- 11pets current review aggregation: https://mwm.ai/apps/11pets-pet-care/1232470530
- 11pets App Store review (Aug 2026): https://apps.apple.com/kw/app/11pets-pet-care/id1232470530
- Petable App Store: https://apps.apple.com/us/app/petable/id798660145

## Repeated findings

### 1. “Local-first” without visible recovery is not enough
Long-lived pet records become emotionally and clinically costly to lose. Current 11pets reviews include years of records becoming inaccessible after product/account/update changes, and users explicitly asking for a complete usable export. Petable reviews show the related failure mode where an abandoned/buggy app leaves previously useful records practically unusable.

PatiLife should treat recovery as a user-visible trust feature, not merely an implementation detail.

### 2. Sync, backup, transfer and export are four different promises
They solve different failures:
- **sync:** keeps active replicas current across devices; deletions/corruption may also propagate.
- **backup:** recoverable copy after loss/corruption.
- **device transfer:** moves state to a replacement device.
- **export:** user-owned portable artifact independent of PatiLife runtime/account.

Marketing/UI must not call one of these another. A green “Synced” badge must not imply a separately recoverable backup exists.

### 3. OS backup alone cannot be PatiLife’s recovery contract
Android Auto Backup is conditional, normally periodic, limited to 25 MB, stores only the latest backup, and may never run if conditions are unmet. Media-rich pet histories can exceed that limit. Android now has a Large Backups path, but it uses the user’s Google One quota and is a separate capability.

Apple device backup can include third-party app data that is not otherwise synced, but restoration is device-level and depends on an available backup. CloudKit-style sync is a separate architecture.

Therefore PatiLife may integrate platform backup/transfer, but cannot present “your PatiLife history is safely backed up” merely because the OS supports backup.

### 4. Media coverage must be explicit
A current CN pet app explicitly says records may use optional iCloud sync while original photos remain local and are not included in that record backup. That is privacy/size-efficient but creates a dangerous expectation gap if the UI just says “backup on.”

PatiLife backup status should disclose scope, e.g. records/documents/photos and whether original media is protected. Generated thumbnails/previews are reconstructable and should not be treated as irreplaceable backup content.

### 5. Migration is a first-class pet-owner need
PETNOTE Japan added account-linked data transfer specifically for device changes/other devices. Current privacy-first products also expose profile export/import or optional sync without requiring an account for local core use.

This supports an explicit **Move to new device / Restore** entry point rather than hoping users understand platform settings.

### 6. Export must survive subscription changes
Current competitors vary: some paywall full export/cloud backup; others promise CSV/JSON export free forever. The strongest negative review pattern is not “premium exists”; it is losing access to previously entered records or receiving unusable/blank exports after a product/paywall change.

PatiLife’s existing rule that existing records and machine-readable export cannot be held hostage is strongly reinforced. Export should be versioned and complete enough to reconstruct canonical records, not merely a pretty PDF.

### 7. Import/restore needs integrity semantics
A portable backup is only useful if restoration is safe. Product requirement inferred from the failure evidence:
- validate archive/schema before destructive changes;
- show what will be restored (pets, records, attachments/media coverage, backup date/version);
- restore transactionally or stage then commit;
- preserve unknown/newer fields where feasible or fail clearly rather than silently dropping them;
- never silently merge duplicates;
- keep the source archive untouched.

This is an engineering/product trust requirement rather than a competitor checkbox.

## Product implications

### Accept: Recovery Center as a compact settings surface
Do **not** add a fifth tab. A compact Settings/Profile “Data & Recovery” surface can show:
- Local data: authoritative and available offline
- Backup: configured/not configured, provider/method, last successful backup, scope, warning if stale/failed
- Sync: separately configured state and last successful sync when applicable
- Export: human-readable PDF + machine-readable archive
- Restore/import
- Move to new device

The language must distinguish “not configured” from “failed” and “never successfully backed up.”

### Accept: portable archive contract
Machine-readable full export should be a versioned archive containing canonical structured records plus user-owned source attachments/media selected by the export scope. Generated thumbnails/caches are excluded. Manifest should carry archive/schema version, creation time, pet count, record counts and attachment/media inventory/checksums sufficient to validate completeness.

A PDF is for humans/vets; it is not the only backup format.

### Accept: truthful backup health
Backup status is based on observed successful completion, not intent/configuration. “Backup enabled” and “Last successful backup” are separate. Failure never blocks local writes.

### Accept: subscription downgrade safety
If future paid sync/cloud storage expires:
- local canonical records remain readable/editable;
- export remains available;
- no records are deleted to enforce entitlement;
- cloud-retention/deletion policy must be explicit before expiry;
- app should offer export/recovery before any provider-side retention deadline.

## Conflicts / uncertainty
- Current competitor marketing frequently claims “secure cloud backup” without enough public detail to judge actual restore reliability. Marketing claims were not counted as satisfaction evidence.
- One or two dramatic data-loss reviews do not prove every cloud architecture is unsafe. They do prove that loss/inaccessibility has unusually high severity and that recovery must be testable and visible.
- Exact future provider choice (iCloud/Google Drive/app cloud/user-selected file) is not resolved by this pass. Local-first identity argues for provider abstraction and portable export before choosing a backend.
- Automatic full-resolution photo backup can become expensive/large; this pass supports explicit scope and truthful status, not unlimited bundled cloud storage.

## Monetization / ads
- Backup status, restore/import, device migration and full user-data export are trust/recovery actions: no interstitial/rewarded gates.
- Cloud storage/sync capacity can be a future paid convenience because it has ongoing cost, but payment must not gate access to existing local records or a complete portable export.
- No new safe ad placement emerged.

## RESEARCH HANDOFF
1. Treat sync, backup, device transfer and export as separate capabilities/states in model and copy.
2. Add a compact Data & Recovery surface; no new top-level tab.
3. Backup state records provider/method, configured state, last successful completion, scope and last error/degraded state.
4. Define a versioned portable archive + manifest; PDF remains a presentation/handoff format, not the recovery format.
5. Restore/import is previewed and validated before commit; no silent destructive merge or silent field/media loss.
6. Explicitly disclose media coverage. Source media/documents are user-owned; generated previews/caches are reconstructable.
7. Future paid cloud/sync may expire without deleting/locking local canonical records or full export.
8. Add restore/migration tests to release-quality gates once implementation reaches this slice.
