import 'package:Marketplace/screens/home/pages/my_products/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/screens/add_product/add_product_screen.dart';

import '../../../../size_config.dart';

class MyProductsPage extends StatelessWidget{
  const MyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 20),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int item) => const ProductCard(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFECDF),
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        child: const Icon(Icons.add, color: Color(0xFFff7643)),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int numItems) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              const Text(
                "Your products",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "$numItems items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        )
    );
  }
}