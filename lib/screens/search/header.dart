import 'package:Marketplace/components/search_field.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget{
  const Header({super.key, required this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Row(
        children: [
          IconButton(
              onPressed: () { Navigator.pop(context); },
              icon: const Icon(Icons.arrow_back)
          ),
          SearchField(value: value,)
        ],
      ),
    );
  }

}