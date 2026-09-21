import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';
import 'quick_log_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => PatiPage(
        title: 'Günaydın',
        subtitle: 'Misket ile bugün',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Semantics(
            label: 'Misket, kedi. Sağlık durumu iyi.',
            child: Container(
              height: 230,
              padding: const EdgeInsets.all(PatiSpace.lg),
              decoration: BoxDecoration(
                color: PatiColors.sage,
                borderRadius: BorderRadius.circular(PatiRadius.large),
              ),
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
                Spacer(),
                Text('Misket', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Text('British Shorthair · 2.4 kg', style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                _StatusPill(),
              ]),
            ),
          ),
          const SizedBox(height: PatiSpace.lg),
          Text('Bugün', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: PatiSpace.sm),
          const _TimelineItem(icon: Icons.medication_outlined, time: '09:00', title: 'Vitamin', detail: 'Günlük takviye'),
          const _TimelineItem(icon: Icons.restaurant_outlined, time: '13:00', title: 'Öğün', detail: 'Yaş mama'),
          const _TimelineItem(icon: Icons.vaccines_outlined, time: '24 Eki', title: 'Karma aşısı', detail: 'Yaklaşan sağlık görevi'),
          const SizedBox(height: PatiSpace.lg),
          Text('Hızlı kayıt', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: PatiSpace.sm),
          Wrap(spacing: 8, runSpacing: 8, children: QuickLogType.values.map((type) => ActionChip(
            avatar: Icon(type.icon, size: 18),
            label: Text(type.label),
            onPressed: () => showQuickLogSheet(context, type),
          )).toList()),
        ]),
      );
}

class _StatusPill extends StatelessWidget {
  const _StatusPill();
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    decoration: BoxDecoration(color: Colors.white.withValues(alpha: .18), borderRadius: BorderRadius.circular(99)),
    child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.check_circle, color: Colors.white, size: 16), SizedBox(width: 6), Text('Durumu iyi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))]),
  );
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.icon, required this.time, required this.title, required this.detail});
  final IconData icon; final String time; final String title; final String detail;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(children: [
      SizedBox(width: 48, child: Text(time, style: Theme.of(context).textTheme.labelMedium)),
      CircleAvatar(backgroundColor: PatiColors.sage.withValues(alpha: .14), child: Icon(icon, color: PatiColors.sage)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), Text(detail, style: Theme.of(context).textTheme.bodySmall)])),
    ]),
  );
}
