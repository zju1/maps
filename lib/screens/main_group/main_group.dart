import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';

class MainGroup extends StatelessWidget {
  const MainGroup({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
