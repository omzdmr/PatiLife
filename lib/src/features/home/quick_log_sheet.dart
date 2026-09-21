import 'package:flutter/material.dart';
import '../../design/pati_theme.dart';

enum QuickLogType {
  weight('Kilo', Icons.monitor_weight_outlined),
  food('Mama', Icons.restaurant_outlined),
  medication('İlaç', Icons.medication_outlined),
  toilet('Tuvalet', Icons.cleaning_services_outlined),
  note('Not', Icons.edit_note_outlined),
  photo('Fotoğraf', Icons.photo_camera_outlined);

  const QuickLogType(this.label, this.icon);
  final String label;
  final IconData icon;
}

Future<void> showQuickLogSheet(BuildContext context, QuickLogType type) => showModalBottomSheet<void>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (context) => _QuickLogSheet(type: type),
);

class _QuickLogSheet extends StatefulWidget {
  const _QuickLogSheet({required this.type});
  final QuickLogType type;
  @override State<_QuickLogSheet> createState() => _QuickLogSheetState();
}

class _QuickLogSheetState extends State<_QuickLogSheet> {
  final controller = TextEditingController();
  @override void dispose() { controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(PatiSpace.lg, PatiSpace.sm, PatiSpace.lg, MediaQuery.viewInsetsOf(context).bottom + PatiSpace.lg),
    child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text('${widget.type.label} kaydet', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      Text('Misket için hızlı kayıt', style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 20),
      TextField(
        controller: controller,
        autofocus: true,
        keyboardType: widget.type == QuickLogType.weight || widget.type == QuickLogType.food ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        decoration: InputDecoration(
          labelText: widget.type == QuickLogType.weight ? 'Kilo (kg)' : widget.type == QuickLogType.food ? 'Miktar (g)' : 'Not',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(PatiRadius.medium)),
        ),
      ),
      const SizedBox(height: 16),
      FilledButton(
        onPressed: () => Navigator.pop(context),
        style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PatiRadius.medium))),
        child: const Text('Kaydet'),
      ),
    ]),
  );
}
