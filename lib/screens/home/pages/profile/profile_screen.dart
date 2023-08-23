import 'package:Marketplace/screens/home/pages/no_sign_in/no_sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:Marketplace/screens/home/pages/profile/components/profiel_button.dart';
import 'package:Marketplace/screens/sign_in/sign_in_screen.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    final currentUser = GetStorage().read('CurrentUser') ?? false;
    return currentUser is String ? getInformationUser(context) : const NoSignInPage();
  }

  Widget getInformationUser(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    ProfileMenu(
                      text: "Name here",
                      icon: "assets/icons/User Icon.svg",
                    ),
                    ProfileMenu(
                      text: "Email here",
                      icon: "assets/icons/Mail.svg",
                    ),
                    ProfileMenu(
                      text: "Phone number here",
                      icon: "assets/icons/Phone-2.svg",
                    ),
                    ProfileMenu(
                      text: "Adress here",
                      icon: "assets/icons/Pin.svg",
                    ),
                  ],
                ),
                ProfileButton(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {
                    GetStorage().remove('CurrentUser');
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
