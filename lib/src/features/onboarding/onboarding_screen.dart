import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_surfaces.dart';

enum _Species { cat, dog, bird, other }

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    required this.onFinished,
  });

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
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              PatiSpace.lg,
              PatiSpace.md,
              PatiSpace.lg,
              PatiSpace.lg,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - PatiSpace.xl,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          l10n.appTitle,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: PatiColors.sageDeep,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: widget.onFinished,
                          child: Text(l10n.onboardingSkip),
                        ),
                      ],
                    ),
                    const SizedBox(height: PatiSpace.lg),
                    SizedBox(
                      height: 250,
                      child: PetPhotoSurface(
                        semanticLabel: l10n.welcomeGraphicSemantic,
                      ),
                    ),
                    const SizedBox(height: PatiSpace.xl),
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
                    const SizedBox(height: PatiSpace.xl),
                    Text(
                      l10n.onboardingQuestion,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: PatiSpace.md),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.15,
                      ),
                      itemCount: _Species.values.length,
                      itemBuilder: (context, index) {
                        final option = _Species.values[index];
                        final selected = species == option;
                        final label = _label(l10n, option);
                        return Semantics(
                          button: true,
                          selected: selected,
                          label: label,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(PatiRadius.medium),
                            onTap: () => setState(() => species = option),
                            child: AnimatedContainer(
                              duration: PatiMotion.quick,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: selected
                                    ? PatiColors.sage.withValues(alpha: .14)
                                    : Theme.of(context).colorScheme.surface,
                                border: Border.all(
                                  color: selected
                                      ? PatiColors.sage
                                      : Theme.of(context)
                                          .colorScheme
                                          .outlineVariant,
                                  width: selected ? 1.4 : 1,
                                ),
                                borderRadius:
                                    BorderRadius.circular(PatiRadius.medium),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    icons[option],
                                    color: selected
                                        ? PatiColors.sageDeep
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      label,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    const SizedBox(height: PatiSpace.xl),
                    FilledButton(
                      onPressed: species == null ? null : widget.onFinished,
                      child: Text(l10n.continueAction),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
