import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patilife/src/app.dart';

void main() {
  testWidgets('core shell exposes four primary destinations', (tester) async {
    await tester.pumpWidget(const PatiLifeApp());
    expect(find.text('Bugün'), findsWidgets);
    expect(find.text('Sağlık'), findsOneWidget);
    expect(find.text('Günlük'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
  });

  testWidgets('weight quick action opens a short logging flow', (tester) async {
    await tester.pumpWidget(const PatiLifeApp());
    await tester.tap(find.widgetWithText(ActionChip, 'Kilo'));
    await tester.pumpAndSettle();
    expect(find.text('Kilo kaydet'), findsOneWidget);
    expect(find.text('Kaydet'), findsOneWidget);
  });
}
