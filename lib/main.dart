import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/auth/sign_up_page.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_success_page.dart';
import 'package:shoe_store_app/pages/product/product_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/splash/splash_page.dart';
import 'package:shoe_store_app/providers/providers.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          splashPage: (context) => const SplashPage(),
          signInPage: (context) => SignInPage(),
          signUpPage: (context) => SignUpPage(),
          mainPage: (context) => MainPage(),
          cartPage: (context) => const CartPage(),
          detailChatPage: (context) => DetailChatPage(),
          editProfilePage: (context) => const EditProfile(),
          checkoutPage: (context) => const CheckoutPage(),
          productPage: (context) => ProductPage(),
          checkoutSuccessPage: (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
