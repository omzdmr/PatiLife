import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});
  @override
  Widget build(BuildContext context) => PatiPage(
    title: 'Sağlık', subtitle: 'Misket’in bakım geçmişi',
    child: Column(children: [
      Card(child: Padding(padding: const EdgeInsets.all(PatiSpace.lg), child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Güncel kilo', style: Theme.of(context).textTheme.labelLarge), const SizedBox(height: 6), Text('2.4 kg', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)), const Text('Son 30 günde +90 g')])),
        const Icon(Icons.show_chart_rounded, size: 54, color: PatiColors.sage),
      ]))),
      const SizedBox(height: 12),
      const _HealthRow(Icons.vaccines_outlined, 'Aşılar', 'Karma aşısı · 24 Ekim'),
      const _HealthRow(Icons.medication_outlined, 'İlaçlar', '1 aktif takviye'),
      const _HealthRow(Icons.bug_report_outlined, 'Parazit uygulamaları', 'Son uygulama 18 Eylül'),
      const _HealthRow(Icons.local_hospital_outlined, 'Veteriner ziyaretleri', 'Son ziyaret 2 hafta önce'),
    ]),
  );
}

class _HealthRow extends StatelessWidget {
  const _HealthRow(this.icon, this.title, this.subtitle);
  final IconData icon; final String title; final String subtitle;
  @override Widget build(BuildContext context) => ListTile(
    minTileHeight: 68,
    leading: CircleAvatar(backgroundColor: PatiColors.sage.withValues(alpha: .13), child: Icon(icon, color: PatiColors.sage)),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text(subtitle), trailing: const Icon(Icons.chevron_right),
  );
}
