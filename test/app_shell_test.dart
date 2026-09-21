import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patilife/src/app.dart';
import 'package:patilife/src/design/pati_theme.dart';
import 'package:patilife/src/features/onboarding/onboarding_screen.dart';

void main() {
  testWidgets('core shell exposes four primary destinations', (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    expect(find.text('Bugün'), findsWidgets);
    expect(find.text('Sağlık'), findsOneWidget);
    expect(find.text('Günlük'), findsOneWidget);
    expect(find.text('Profil'), findsOneWidget);
    expect(find.text('Misket'), findsWidgets);
  });

  testWidgets('weight quick action opens a one-sheet logging flow',
      (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    await tester.tap(find.text('Kilo').first);
    await tester.pumpAndSettle();

    expect(find.text('Kilo kaydet'), findsOneWidget);
    expect(find.text('Bugün · Şimdi'), findsOneWidget);
    expect(find.text('Kaydet'), findsOneWidget);
  });

  testWidgets('health and profile retain premium shell content',
      (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    await tester.tap(find.text('Sağlık').last);
    await tester.pumpAndSettle();
    expect(find.text('Kilo eğilimi'), findsOneWidget);
    expect(find.text('Bakım planı'), findsOneWidget);

    await tester.tap(find.text('Profil').last);
    await tester.pumpAndSettle();
    expect(find.text('Hakkında'), findsOneWidget);
    expect(find.textContaining('642 gündür'), findsOneWidget);
  });

  testWidgets('onboarding uses species cards and gates continue',
      (tester) async {
    var finished = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: PatiTheme.light(),
        home: OnboardingScreen(
          onFinished: () => finished = true,
        ),
      ),
    );

    expect(find.text('Onlar da aile.'), findsOneWidget);
    final continueButton = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Devam et'),
    );
    expect(continueButton.onPressed, isNull);

    await tester.tap(find.text('Kedi'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Devam et'));
    expect(finished, isTrue);
  });
}
