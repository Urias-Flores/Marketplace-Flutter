import 'package:Marketplace/Services/product_services.dart';
import 'package:Marketplace/components/default_button.dart';
import 'package:Marketplace/controllers/add_product_controller.dart';
import 'package:Marketplace/controllers/main_page_controller.dart';
import 'package:Marketplace/controllers/my_products_page_controller.dart';
import 'package:Marketplace/models/Category.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/models/User.dart';
import 'package:Marketplace/screens/add_product/components/product_form.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../components/top_rounded_container.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  Body({super.key});
  AddProductController addProductController = Get.put<AddProductController>(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Agregar producto',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "LLena todos los campos para agregar el producto",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  FormAddProduct()
                ],
              ),
            )
        )
        ),
        TopRoundedContainer(
          color: const Color(0xFFF6F7F9),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: DefaultButton(
              text: 'Agregar',
              press: () { saveProduct(context); },
            ),
          ),
        )
      ],
    );
  }

  saveProduct(BuildContext context) async {
    final user = await GetStorage().read('CurrentUser') as Map<String, dynamic>;
    User userInstance = User.fromJSON(user);
    Product product = Product(
        '',
        name: addProductController.name,
        description: addProductController.description,
        price: double.parse(addProductController.price),
        discount: double.parse(addProductController.discount),
        state: ProductState.available,
        image: addProductController.selectedImages,
        category: Category(
          addProductController.category,
          name: '',
          image: ''
        ),
        user: userInstance
    );

    ProductService().createProduct(product).then((value) {
      if(value.id.isNotEmpty){
        Get.put<MyProductsPageController>(MyProductsPageController()).loadProductsList();
        Get.put<MainPageController>(MainPageController()).onInit();
        Navigator.pop(context);
      }
    });
  }
}
