import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.teal,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 223, 255, 247),
    elevation: 0,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color.fromARGB(255, 223, 255, 247),
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  ),
);

SystemUiOverlayStyle overlayStyle = const SystemUiOverlayStyle(
  statusBarColor: Color.fromARGB(255, 223, 255, 247),
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Color.fromARGB(255, 223, 255, 247),
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
);
