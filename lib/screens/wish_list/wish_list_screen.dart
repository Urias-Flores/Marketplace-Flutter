import 'package:Marketplace/components/coustom_bottom_nav_bar.dart';
import 'package:Marketplace/enums.dart';
import 'package:Marketplace/screens/wish_list/components/body.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget{
  static String routeName = '/wish_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Wish List',
          style: TextStyle(
              color: Colors.black
          ),
        ),
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}