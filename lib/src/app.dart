import 'package:flutter/material.dart';
import 'design/pati_theme.dart';
import 'features/shell/pati_shell.dart';
import '../l10n/generated/app_localizations.dart';

class PatiLifeApp extends StatelessWidget {
  const PatiLifeApp({super.key});

  Locale _resolveLocale(Locale? locale) {
    if (locale == null) return const Locale('en');

    return switch (locale.languageCode) {
      'tr' => const Locale('tr'),
      'es' => const Locale('es', '419'),
      'pt' => const Locale('pt', 'BR'),
      'zh' => const Locale('zh', 'CN'),
      'hi' => const Locale('hi'),
      'id' => const Locale('id'),
      'ja' => const Locale('ja'),
      'de' => const Locale('de'),
      'fr' => const Locale('fr'),
      _ => const Locale('en'),
    };
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        theme: PatiTheme.light(),
        darkTheme: PatiTheme.dark(),
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) =>
            _resolveLocale(locale),
        home: const PatiShell(),
      );
}
