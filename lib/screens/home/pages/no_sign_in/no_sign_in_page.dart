import 'package:flutter/material.dart';
import 'package:Marketplace/size_config.dart';
import 'package:Marketplace/screens/sign_in/sign_in_screen.dart';
import 'package:Marketplace/screens/home/pages/profile/components/profiel_button.dart';

class NoSignInPage extends StatelessWidget{
  const NoSignInPage({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Al parecer aún no inicias sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Inicia sesion para continuar utilizando la app",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ProfileButton(
          text: "Sing up",
          icon: "assets/icons/Log out.svg",
          press: () { Navigator.pushNamed(context, SignInScreen.routeName); },
        ),
      ],
    );
  }
}