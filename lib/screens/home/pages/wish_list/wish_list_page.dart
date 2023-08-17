import 'package:flutter/material.dart';
import 'package:Marketplace/screens/home/pages/wish_list/components/product_card.dart';
import 'package:Marketplace/screens/details/details_screen.dart';

import 'package:Marketplace/models/Cart.dart';
import 'package:Marketplace/models/Product.dart';

import 'package:Marketplace/size_config.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = demoProducts;
    Iterable<Cart> carts = products.map((e) => Cart(product: e, numOfItem: 1));
    return Scaffold(
      appBar: buildAppBar(context, carts.length),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(product: products[index]));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ProductCard(cart: carts.elementAt(index)),
            ),
          ),
        ),
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
              "Your wish list",
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
