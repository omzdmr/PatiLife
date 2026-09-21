import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PatiPage(
      title: l10n.diaryTitle,
      subtitle: l10n.diarySubtitle,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FilterRow(),
          SizedBox(height: PatiSpace.lg),
          _PhotoMemory(),
          SizedBox(height: PatiSpace.md),
          _CareMemory(),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: 42,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _FilterChip(label: l10n.filterAll, selected: true),
          const SizedBox(width: 8),
          _FilterChip(label: l10n.memories),
          const SizedBox(width: 8),
          _FilterChip(label: l10n.healthTitle),
          const SizedBox(width: 8),
          _FilterChip(label: l10n.care),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) => ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) {},
      );
}

class _PhotoMemory extends StatelessWidget {
  const _PhotoMemory();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      container: true,
      label: '${l10n.memoryDate1}. ${l10n.memoryTitle} ${l10n.memoryDetail}',
      child: PatiSoftCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.38,
              child: PetPhotoSurface(
                borderRadius: PatiRadius.large,
                semanticLabel: l10n.profilePhotoSemantic('Misket'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                PatiSpace.lg,
                18,
                PatiSpace.lg,
                PatiSpace.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.memoryDate1,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: PatiColors.sageDeep,
                        ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    l10n.memoryTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.memoryDetail,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      const _MemoryTag(
                        icon: Icons.restaurant_outlined,
                        text: '62 g',
                      ),
                      const _MemoryTag(
                        icon: Icons.monitor_weight_outlined,
                        text: '2.4 kg',
                      ),
                      _MemoryTag(
                        icon: Icons.check_circle_outline,
                        text: l10n.normal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MemoryTag extends StatelessWidget {
  const _MemoryTag({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(PatiRadius.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: PatiColors.sageDeep),
            const SizedBox(width: 6),
            Text(text, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      );
}

class _CareMemory extends StatelessWidget {
  const _CareMemory();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PatiSoftCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: PatiColors.peach.withValues(alpha: .14),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.vaccines_outlined,
              color: PatiColors.warning,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${l10n.memoryDate2} · ${l10n.vet}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  l10n.vaccineDone,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.vaccineDoneDetail,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
