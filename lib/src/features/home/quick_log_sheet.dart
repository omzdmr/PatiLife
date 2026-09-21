import 'package:flutter/material.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import '../../design/pati_theme.dart';

enum QuickLogType {
  weight(Icons.monitor_weight_outlined),
  food(Icons.restaurant_outlined),
  medication(Icons.medication_outlined),
  toilet(Icons.cleaning_services_outlined),
  note(Icons.edit_note_outlined),
  photo(Icons.photo_camera_outlined);

  const QuickLogType(this.icon);
  final IconData icon;

  String label(AppLocalizations l10n) => switch (this) {
        QuickLogType.weight => l10n.quickWeight,
        QuickLogType.food => l10n.quickFood,
        QuickLogType.medication => l10n.quickMedication,
        QuickLogType.toilet => l10n.quickToilet,
        QuickLogType.note => l10n.quickNote,
        QuickLogType.photo => l10n.quickPhoto,
      };

  String fieldLabel(AppLocalizations l10n) => switch (this) {
        QuickLogType.weight => l10n.fieldWeight,
        QuickLogType.food => l10n.fieldAmount,
        QuickLogType.medication => l10n.fieldMedicationSupplement,
        QuickLogType.toilet => l10n.fieldObservation,
        QuickLogType.note => l10n.fieldNote,
        QuickLogType.photo => l10n.fieldPhotoNote,
      };
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
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = widget.type.label(l10n);

    return Padding(
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
                child: Icon(widget.type.icon, color: PatiColors.sageDeep),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.saveQuickTitle(label),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l10n.nowForPet('Misket'),
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
              labelText: widget.type.fieldLabel(l10n),
              suffixText: suffix,
              hintText: numeric ? '0.0' : l10n.shortNoteHint,
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
                l10n.todayNow,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(l10n.change),
              ),
            ],
          ),
          const SizedBox(height: PatiSpace.md),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.savedMessage(label))),
              );
            },
            icon: const Icon(Icons.check_rounded),
            label: Text(l10n.save),
          ),
        ],
      ),
    );
  }
}
