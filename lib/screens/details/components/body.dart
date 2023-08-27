import 'package:Marketplace/models/Contact.dart';
import 'package:Marketplace/models/User.dart';
import 'package:Marketplace/screens/details/components/user_details.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/models/Product.dart';
import 'product_description.dart';
import '../../../components/top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact contact = Contact(phone: '98726152', firstName: 'some', lastName: 'person', address: 'SPS');
    User defaultUser = User('hdeowhfohdwi', email: 'someemail@gmail.com', password: 'Some password', contact: contact);
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    UserDetails(user: product.user),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
