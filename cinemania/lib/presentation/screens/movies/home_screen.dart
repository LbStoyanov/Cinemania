import 'package:cinemania/presentation/views/home_views/favorites_view.dart';
import 'package:cinemania/presentation/views/movies/home_view.dart';
import 'package:cinemania/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.pageIndex});

  static const name = 'home-screen';
  final int pageIndex;

  final viewRouts = <Widget>[
    const HomeView(),
    const SizedBox(),
    const FavoritesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 205, 245),
      bottomNavigationBar:  CustomBottomNavigationBar(currentIndex: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: viewRouts,
      ),
    );
  }
}
