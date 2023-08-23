import 'package:Marketplace/Services/user_services.dart';
import 'package:Marketplace/firebase_options.dart';
import 'package:Marketplace/models/Contact.dart';
import 'package:Marketplace/models/User.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Marketplace/routes.dart';
import 'package:Marketplace/screens/splash/splash_screen.dart';
import 'package:Marketplace/theme.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await GetStorage.init();

  GetStorage().write('CurrentUser', 'some user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we don't need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
