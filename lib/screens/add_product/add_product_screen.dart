import 'package:Marketplace/screens/add_product/components/body.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget{
  const AddProductScreen({super.key});
  static String routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Body(),
    );
  }
}