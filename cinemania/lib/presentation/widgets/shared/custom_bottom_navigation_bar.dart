import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  int getCurrentIntex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    if (location == '/') {
      return 0;
    } else if (location == '/categories') {
      return 1;
    } else if (location == '/favorites') {
      return 2;
    } else {
      return 0;
    }
  }

  void onItemTap(BuildContext context, int index) {
    if (index == 0) {
      context.go('/');
      return;
    } else if (index == 1) {
      context.go('/');
      return;
    } else {
      context.go('/favorites');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: getCurrentIntex(context),
      elevation: 0,
      onTap: (index) => onItemTap(context, index),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_rounded), label: 'Movies'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded), label: 'Favorites'),
      ],
    );
  }
}
