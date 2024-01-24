import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/auth/sign_up_page.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/home/product_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/splash/splash_page.dart';
import 'package:shoe_store_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: signInPage,
      routes: {
        splashPage: (context) => SplashPage(),
        signInPage: (context) => SignInPage(),
        signUpPage: (context) => SignUpPage(),
        mainPage: (context) => MainPage(),
        cartPage: (context) => CartPage(),
        detailChatPage: (context) => DetailChatPage(),
        editProfilePage: (context) => EditProfile(),
        productPage: (context) => ProductPage(),
      },
    );
  }
}