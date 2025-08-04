import 'package:flutter/material.dart';
import 'package:pokememory/pages/poke_list.page.dart' show PokeListPage;
import 'package:pokememory/utils/const_desing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: PokeListPage(),
    );
  }
}
