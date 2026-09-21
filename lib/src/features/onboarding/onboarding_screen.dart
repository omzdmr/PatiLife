import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_surfaces.dart';

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
  String? species;

  static const options = [
    ('Kedi', Icons.pets_rounded),
    ('Köpek', Icons.cruelty_free_rounded),
    ('Kuş', Icons.flutter_dash_rounded),
    ('Diğer', Icons.favorite_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
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
                            'PatiLife',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: PatiColors.sageDeep,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: widget.onFinished,
                            child: const Text('Şimdilik geç'),
                          ),
                        ],
                      ),
                      const SizedBox(height: PatiSpace.lg),
                      const SizedBox(
                        height: 250,
                        child: PetPhotoSurface(
                          semanticLabel: 'PatiLife karşılama görseli',
                        ),
                      ),
                      const SizedBox(height: PatiSpace.xl),
                      Text(
                        'Onlar da aile.',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 9),
                      Text(
                        'Sağlık, bakım ve güzel anılar tek sakin yerde.',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: PatiSpace.xl),
                      Text(
                        'Kiminle yaşıyorsun?',
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
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options[index];
                          final selected = species == option.$1;
                          return Semantics(
                            button: true,
                            selected: selected,
                            label: option.$1,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                PatiRadius.medium,
                              ),
                              onTap: () => setState(
                                () => species = option.$1,
                              ),
                              child: AnimatedContainer(
                                duration: PatiMotion.quick,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
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
                                  borderRadius: BorderRadius.circular(
                                    PatiRadius.medium,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      option.$2,
                                      color: selected
                                          ? PatiColors.sageDeep
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      option.$1,
                                      style:
                                          Theme.of(context).textTheme.labelLarge,
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
                        onPressed:
                            species == null ? null : widget.onFinished,
                        child: const Text('Devam et'),
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
