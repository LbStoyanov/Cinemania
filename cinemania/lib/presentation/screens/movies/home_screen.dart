import 'package:cinemania/presentation/widgets/shared/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.childView});

  static const name = 'home-screen';

  final Widget childView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 205, 245),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: childView,
    );
  }
}
