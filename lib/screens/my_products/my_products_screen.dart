import 'package:Marketplace/screens/add_product/add_product_screen.dart';
import 'package:Marketplace/screens/my_products/components/body.dart';
import 'package:flutter/material.dart';

class MyProductsScreen extends StatelessWidget{
  const MyProductsScreen({super.key});
  static String routeName = '/my_products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My products',
          style: TextStyle( color: Colors.black ),
        ),
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFECDF),
        onPressed: () { Navigator.pushNamed(context, AddProductScreen.routeName ); },
        child: const Icon(Icons.add, color: Color(0xFFff7643)),
      ),
    );
  }
}