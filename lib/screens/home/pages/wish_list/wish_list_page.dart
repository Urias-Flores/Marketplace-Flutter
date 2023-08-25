import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Marketplace/screens/home/pages/wish_list/components/product_card.dart';
import 'package:Marketplace/screens/details/details_screen.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/size_config.dart';
import 'package:Marketplace/screens/home/pages/no_sign_in/no_sign_in_page.dart';
import 'package:Marketplace/controllers/wish_list_page_controller.dart';
import 'package:get/get.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = GetStorage().read('CurrentUser') ?? false;
    return currentUser is Map<String, dynamic> ? getWishList(context, currentUser) : const NoSignInPage();
  }

  Widget getWishList(BuildContext context, Map<String, dynamic> currentUserMap){
    final wishListPageController = Get.put<WishListPageController>(WishListPageController());
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Obx( () {
          if(wishListPageController.isLoading){
            return const Center( child: CircularProgressIndicator() );
          } else if(wishListPageController.existError.isNotEmpty){
            return Center( child: Text(wishListPageController.existError) );
          } else {
            return wishList(wishListPageController.products);
          }
        })
      ),
    );
  }

  wishList(List<Product> products){
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailsScreen.routeName,
              arguments: ProductDetailsArguments(product: products[index]));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ProductCard(product: products[index]),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final wishListPageController = Get.put<WishListPageController>(WishListPageController());
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            const Text(
              "Lista de deseos",
              style: TextStyle(color: Colors.black),
            ),
            Obx(() =>
              Text(
                "${wishListPageController.products.length} items",
                style: Theme.of(context).textTheme.caption,
              )
            )
          ],
        ),
      )
    );
  }
}
