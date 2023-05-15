import 'package:flutter/material.dart';
import 'package:travel/widgets/bottom_navigation.dart';

class MainGroup extends StatelessWidget {
  const MainGroup({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        const AppBottomBar(),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: child,
          ),
        ),
      ]),
    );
  }
}
