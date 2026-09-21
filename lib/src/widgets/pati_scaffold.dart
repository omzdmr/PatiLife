import 'package:flutter/material.dart';
import '../design/pati_theme.dart';

class PatiPage extends StatelessWidget {
  const PatiPage({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.trailing,
    this.contentPadding = const EdgeInsets.fromLTRB(
      PatiSpace.md,
      0,
      PatiSpace.md,
      120,
    ),
  });

  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget child;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              PatiSpace.lg,
              PatiSpace.lg,
              PatiSpace.lg,
              PatiSpace.md,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: PatiSpace.xs),
                          Text(
                            subtitle!,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: PatiSpace.md),
                    trailing!,
                  ],
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: contentPadding,
            sliver: SliverToBoxAdapter(child: child),
          ),
        ],
      );
}
