import 'package:Marketplace/constants.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
                  child: const Image(
                    image: AssetImage('assets/images/ps4_console_blue_1.png'),
                  ),
                )),
            SizedBox(width: getProportionateScreenWidth(15)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name here.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Product description will go here.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        priceText(text: '\$89.99'),
                        statusText(text: 'Disponible'),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getButton(text: 'Editar', onPressed: () {}),
                          getButton(text: 'Eliminar', onPressed: () {})
                        ],
                      ),
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

  Text priceText({required String text}) {
    return Text(
      text,
      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
    );
  }

  Text statusText({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    );
  }
}
