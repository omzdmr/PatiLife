import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import '../../widgets/pati_surfaces.dart';
import 'quick_log_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => PatiPage(
        title: 'Günaydın',
        subtitle: 'Misket ile bugün',
        trailing: _PetAvatar(onTap: () {}),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PetHeroCard(),
            const SizedBox(height: PatiSpace.xl),
            const PatiSectionHeader(
              title: 'Bugün',
              subtitle: '3 bakım adımı planlandı',
            ),
            const SizedBox(height: PatiSpace.md),
            const _TodayTimeline(),
            const SizedBox(height: PatiSpace.xl),
            const PatiSectionHeader(
              title: 'Hızlı kayıt',
              subtitle: 'Sık yaptıkların tek dokunuş uzağında',
            ),
            const SizedBox(height: PatiSpace.md),
            SizedBox(
              height: 82,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: QuickLogType.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final type = QuickLogType.values[index];
                  return PatiIconTile(
                    icon: type.icon,
                    label: type.label,
                    semanticHint: 'Misket için hızlı kayıt aç',
                    onTap: () => showQuickLogSheet(context, type),
                  );
                },
              ),
            ),
            const SizedBox(height: PatiSpace.xl),
            const _CareSnapshot(),
          ],
        ),
      );
}

class _PetAvatar extends StatelessWidget {
  const _PetAvatar({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        label: 'Aktif hayvan Misket. Hayvan değiştir.',
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: const SizedBox(
            width: 48,
            height: 48,
            child: PetPhotoSurface(
              borderRadius: PatiRadius.pill,
              semanticLabel: 'Misket profil fotoğrafı',
            ),
          ),
        ),
      );
}

class _PetHeroCard extends StatelessWidget {
  const _PetHeroCard();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 286,
        child: PetPhotoSurface(
            semanticLabel: 'Misket, British Shorthair, 2.4 kilogram',
            child: Stack(
              children: [
                const Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0x12000000),
                          Color(0xB8000000),
                        ],
                        stops: [0, .52, 1],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 18,
                  right: 18,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .26),
                      borderRadius: BorderRadius.circular(PatiRadius.pill),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 9,
                          color: Color(0xFFBDE8CC),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Durumu iyi',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  left: 22,
                  right: 22,
                  bottom: 22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Misket',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 31,
                          height: 1,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -.6,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'British Shorthair  ·  2.4 kg',
                        style: TextStyle(
                          color: Color(0xFFECEFED),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ),
      );
}

class _TodayTimeline extends StatelessWidget {
  const _TodayTimeline();

  @override
  Widget build(BuildContext context) => PatiSoftCard(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: PatiSpace.md,
        ),
        child: const Column(
          children: [
            _TimelineItem(
              icon: Icons.medication_outlined,
              time: '09:00',
              title: 'Vitamin',
              detail: 'Günlük takviye',
              completed: true,
            ),
            Divider(),
            _TimelineItem(
              icon: Icons.restaurant_outlined,
              time: '13:00',
              title: 'Öğün',
              detail: 'Yaş mama',
            ),
            Divider(),
            _TimelineItem(
              icon: Icons.vaccines_outlined,
              time: '24 Eki',
              title: 'Karma aşısı',
              detail: 'Yaklaşan sağlık görevi',
              warning: true,
            ),
          ],
        ),
      );
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.icon,
    required this.time,
    required this.title,
    required this.detail,
    this.completed = false,
    this.warning = false,
  });

  final IconData icon;
  final String time;
  final String title;
  final String detail;
  final bool completed;
  final bool warning;

  @override
  Widget build(BuildContext context) => Semantics(
        label: '$time, $title, $detail${completed ? ', tamamlandı' : ''}',
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: Text(
                  time,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: (warning ? PatiColors.peach : PatiColors.sage)
                      .withValues(alpha: .14),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  completed ? Icons.check_rounded : icon,
                  color: warning ? PatiColors.warning : PatiColors.sageDeep,
                  size: 21,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      detail,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).colorScheme.outline,
              ),
            ],
          ),
        ),
      );
}

class _CareSnapshot extends StatelessWidget {
  const _CareSnapshot();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PatiSectionHeader(title: 'Son durum'),
          const SizedBox(height: PatiSpace.md),
          Row(
            children: const [
              Expanded(
                child: _MetricCard(
                  icon: Icons.monitor_weight_outlined,
                  value: '2.4 kg',
                  label: 'Kilo',
                  tint: PatiColors.sage,
                ),
              ),
              SizedBox(width: PatiSpace.sm),
              Expanded(
                child: _MetricCard(
                  icon: Icons.restaurant_outlined,
                  value: '62 g',
                  label: 'Bugünkü mama',
                  tint: PatiColors.peach,
                ),
              ),
            ],
          ),
        ],
      );
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.tint,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color tint;

  @override
  Widget build(BuildContext context) => PatiSoftCard(
        padding: const EdgeInsets.all(18),
        color: tint.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? .15 : .09,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: tint),
            const SizedBox(height: 18),
            Text(value, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 2),
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
