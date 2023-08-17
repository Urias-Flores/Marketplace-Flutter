import 'package:Marketplace/screens/add_product/add_product_screen.dart';
import 'package:Marketplace/screens/home/pages/my_products/my_products_page.dart';
import 'package:Marketplace/screens/home/pages/wish_list/wish_list_page.dart';
import 'package:Marketplace/screens/search/search_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:Marketplace/screens/cart/cart_screen.dart';
import 'package:Marketplace/screens/complete_profile/complete_profile_screen.dart';
import 'package:Marketplace/screens/details/details_screen.dart';
import 'package:Marketplace/screens/forgot_password/forgot_password_screen.dart';
import 'package:Marketplace/screens/home/home_screen.dart';
import 'package:Marketplace/screens/login_success/login_success_screen.dart';
import 'package:Marketplace/screens/otp/otp_screen.dart';
import 'package:Marketplace/screens/home/pages/profile/profile_screen.dart';
import 'package:Marketplace/screens/sign_in/sign_in_screen.dart';
import 'package:Marketplace/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  AddProductScreen.routeName: (context) => const AddProductScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  SearchScreen.routeName: (context) => const SearchScreen(),
};
