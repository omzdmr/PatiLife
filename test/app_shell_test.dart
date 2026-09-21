import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import 'package:patilife/src/app.dart';
import 'package:patilife/src/design/pati_theme.dart';
import 'package:patilife/src/features/onboarding/onboarding_screen.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized()
        .platformDispatcher
        .localeTestValue = const Locale('en');
  });

  tearDown(() {
    TestWidgetsFlutterBinding.ensureInitialized()
        .platformDispatcher
        .clearLocaleTestValue();
  });

  test('generated localizations contain ten launch locales and required fallbacks', () {
    final tags = AppLocalizations.supportedLocales
        .map((locale) => locale.toLanguageTag())
        .toSet();

    expect(
      tags,
      containsAll(<String>{
        'en',
        'tr',
        'es-419',
        'pt-BR',
        'zh-CN',
        'hi',
        'id',
        'ja',
        'de',
        'fr',
      }),
    );
    expect(tags, containsAll(<String>{'es', 'pt', 'zh'}));
  });

  testWidgets('core shell localizes primary destinations', (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    expect(find.text('Today'), findsWidgets);
    expect(find.text('Health'), findsOneWidget);
    expect(find.text('Diary'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Misket'), findsWidgets);
  });

  testWidgets('weight quick action opens localized one-sheet flow',
      (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    final weightAction = find.text('Weight').first;
    await tester.ensureVisible(weightAction);
    await tester.tap(weightAction);
    await tester.pumpAndSettle();

    expect(find.text('Log Weight'), findsOneWidget);
    expect(find.text('Today · Now'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
  });

  testWidgets('health and profile localize visible shell content',
      (tester) async {
    await tester.pumpWidget(const PatiLifeApp());

    await tester.tap(find.text('Health').last);
    await tester.pumpAndSettle();
    expect(find.text('Weight trend'), findsOneWidget);
    expect(find.text('Care plan'), findsOneWidget);

    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();
    expect(find.text('About'), findsOneWidget);
    expect(find.textContaining('642 days'), findsOneWidget);
  });

  testWidgets('Japanese onboarding is responsive and rendered from ARB resources',
      (tester) async {
    var finished = false;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ja'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: PatiTheme.light(),
        home: OnboardingScreen(
          onFinished: () => finished = true,
        ),
      ),
    );

    expect(find.text('この子たちも家族です。'), findsOneWidget);
    final continueFinder = find.widgetWithText(FilledButton, '続ける');
    final continueButton = tester.widget<FilledButton>(continueFinder);
    expect(continueButton.onPressed, isNull);

    final cat = find.text('猫');
    await tester.ensureVisible(cat);
    await tester.tap(cat);
    await tester.pumpAndSettle();

    await tester.ensureVisible(continueFinder);
    await tester.tap(continueFinder);
    expect(finished, isTrue);
  });
}
