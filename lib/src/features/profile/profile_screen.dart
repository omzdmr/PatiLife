import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';
import '../../widgets/pati_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => PatiPage(
    title: 'Misket', subtitle: 'British Shorthair',
    child: Column(children: [
      Container(
        height: 220,
        decoration: BoxDecoration(color: PatiColors.sage.withValues(alpha: .22), borderRadius: BorderRadius.circular(PatiRadius.large)),
        child: const Center(child: Icon(Icons.pets_rounded, size: 74, color: PatiColors.sage)),
      ),
      const SizedBox(height: 16),
      const Row(children: [Expanded(child: _Fact('2 yaş 3 ay', 'Yaş')), SizedBox(width: 8), Expanded(child: _Fact('2.4 kg', 'Kilo')), SizedBox(width: 8), Expanded(child: _Fact('Dişi', 'Cinsiyet'))]),
      const SizedBox(height: 18),
      Card(child: Column(children: const [
        ListTile(title: Text('Doğum günü'), trailing: Text('31 Ağustos 2024')),
        Divider(height: 1),
        ListTile(title: Text('Mikroçip'), trailing: Text('Eklenmedi')),
        Divider(height: 1),
        ListTile(title: Text('Veteriner'), trailing: Text('Eklenmedi')),
      ])),
      const SizedBox(height: 18),
      Text('Misket seninle 642 gündür ♥', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: PatiColors.sage)),
    ]),
  );
}

class _Fact extends StatelessWidget {
  const _Fact(this.value, this.label); final String value; final String label;
  @override Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8), child: Column(children: [Text(value, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(label, style: Theme.of(context).textTheme.bodySmall)])));
}
