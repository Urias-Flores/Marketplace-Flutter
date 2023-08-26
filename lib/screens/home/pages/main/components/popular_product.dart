import 'package:Marketplace/controllers/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/components/product_card.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:get/get.dart';
import '../../../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final mainPageController =
        Get.put<MainPageController>(MainPageController());
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Productos populares", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Obx(() {
              if (mainPageController.isProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (mainPageController.existErrorProducts.isNotEmpty) {
                return Center(
                    child: Text(mainPageController.existErrorProducts));
              } else {
                return Obx(() => getProductsList(mainPageController.products));
              }
            }))
      ],
    );
  }

  Widget getProductsList(List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          // halve the list's lenght to add product in multiples of two
          products.length ~/ 2 + (products.length % 2 == 0 ? 0 : 1),
          (index) {
            var result = Row(
              children: (index * 2 + 2 <= products.length
                  ? [
                      SizedBox(width: getProportionateScreenWidth(20)),
                      ProductCard(product: products[index * 2]),
                      SizedBox(width: getProportionateScreenWidth(40)),
                      ProductCard(product: products[index * 2 + 1]),
                    ]
                  : [
                      SizedBox(width: getProportionateScreenWidth(30)),
                      ProductCard(product: products[index * 2]),
                    ]),
            );
            return result;
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20))
      ],
    );
  }
}
