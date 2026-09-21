import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_surfaces.dart';

enum _Species { cat, dog, bird, other }

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished});
  final VoidCallback onFinished;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  _Species? species;

  static const icons = <_Species, IconData>{
    _Species.cat: Icons.pets_rounded,
    _Species.dog: Icons.cruelty_free_rounded,
    _Species.bird: Icons.flutter_dash_rounded,
    _Species.other: Icons.favorite_outline_rounded,
  };

  String _label(AppLocalizations l10n, _Species value) => switch (value) {
        _Species.cat => l10n.cat,
        _Species.dog => l10n.dog,
        _Species.bird => l10n.bird,
        _Species.other => l10n.other,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final media = MediaQuery.of(context);
    final reduceMotion = media.disableAnimations;
    final textScale = media.textScaler.scale(1);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxHeight < 720 || textScale >= 1.6;
            final stackHeader = textScale >= 1.6 || constraints.maxWidth < 360;
            final heroHeight = compact ? 180.0 : 250.0;
            final sectionGap = compact ? PatiSpace.lg : PatiSpace.xl;
            final availableWidth = constraints.maxWidth - PatiSpace.lg * 2;
            final twoColumnCards = availableWidth >= 300;
            final cardWidth = twoColumnCards
                ? (availableWidth - 10) / 2
                : availableWidth;

            final brand = Text(
              l10n.appTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: PatiColors.sageDeep,
                    fontWeight: FontWeight.w900,
                  ),
            );
            final skip = TextButton(
              onPressed: widget.onFinished,
              child: Text(l10n.onboardingSkip),
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                PatiSpace.lg,
                PatiSpace.md,
                PatiSpace.lg,
                PatiSpace.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (stackHeader) ...[
                    brand,
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: skip,
                    ),
                  ] else
                    Row(
                      children: [
                        Expanded(child: brand),
                        const SizedBox(width: PatiSpace.sm),
                        skip,
                      ],
                    ),
                  SizedBox(height: compact ? PatiSpace.md : PatiSpace.lg),
                  SizedBox(
                    height: heroHeight,
                    child: PetPhotoSurface(
                      semanticLabel: l10n.welcomeGraphicSemantic,
                    ),
                  ),
                  SizedBox(height: sectionGap),
                  Text(
                    l10n.onboardingHeadline,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    l10n.onboardingSubtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: sectionGap),
                  Text(
                    l10n.onboardingQuestion,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: PatiSpace.md),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _Species.values.map((option) {
                      final selected = species == option;
                      final label = _label(l10n, option);
                      return SizedBox(
                        width: cardWidth,
                        child: Semantics(
                          button: true,
                          selected: selected,
                          label: label,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(PatiRadius.medium),
                            onTap: () => setState(() => species = option),
                            child: AnimatedContainer(
                              duration: reduceMotion ? Duration.zero : PatiMotion.quick,
                              constraints: const BoxConstraints(minHeight: 72),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: selected
                                    ? PatiColors.sage.withValues(alpha: .14)
                                    : Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: selected
                                      ? PatiColors.sage
                                      : Theme.of(context).colorScheme.outlineVariant,
                                  width: selected ? 1.4 : 1,
                                ),
                                borderRadius: BorderRadius.circular(PatiRadius.medium),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    icons[option],
                                    color: selected
                                        ? PatiColors.sageDeep
                                        : Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      label,
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: sectionGap),
                  FilledButton(
                    onPressed: species == null ? null : widget.onFinished,
                    child: Text(l10n.continueAction),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
