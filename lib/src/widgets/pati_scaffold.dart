import 'package:flutter/material.dart';
import '../design/pati_theme.dart';

class PatiPage extends StatelessWidget {
  const PatiPage({super.key, required this.title, required this.child, this.subtitle});
  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(PatiSpace.lg, PatiSpace.lg, PatiSpace.lg, PatiSpace.md),
            sliver: SliverToBoxAdapter(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
                if (subtitle != null) ...[
                  const SizedBox(height: PatiSpace.xs),
                  Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                ],
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(PatiSpace.md, 0, PatiSpace.md, 120),
            sliver: SliverToBoxAdapter(child: child),
          ),
        ],
      );
}
