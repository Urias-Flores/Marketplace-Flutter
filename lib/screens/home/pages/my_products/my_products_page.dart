import 'package:Marketplace/controllers/my_products_page_controller.dart';
import 'package:Marketplace/screens/home/pages/my_products/components/product_card.dart';
import 'package:Marketplace/screens/home/pages/no_sign_in/no_sign_in_page.dart';
import 'package:Marketplace/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/screens/add_product/add_product_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Marketplace/size_config.dart';

class MyProductsPage extends StatelessWidget{
  const MyProductsPage({super.key});


  @override
  Widget build(BuildContext context) {
    final user = GetStorage().read('CurrentUser') ?? false;
    return user is Map ? getProductList(context) : const NoSignInPage();
  }

  Scaffold getProductList(BuildContext context){
    MyProductsPageController myProductsPageController =
      Get.put<MyProductsPageController>(MyProductsPageController());
    return Scaffold(
      appBar: buildAppBar(context),
      body: Obx(() {
        if(myProductsPageController.isLoading){
          return const Center( child: CircularProgressIndicator() );
        } else if(myProductsPageController.existError.isNotEmpty){
          return Center( child: Text(myProductsPageController.existError) );
        } else {
          return RefreshIndicator(
              onRefresh: () async { myProductsPageController.reloadProducts(); },
              child: ListView.builder(
                  itemCount: myProductsPageController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(product: myProductsPageController.products[index]));
                      },
                      child: ProductCard(product: myProductsPageController.products[index]),
                    );
                  }
              )
          );
        }
      }

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFECDF),
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        child: const Icon(Icons.add, color: Color(0xFFff7643)),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    MyProductsPageController myProductsPageController =
      Get.put<MyProductsPageController>(MyProductsPageController());
    return AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              const Text(
                "Your products",
                style: TextStyle(color: Colors.black),
              ),
              Obx(() => Text(
                "${myProductsPageController.products.length} items",
                style: Theme.of(context).textTheme.caption,
              ),)
            ],
          ),
        )
    );
  }
}