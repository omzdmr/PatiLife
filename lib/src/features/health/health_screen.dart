import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PatiPage(
      title: l10n.healthTitle,
      subtitle: l10n.healthSubtitle('Misket'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _WeightSummary(),
          const SizedBox(height: PatiSpace.xl),
          PatiSectionHeader(
            title: l10n.carePlan,
            subtitle: l10n.carePlanSubtitle,
          ),
          const SizedBox(height: PatiSpace.md),
          const _HealthMenu(),
          const SizedBox(height: PatiSpace.xl),
          PatiSectionHeader(title: l10n.records),
          const SizedBox(height: PatiSpace.md),
          Row(
            children: [
              Expanded(
                child: _RecordShortcut(
                  icon: Icons.description_outlined,
                  title: l10n.documents,
                  value: '3',
                ),
              ),
              const SizedBox(width: PatiSpace.sm),
              Expanded(
                child: _RecordShortcut(
                  icon: Icons.medical_information_outlined,
                  title: l10n.allergy,
                  value: l10n.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeightSummary extends StatelessWidget {
  const _WeightSummary();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      label: '${l10n.weightTrend}: 2.4 kg, ${l10n.weightChange30}',
      child: Container(
        constraints: const BoxConstraints(minHeight: 190),
        padding: const EdgeInsets.all(PatiSpace.lg),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF233229)
              : const Color(0xFFE4EEE7),
          borderRadius: BorderRadius.circular(PatiRadius.large),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.weightTrend,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: PatiSpace.sm),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: PatiColors.sage.withValues(alpha: .15),
                      borderRadius: BorderRadius.circular(PatiRadius.pill),
                    ),
                    child: Text(
                      l10n.weightChange30,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: PatiColors.sageDeep,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: PatiSpace.xl),
            LayoutBuilder(
              builder: (context, constraints) {
                final textScale = MediaQuery.textScalerOf(context).scale(1);
                final stackContent =
                    textScale >= 1.6 || constraints.maxWidth < 280;
                final value = Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('2.4', style: Theme.of(context).textTheme.displaySmall),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, left: 5),
                      child: Text(
                        'kg',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ),
                  ],
                );
                const chart = SizedBox(
                  width: 118,
                  height: 54,
                  child: CustomPaint(painter: _TrendPainter()),
                );

                if (stackContent) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      value,
                      const SizedBox(height: PatiSpace.md),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: chart,
                      ),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    value,
                    const Spacer(),
                    chart,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TrendPainter extends CustomPainter {
  const _TrendPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = PatiColors.sageDeep
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height * .76)
      ..cubicTo(
        size.width * .18,
        size.height * .72,
        size.width * .24,
        size.height * .45,
        size.width * .42,
        size.height * .50,
      )
      ..cubicTo(
        size.width * .60,
        size.height * .54,
        size.width * .70,
        size.height * .24,
        size.width,
        size.height * .18,
      );

    canvas.drawPath(path, line);
    canvas.drawCircle(
      Offset(size.width, size.height * .18),
      4.5,
      Paint()..color = PatiColors.sageDeep,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HealthMenu extends StatelessWidget {
  const _HealthMenu();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PatiSoftCard(
      padding:
          const EdgeInsets.symmetric(horizontal: PatiSpace.md, vertical: 5),
      child: Column(
        children: [
          _HealthRow(
            icon: Icons.vaccines_outlined,
            title: l10n.vaccines,
            subtitle: l10n.mixedVaccine,
            badge: l10n.upcoming,
            badgeWarm: true,
          ),
          const Divider(),
          _HealthRow(
            icon: Icons.medication_outlined,
            title: l10n.medications,
            subtitle: l10n.dailySupplement,
            badge: l10n.current,
          ),
          const Divider(),
          _HealthRow(
            icon: Icons.bug_report_outlined,
            title: l10n.parasiteTreatments,
            subtitle: l10n.lastApplied,
          ),
          const Divider(),
          _HealthRow(
            icon: Icons.local_hospital_outlined,
            title: l10n.vetVisits,
            subtitle: l10n.lastVisit,
          ),
        ],
      ),
    );
  }
}

class _HealthRow extends StatelessWidget {
  const _HealthRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.badge,
    this.badgeWarm = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? badge;
  final bool badgeWarm;

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        minTileHeight: 68,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: PatiColors.sage.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: PatiColors.sageDeep, size: 21),
        ),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle),
        trailing: badge != null
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                decoration: BoxDecoration(
                  color: (badgeWarm ? PatiColors.peach : PatiColors.sage)
                      .withValues(alpha: .13),
                  borderRadius: BorderRadius.circular(PatiRadius.pill),
                ),
                child: Text(
                  badge!,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: badgeWarm
                            ? PatiColors.warning
                            : PatiColors.sageDeep,
                      ),
                ),
              )
            : Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).colorScheme.outline,
              ),
      );
}

class _RecordShortcut extends StatelessWidget {
  const _RecordShortcut({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => PatiSoftCard(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: PatiColors.sageDeep),
            const SizedBox(height: 22),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 3),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      );
}
