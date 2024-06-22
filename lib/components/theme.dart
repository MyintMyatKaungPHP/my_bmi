import 'package:flutter/material.dart';

class CustomTheme{
  ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'RobotoSlab',
    ),
  );

  ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: 'RobotoSlab',
    ),
  );
}