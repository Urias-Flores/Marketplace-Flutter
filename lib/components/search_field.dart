import 'package:Marketplace/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/constants.dart';
import 'package:Marketplace/size_config.dart';

class SearchField extends StatelessWidget {


  SearchField({
    Key? key,
    this.value = '',
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: value ?? '');
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: textController,
        onSubmitted: (value) {
          Navigator.pushNamed(
              context,
              SearchScreen.routeName,
              arguments: value
          );
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: const Icon(Icons.search)),
      ),
    );
  }
}
