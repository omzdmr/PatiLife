import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PatiPage(
      title: 'Misket',
      subtitle: 'British Shorthair',
      trailing: IconButton(
        tooltip: l10n.editProfile,
        onPressed: () {},
        icon: const Icon(Icons.edit_outlined),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 294,
            child: PetPhotoSurface(
              semanticLabel: l10n.profilePhotoSemantic('Misket'),
            ),
          ),
          const SizedBox(height: PatiSpace.md),
          Row(
            children: [
              Expanded(
                child: _Fact(
                  value: '2 y 3 m',
                  label: l10n.age,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _Fact(
                  value: '2.4 kg',
                  label: l10n.weight,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _Fact(
                  value: l10n.female,
                  label: l10n.sex,
                ),
              ),
            ],
          ),
          const SizedBox(height: PatiSpace.xl),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              l10n.about,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: PatiSpace.md),
          const _ProfileDetails(),
          const SizedBox(height: PatiSpace.xl),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
                  l10n.togetherDays('Misket', 642),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 3),
                Text(
                  l10n.togetherSubtitle,
                  textAlign: TextAlign.center,
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
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
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final birthday = MaterialLocalizations.of(context)
        .formatMediumDate(DateTime(2024, 8, 31));

    return PatiSoftCard(
      padding:
          const EdgeInsets.symmetric(horizontal: PatiSpace.md, vertical: 4),
      child: Column(
        children: [
          _DetailRow(label: l10n.birthday, value: birthday),
          const Divider(),
          _DetailRow(label: l10n.neutered, value: l10n.yes),
          const Divider(),
          _DetailRow(label: l10n.microchip, value: l10n.notAdded),
          const Divider(),
          _DetailRow(label: l10n.veterinarian, value: l10n.notAdded),
        ],
      ),
    );
  }
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
        padding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
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
                textAlign: TextAlign.end,
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
