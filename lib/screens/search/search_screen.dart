import 'package:Marketplace/screens/search/components/header.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/components/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = '/search_product';

  @override
  Scaffold build(BuildContext context) {
    final String setString = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Header( value: setString ),
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                child: const Column(
                children: [
                  Text('The products going here.')
                ],
              ),
            )
      ])),
    );
  }
}
