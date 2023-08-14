import 'package:flutter/material.dart';
import 'package:Marketplace/components/coustom_bottom_nav_bar.dart';
import 'package:Marketplace/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
