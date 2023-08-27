import 'package:Marketplace/constants.dart';
import 'package:Marketplace/models/Product.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  final Product product;

  Map<ProductState, String> stateToString = {
    ProductState.noData: 'No Data',
    ProductState.available: 'Disponible',
    ProductState.spent: 'Agotado',
    ProductState.notAvailable: 'No disponible'
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
                width: 98,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(product.image[0].toString()),
                )),
            SizedBox(width: getProportionateScreenWidth(15)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    nameText(text: product.name),
                    descriptionText(text: product.description),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        priceText(text: '\$${product.price}'),
                        statusText(text: '${stateToString[product!.state]}'),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getButton(text: 'Editar', onPressed: () {}),
                        getButton(text: 'Eliminar', onPressed: () {})
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton getButton(
      {required String text, required VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFECDF),
        foregroundColor: const Color(0xFFFF7643),
      ),
      child: Row(
        children: [Text(text)],
      ),
    );
  }

  Text nameText({required String text}){
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }
  
  Text descriptionText({required String text}){
    return Text(
      text,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  Text priceText({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
    );
  }

  Text statusText({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
