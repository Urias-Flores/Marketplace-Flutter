import 'package:Marketplace/screens/home/pages/my_products/my_products_page.dart';
import 'package:Marketplace/screens/home/pages/profile/profile_screen.dart';
import 'package:Marketplace/screens/home/pages/wish_list/wish_list_page.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/screens/home/components/coustom_bottom_nav_bar.dart';

import '../../size_config.dart';
import 'pages/main/main_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MainPage(),
          WishListPage(),
          MyProductsPage(),
          ProfilePage()
        ],
      )),
      bottomNavigationBar: CustomBottomNavBar(
        pageController: _pageController,
      ),
    );
  }
}
