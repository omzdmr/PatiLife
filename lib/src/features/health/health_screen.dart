import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  @override
  Widget build(BuildContext context) => PatiPage(
        title: 'Sağlık',
        subtitle: 'Misket’in sağlık ve bakım geçmişi',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _WeightSummary(),
            const SizedBox(height: PatiSpace.xl),
            const PatiSectionHeader(
              title: 'Bakım planı',
              subtitle: 'Yaklaşan ve düzenli sağlık işleri',
            ),
            const SizedBox(height: PatiSpace.md),
            const _HealthMenu(),
            const SizedBox(height: PatiSpace.xl),
            const PatiSectionHeader(title: 'Kayıtlar'),
            const SizedBox(height: PatiSpace.md),
            const Row(
              children: [
                Expanded(
                  child: _RecordShortcut(
                    icon: Icons.description_outlined,
                    title: 'Belgeler',
                    value: '3',
                  ),
                ),
                SizedBox(width: PatiSpace.sm),
                Expanded(
                  child: _RecordShortcut(
                    icon: Icons.medical_information_outlined,
                    title: 'Alerji',
                    value: 'Yok',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class _WeightSummary extends StatelessWidget {
  const _WeightSummary();

  @override
  Widget build(BuildContext context) => Semantics(
        label: 'Güncel kilo 2.4 kilogram. Son 30 günde 90 gram artış.',
        child: Container(
          height: 190,
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
                  Text(
                    'Kilo eğilimi',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: PatiColors.sage.withValues(alpha: .15),
                      borderRadius: BorderRadius.circular(PatiRadius.pill),
                    ),
                    child: const Text(
                      '+90 g / 30 gün',
                      style: TextStyle(
                        color: PatiColors.sageDeep,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '2.4',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 5),
                    child: Text(
                      'kg',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    width: 118,
                    height: 54,
                    child: CustomPaint(painter: _TrendPainter()),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

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
  Widget build(BuildContext context) => PatiSoftCard(
        padding: const EdgeInsets.symmetric(
          horizontal: PatiSpace.md,
          vertical: 5,
        ),
        child: const Column(
          children: [
            _HealthRow(
              icon: Icons.vaccines_outlined,
              title: 'Aşılar',
              subtitle: 'Karma aşısı · 24 Ekim',
              badge: 'Yaklaşıyor',
              badgeWarm: true,
            ),
            Divider(),
            _HealthRow(
              icon: Icons.medication_outlined,
              title: 'İlaçlar',
              subtitle: '1 aktif takviye',
              badge: 'Güncel',
            ),
            Divider(),
            _HealthRow(
              icon: Icons.bug_report_outlined,
              title: 'Parazit uygulamaları',
              subtitle: 'Son uygulama 18 Eylül',
            ),
            Divider(),
            _HealthRow(
              icon: Icons.local_hospital_outlined,
              title: 'Veteriner ziyaretleri',
              subtitle: 'Son ziyaret 2 hafta önce',
            ),
          ],
        ),
      );
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 5,
        ),
        minTileHeight: 68,
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: PatiColors.sage.withValues(alpha: .12),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            icon,
            color: PatiColors.sageDeep,
            size: 21,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(subtitle),
        trailing: badge != null
            ? Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),
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
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
}
