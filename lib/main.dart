import 'package:flutter/material.dart';
import 'package:pokememory/pages/poke_list.page.dart' show PokeList;
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
        colorScheme: ColorScheme.fromSeed(seedColor: $primary),
        appBarTheme: AppBarTheme(backgroundColor: $primary),
        fontFamily: $fontRoboto,
      ),
      home: PokeList(),
    );
  }
}
