import 'package:flutter/material.dart';
import 'package:travel/routes/routes.dart';
import 'package:travel/theme/theme_data.dart';

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}
