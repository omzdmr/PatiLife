import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patilife/l10n/generated/app_localizations.dart';
import 'package:patilife/src/design/pati_theme.dart';
import 'package:patilife/src/features/shell/pati_shell.dart';

void main() {
  Widget shell({
    required Locale locale,
    required ThemeMode themeMode,
    double textScale = 1,
    bool disableAnimations = false,
  }) {
    return MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: PatiTheme.light(),
      darkTheme: PatiTheme.dark(),
      themeMode: themeMode,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(textScale),
          disableAnimations: disableAnimations,
        ),
        child: child!,
      ),
      home: const PatiShell(),
    );
  }

  testWidgets('four-tab shell survives German 200% text in dark mode',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      shell(
        locale: const Locale('de'),
        themeMode: ThemeMode.dark,
        textScale: 2,
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    for (final label in <String>['Gesundheit', 'Tagebuch', 'Profil']) {
      final destination = find.text(label).last;
      expect(destination, findsOneWidget);
      await tester.tap(destination);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('non-Latin shell remains usable with reduced motion',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      shell(
        locale: const Locale('hi'),
        themeMode: ThemeMode.light,
        textScale: 1.6,
        disableAnimations: true,
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);

    final l10n = await AppLocalizations.delegate.load(const Locale('hi'));
    for (final label in <String>[
      l10n.navHealth,
      l10n.navDiary,
      l10n.navProfile,
      l10n.navToday,
    ]) {
      final destination = find.text(label).last;
      expect(destination, findsOneWidget);
      await tester.tap(destination);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('navigation exposes exactly the approved four destinations',
      (tester) async {
    await tester.pumpWidget(
      shell(locale: const Locale('en'), themeMode: ThemeMode.light),
    );

    expect(find.byType(NavigationDestination), findsNWidgets(4));
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    expect(find.byIcon(Icons.auto_stories_outlined), findsOneWidget);
    expect(find.byIcon(Icons.pets_outlined), findsOneWidget);
  });
}
