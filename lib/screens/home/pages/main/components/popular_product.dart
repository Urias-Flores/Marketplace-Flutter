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
    final mainPageController = Get.put<MainPageController>(MainPageController());
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Productos populares", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx( () {
                if(mainPageController.isProductsLoading){
                  return const Center(child: CircularProgressIndicator());
                } else if(mainPageController.existErrorProducts.isNotEmpty){
                  return Center(child: Text(mainPageController.existErrorProducts));
                } else {
                  return Obx(() => getProductsList(mainPageController.products));
                }
              }
            )
        )
      ],
    );
  }

  Widget getProductsList(List<Product> products){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
            products.length,
            (index) => Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(20)),
                ProductCard(product: products[index])
              ],
            )
        ),
        SizedBox(width: getProportionateScreenWidth(20))
      ],
    );
  }
}
