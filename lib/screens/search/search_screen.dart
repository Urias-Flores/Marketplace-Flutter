import 'package:Marketplace/screens/search/components/products_list.dart';
import 'package:Marketplace/screens/search/components/search_header.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = '/search_product';

  @override
  Scaffold build(BuildContext context) {
    final String setString =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchHeader(value: setString),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text(
              'Resultado de busqueda',
              style: TextStyle(color: Colors.black),
            ),
            ProductList(searchWord: setString),
          ],
        ),
      ),
    );
  }
}
