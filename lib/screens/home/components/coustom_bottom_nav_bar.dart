import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:Marketplace/constants.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<StatefulWidget> createState() {
    return _CustomBottonNavBar();
  }
}

class _CustomBottonNavBar extends State<CustomBottomNavBar>{
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: _currentPage == 0
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => setPage(page: 0),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: _currentPage == 1
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => setPage(page: 1),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/archive icon.svg",
                  color: _currentPage == 2
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => setPage(page: 2),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: _currentPage == 3
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => setPage(page: 3),
              ),
            ],
          )),
    );
  }

  void setPage({ required int page }){
    setState(() {
      _currentPage = page;
      widget.pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn
      );
    });
  }
}
