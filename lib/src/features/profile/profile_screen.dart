import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => PatiPage(
        title: 'Misket',
        subtitle: 'British Shorthair',
        trailing: IconButton(
          tooltip: 'Profili düzenle',
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 294,
              child: Hero(
                tag: 'active-pet-photo',
                child: PetPhotoSurface(
                  semanticLabel: 'Misket profil fotoğrafı',
                ),
              ),
            ),
            const SizedBox(height: PatiSpace.md),
            const Row(
              children: [
                Expanded(
                  child: _Fact(
                    value: '2 yaş 3 ay',
                    label: 'Yaş',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _Fact(
                    value: '2.4 kg',
                    label: 'Kilo',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _Fact(
                    value: 'Dişi',
                    label: 'Cinsiyet',
                  ),
                ),
              ],
            ),
            const SizedBox(height: PatiSpace.xl),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hakkında',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: PatiSpace.md),
            const _ProfileDetails(),
            const SizedBox(height: PatiSpace.xl),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                color: PatiColors.sage.withValues(
                  alpha: Theme.of(context).brightness == Brightness.dark
                      ? .15
                      : .09,
                ),
                borderRadius: BorderRadius.circular(PatiRadius.large),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.favorite_rounded,
                    color: PatiColors.sage,
                    size: 22,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Misket seninle 642 gündür',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Nice güzel güne birlikte.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _Fact extends StatelessWidget {
  const _Fact({
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(PatiRadius.medium),
        ),
        child: Column(
          children: [
            Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) => PatiSoftCard(
        padding: const EdgeInsets.symmetric(
          horizontal: PatiSpace.md,
          vertical: 4,
        ),
        child: const Column(
          children: [
            _DetailRow(
              label: 'Doğum günü',
              value: '31 Ağustos 2024',
            ),
            Divider(),
            _DetailRow(
              label: 'Kısırlaştırma',
              value: 'Evet',
            ),
            Divider(),
            _DetailRow(
              label: 'Mikroçip',
              value: 'Eklenmedi',
            ),
            Divider(),
            _DetailRow(
              label: 'Veteriner',
              value: 'Eklenmedi',
            ),
          ],
        ),
      );
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 2,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.chevron_right_rounded,
              color: Theme.of(context).colorScheme.outline,
            ),
          ],
        ),
      );
}
