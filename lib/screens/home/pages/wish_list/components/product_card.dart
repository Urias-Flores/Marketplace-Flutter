import 'package:Marketplace/models/Product.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../size_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  late final title = product.name;
  late final titleLength = product.name.length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(product.image[0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${title.substring(0, titleLength > 22 ? 22 : titleLength).trim()}${titleLength > 25 ? '...' : ''}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${1}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
