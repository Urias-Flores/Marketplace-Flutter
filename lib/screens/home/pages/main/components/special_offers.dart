import 'package:Marketplace/controllers/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:Marketplace/size_config.dart';
import 'package:get/get.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainPageController =
        Get.put<MainPageController>(MainPageController());
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categorías",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (mainPageController.isProductsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (mainPageController.existErrorCategories.isNotEmpty) {
                return Center(
                    child: Text(mainPageController.existErrorCategories));
              } else {
                return Obx(() => getCategories(mainPageController.categories));
              }
            })),
      ],
    );
  }

  Widget getCategories(List<Category> categories) {
    return Row(
      children: [
        ...getListCategories(categories),
        SizedBox(width: getProportionateScreenWidth(20)),
      ],
    );
  }

  List<SpecialOfferCard> getListCategories(List<Category> categories) {
    List<SpecialOfferCard> categoriesWidget = [];
    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];
      final specialOfferCard = SpecialOfferCard(
          category: category.name,
          image: category.image,
          numOfProducts: 20,
          press: () {});
      categoriesWidget.add(specialOfferCard);
    }
    return categoriesWidget;
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfProducts,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfProducts;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.4),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfProducts products")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
