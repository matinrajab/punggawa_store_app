import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/auth/sign_up_page.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_success_page.dart';
import 'package:shoe_store_app/pages/checkout/edit_address_page.dart';
import 'package:shoe_store_app/pages/payment/payment_page.dart';
import 'package:shoe_store_app/pages/product/product_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/splash/splash_page.dart';
import 'package:shoe_store_app/pages/transaction/detail_order_page.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/routes/route_name.dart';

final Map<String, WidgetBuilder> routes = {
  splashPage: (context) => const SplashPage(),
  signInPage: (context) => SignInPage(),
  signUpPage: (context) => SignUpPage(),
  mainPage: (context) => MainPage(),
  cartPage: (context) => const CartPage(),
  detailChatPage: (context) => DetailChatPage(),
  editProfilePage: (context) => const EditProfilePage(),
  checkoutPage: (context) => const CheckoutPage(),
  productPage: (context) => const ProductPage(),
  checkoutSuccessPage: (context) => const CheckoutSuccessPage(),
  editAddressPage: (context) => const EditAddressPage(),
  orderPage: (context) => const OrderPage(),
  detailOrderPage: (context) => const DetailOrderPage(),
  paymentPage: (context) => const PaymentPage(),
};
