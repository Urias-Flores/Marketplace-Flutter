import 'package:flutter/material.dart';
import 'package:Marketplace/components/product_card.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/size_config.dart';

class ProductList extends StatelessWidget{
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(
            top: getProportionateScreenHeight(20),
            right: getProportionateScreenWidth(20),
            left: getProportionateScreenWidth(20)
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...getListProduct(demoProducts),
                ...getListProduct(demoProducts)
              ],
            ),
          ),
        )
    );
  }

  List getListProduct(List<Product> products) {
    List productsLis = [];
    for (int index = 0; index <= (products.length / 2).round(); index += 2) {
      productsLis.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProductCard(product: products[index]),
                ProductCard(product: products[index + 1])
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20))
      ]));
    }
    return productsLis;
  }
}