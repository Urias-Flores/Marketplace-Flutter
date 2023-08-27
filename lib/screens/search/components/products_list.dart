import 'package:Marketplace/Services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/components/product_card.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/size_config.dart';

class ProductList extends StatelessWidget{
  const ProductList({super.key, required this.searchWord});
  final String? searchWord;

  @override
  Widget build(BuildContext context) {
    ProductService productService = ProductService();
    return Expanded(
        child: FutureBuilder(
          future: productService.getProductsByName(searchWord ?? ''),
          builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text('No hay conexion'),
              );
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return searchResultWidget( snapshot.data ?? [] );
          },
        )
    );
  }

  searchResultWidget(List<Product> products){
    if(products.isNotEmpty){
      return Container(
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
              ...listProductForRow(products),
            ],
          ),
        ),
      );
    } else {
      return const Center(
        child: Text('No se encontraron coincidencias'),
      );
    }
  }

  List listProductForRow(List<Product> products) {
    List productsLis = [];
    int factor = products.length == 1 ? -1 : 1;
    for (int index = 0; index <= (products.length / 2).round() + factor; index += 2) {
      productsLis.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: index == (products.length / 2).round() + factor
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.spaceAround,
              children: products.length%2 != 0 && index == (products.length / 2).round() + factor
                  ? [ SizedBox(width: getProportionateScreenWidth(18)), ProductCard(product: products[index]) ]
                  : [ ProductCard(product: products[index]), ProductCard(product: products[index + 1]) ],
            ),
            SizedBox(height: getProportionateScreenHeight(20))
      ]));
    }
    return productsLis;
  }
}