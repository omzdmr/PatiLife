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

Future<void> showQuickLogSheet(BuildContext context, QuickLogType type) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _QuickLogSheet(type: type),
    );

class _QuickLogSheet extends StatefulWidget {
  const _QuickLogSheet({required this.type});
  final QuickLogType type;

  @override
  State<_QuickLogSheet> createState() => _QuickLogSheetState();
}

class _QuickLogSheetState extends State<_QuickLogSheet> {
  final controller = TextEditingController();

  bool get numeric =>
      widget.type == QuickLogType.weight || widget.type == QuickLogType.food;

  String get fieldLabel => switch (widget.type) {
        QuickLogType.weight => 'Kilo',
        QuickLogType.food => 'Miktar',
        QuickLogType.medication => 'İlaç veya takviye',
        QuickLogType.toilet => 'Gözlem',
        QuickLogType.note => 'Not',
        QuickLogType.photo => 'Fotoğraf notu',
      };

  String? get suffix => switch (widget.type) {
        QuickLogType.weight => 'kg',
        QuickLogType.food => 'g',
        _ => null,
      };

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(
          PatiSpace.lg,
          PatiSpace.xs,
          PatiSpace.lg,
          MediaQuery.viewInsetsOf(context).bottom + PatiSpace.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: PatiColors.sage.withValues(alpha: .13),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    widget.type.icon,
                    color: PatiColors.sageDeep,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.type.label} kaydet',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Misket · şimdi',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: PatiSpace.lg),
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: numeric
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: fieldLabel,
                suffixText: suffix,
                hintText: numeric ? '0.0' : 'Kısa bir not ekle',
              ),
            ),
            const SizedBox(height: PatiSpace.sm),
            Row(
              children: [
                Icon(
                  Icons.schedule_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Text(
                  'Bugün · Şimdi',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('Değiştir'),
                ),
              ],
            ),
            const SizedBox(height: PatiSpace.md),
            FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.type.label} kaydedildi'),
                  ),
                );
              },
              icon: const Icon(Icons.check_rounded),
              label: const Text('Kaydet'),
            ),
          ],
        ),
      );
}
