import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) => PatiPage(
        title: 'Günlük',
        subtitle: 'Bakım kayıtları ve güzel anılar',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FilterRow(),
            const SizedBox(height: PatiSpace.lg),
            const _PhotoMemory(),
            const SizedBox(height: PatiSpace.md),
            const _CareMemory(),
          ],
        ),
      );
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 42,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            _FilterChip(label: 'Tümü', selected: true),
            SizedBox(width: 8),
            _FilterChip(label: 'Anılar'),
            SizedBox(width: 8),
            _FilterChip(label: 'Sağlık'),
            SizedBox(width: 8),
            _FilterChip(label: 'Bakım'),
          ],
        ),
      );
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
  Widget build(BuildContext context) => Semantics(
        container: true,
        label:
            '21 Eylül. Misket koltukta uyuyor. Sabah mamasının tamamını yedi.',
        child: PatiSoftCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AspectRatio(
                aspectRatio: 1.38,
                child: PetPhotoSurface(
                  borderRadius: PatiRadius.large,
                  semanticLabel:
                      'Misket koltukta uyurken çekilmiş fotoğraf',
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
                      '21 Eylül',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: PatiColors.sageDeep,
                          ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'Koltuğun en rahat yerini yine Misket buldu.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sabah mamasının tamamını yedi.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    const Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _MemoryTag(
                          icon: Icons.restaurant_outlined,
                          text: '62 g',
                        ),
                        _MemoryTag(
                          icon: Icons.monitor_weight_outlined,
                          text: '2.4 kg',
                        ),
                        _MemoryTag(
                          icon: Icons.check_circle_outline,
                          text: 'Normal',
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
            Icon(
              icon,
              size: 16,
              color: PatiColors.sageDeep,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      );
}

class _CareMemory extends StatelessWidget {
  const _CareMemory();

  @override
  Widget build(BuildContext context) => PatiSoftCard(
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
                    '20 Eylül · Veteriner',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Karma aşısı yapıldı',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Kontrol notu eklendi ve sonraki doz planlandı.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
