import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished});
  final VoidCallback onFinished;
  @override State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? species;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(PatiSpace.lg),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Spacer(),
        const Icon(Icons.pets_rounded, size: 72, color: PatiColors.sage),
        const SizedBox(height: 24),
        Text('Onlar da aile.', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Text('Sağlık, bakım ve güzel anılar tek sakin yerde.', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 32),
        Text('Kiminle yaşıyorsun?', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        Wrap(spacing: 10, runSpacing: 10, children: ['Kedi', 'Köpek', 'Kuş', 'Tavşan', 'Diğer'].map((value) => ChoiceChip(label: Text(value), selected: species == value, onSelected: (_) => setState(() => species = value))).toList()),
        const Spacer(),
        FilledButton(onPressed: species == null ? null : widget.onFinished, style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(54)), child: const Text('Devam et')),
      ]),
    )),
  );
}
