import 'package:Marketplace/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Name here",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Email here",
            icon: "assets/icons/Mail.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Phone number here",
            icon: "assets/icons/Phone-2.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Adress here",
            icon: "assets/icons/Pin.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () { Navigator.pushNamed(context, SignInScreen.routeName); },
          ),
        ],
      ),
    );
  }
}
