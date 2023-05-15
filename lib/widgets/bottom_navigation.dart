import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  final List<String> destinations = ['/', '/explore', '/saved', '/profile'];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (value) {
        context.push(destinations[value]);
        setState(() {
          activeIndex = value;
        });
      },
      selectedIndex: activeIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.travel_explore_outlined),
          selectedIcon: Icon(Icons.travel_explore_rounded),
          label: 'Explore',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_outline_outlined),
          selectedIcon: Icon(Icons.bookmark_rounded),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
