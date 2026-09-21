import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import 'package:patilife/src/design/pati_theme.dart';
import 'package:patilife/src/features/onboarding/onboarding_screen.dart';

void main() {
  Widget app({required Locale locale, required double textScale}) => MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: PatiTheme.light(),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(textScale),
            disableAnimations: true,
          ),
          child: child!,
        ),
        home: OnboardingScreen(onFinished: () {}),
      );

  testWidgets('onboarding survives 200 percent German text without overflow',
      (tester) async {
    tester.view.physicalSize = const Size(430, 932);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(app(locale: const Locale('de'), textScale: 2));
    await tester.pump();

    expect(find.text('Sie gehören zur Familie.'), findsOneWidget);
    expect(tester.takeException(), isNull);

    final dog = find.text('Hund');
    await tester.ensureVisible(dog);
    await tester.tap(dog);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets('non-Latin onboarding remains usable at large text',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(app(locale: const Locale('hi'), textScale: 2));
    await tester.pump();

    expect(find.text('वे भी परिवार हैं।'), findsOneWidget);
    final cat = find.text('बिल्ली');
    await tester.ensureVisible(cat);
    await tester.tap(cat);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
