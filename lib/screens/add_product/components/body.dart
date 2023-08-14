import 'package:Marketplace/components/default_button.dart';
import 'package:Marketplace/screens/add_product/components/product_form.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
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
            const SizedBox(height: 40),
            const FormAddProduct()
          ],
        ));
  }
}
