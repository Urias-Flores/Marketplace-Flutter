import 'package:Marketplace/components/search_field.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget{
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenWidth(20),
        right: getProportionateScreenWidth(20),
        left: getProportionateScreenWidth(20),
      ),
      child: SearchField(),
    );
  }
}