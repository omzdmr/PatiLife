import 'package:flutter/material.dart';
import 'design/pati_theme.dart';
import 'features/shell/pati_shell.dart';

class PatiLifeApp extends StatelessWidget {
  const PatiLifeApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'PatiLife',
        debugShowCheckedModeBanner: false,
        theme: PatiTheme.light(),
        darkTheme: PatiTheme.dark(),
        themeMode: ThemeMode.system,
        home: const PatiShell(),
      );
}
