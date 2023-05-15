import 'package:flutter/cupertino.dart';
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
    return NavigationRail(
      onDestinationSelected: (value) {
        context.push(destinations[value]);
        setState(() {
          activeIndex = value;
        });
      },
      labelType: NavigationRailLabelType.all,
      selectedIndex: activeIndex,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(CupertinoIcons.add_circled),
          selectedIcon: Icon(CupertinoIcons.add_circled_solid),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(CupertinoIcons.search_circle),
          selectedIcon: Icon(CupertinoIcons.search_circle_fill),
          label: Text('Explore'),
        ),
        NavigationRailDestination(
          icon: Icon(CupertinoIcons.book_circle),
          selectedIcon: Icon(CupertinoIcons.book_circle_fill),
          label: Text('Saved'),
        ),
        NavigationRailDestination(
          icon: Icon(CupertinoIcons.person_circle),
          selectedIcon: Icon(CupertinoIcons.person_circle_fill),
          label: Text('Profile'),
        ),
      ],
    );
  }
}
