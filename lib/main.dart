import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokememory/utils/const_desing.dart';
import 'l10n/app_localizations.dart';

import 'pages/router/router.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: $colorPrimary),
        appBarTheme: AppBarTheme(backgroundColor: $colorPrimary),
        fontFamily: $fontRoboto,
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: $white),
          displayMedium: TextStyle(color: $white),
          displaySmall: TextStyle(color: $white),
          headlineLarge: TextStyle(color: $white),
          headlineMedium: TextStyle(color: $white),
          headlineSmall: TextStyle(color: $white),
          titleLarge: TextStyle(color: $white),
          titleMedium: TextStyle(color: $white),
          titleSmall: TextStyle(color: $white),
          bodyLarge: TextStyle(color: $white),
          bodyMedium: TextStyle(color: $white),
          bodySmall: TextStyle(color: $white),
          labelLarge: TextStyle(color: $white),
          labelMedium: TextStyle(color: $white),
          labelSmall: TextStyle(color: $white),
        ),
      ),
    );
  }
}
