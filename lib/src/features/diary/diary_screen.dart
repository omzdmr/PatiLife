import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});
  @override
  Widget build(BuildContext context) => PatiPage(
    title: 'Günlük', subtitle: 'Bakım kayıtları ve güzel anılar aynı zaman çizgisinde.',
    child: Column(children: const [
      _DiaryEntry(date: '21 Eylül', icon: Icons.photo_outlined, title: 'Koltuğun en rahat yerini yine Misket buldu', detail: 'Sabah mamasının tamamını yedi · 62 g'),
      SizedBox(height: PatiSpace.md),
      _DiaryEntry(date: '20 Eylül', icon: Icons.vaccines_outlined, title: 'Veteriner ziyareti', detail: 'Karma aşısı yapıldı · kontrol notu eklendi'),
    ]),
  );
}

class _DiaryEntry extends StatelessWidget {
  const _DiaryEntry({required this.date, required this.icon, required this.title, required this.detail});
  final String date; final IconData icon; final String title; final String detail;
  @override Widget build(BuildContext context) => Semantics(
    container: true,
    label: '$date, $title, $detail',
    child: Card(child: Padding(padding: const EdgeInsets.all(PatiSpace.lg), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(date, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: PatiColors.sage)), const SizedBox(height: 18),
      Icon(icon, size: 34, color: PatiColors.sage), const SizedBox(height: 14),
      Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)), const SizedBox(height: 8), Text(detail),
    ]))),
  );
}
