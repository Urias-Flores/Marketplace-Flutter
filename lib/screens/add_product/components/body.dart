import 'package:Marketplace/components/default_button.dart';
import 'package:Marketplace/screens/add_product/components/product_form.dart';
import 'package:flutter/material.dart';

import '../../../components/top_rounded_container.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  const FormAddProduct()
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
              press: () {},
            ),
          ),
        )
      ],
    );
  }
}
