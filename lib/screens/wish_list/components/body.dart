import 'package:Marketplace/screens/details/details_screen.dart';
import 'package:Marketplace/screens/wish_list/components/product_card.dart';
import 'package:Marketplace/models/Cart.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> products = demoProducts;
    Iterable<Cart> carts = products.map((e) => Cart(product: e, numOfItem: 1));

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: ProductDetailsArguments(product: products[index])
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ProductCard(cart: carts.elementAt(index)),
          ),
        ),
      ),
    );
  }
}
