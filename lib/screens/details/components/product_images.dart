import 'package:Marketplace/controllers/product_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/constants.dart';
import 'package:Marketplace/size_config.dart';
import 'package:get/get.dart';

class ProductImages extends StatelessWidget {
  ProductImages({super.key, required this.product });
  final Product product;
  final ProductCardController productCardController = Get.put<ProductCardController>(ProductCardController());

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Obx(() => Hero(
                tag: product.id.toString(),
                child: Image.network(product.image[productCardController.selectedImage]),
              )
            )
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(product.image.length,
                    (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        productCardController.selectedImage = index;
      },
      child: Obx(() => AnimatedContainer(
          duration: defaultDuration,
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.all(8),
          height: getProportionateScreenWidth(48),
          width: getProportionateScreenWidth(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: kPrimaryColor.withOpacity(productCardController.selectedImage == index ? 1 : 0)),
          ),
          child: Image.network(product.image[index]),
        )
      )
    );
  }
}
