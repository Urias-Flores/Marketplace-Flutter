import 'package:Marketplace/components/search_field.dart';
import 'package:Marketplace/size_config.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget{
  const SearchHeader({super.key, required this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(5),
          left: getProportionateScreenWidth(5),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () { Navigator.pop(context); },
              icon: const Icon(Icons.arrow_back, color: Colors.black,)
          ),
          SearchField( value: value, width: SizeConfig.screenWidth * 0.8, )
        ],
      ),
    );
  }

}