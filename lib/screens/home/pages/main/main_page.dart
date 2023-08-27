import 'package:Marketplace/components/search_field.dart';
import 'package:Marketplace/screens/home/pages/main/components/home_header.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeHeader(),
          const DiscountBanner(),
          // const Categories(),
          const SpecialOffers(),
          SizedBox(height: getProportionateScreenWidth(30)),
          const PopularProducts(),
          SizedBox(height: getProportionateScreenWidth(30)),
        ],
      ),
    );
  }
}
