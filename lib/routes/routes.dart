import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/pages/address/add_address_page.dart';
import 'package:shoe_store_app/pages/address/address_page.dart';
import 'package:shoe_store_app/pages/address/edit_address_page.dart';
import 'package:shoe_store_app/pages/address/select_region_page.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/auth/sign_up_page.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/checkout/checkout_success_page.dart';
import 'package:shoe_store_app/pages/checkout/choose_payment_method_page.dart';
import 'package:shoe_store_app/pages/checkout/select_address_page.dart';
import 'package:shoe_store_app/pages/payment/payment_page.dart';
import 'package:shoe_store_app/pages/product/product_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/splash/splash_page.dart';
import 'package:shoe_store_app/pages/transaction/detail_order_page.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/wallet/top_up_page.dart';
import 'package:shoe_store_app/pages/wallet/top_up_payment_page.dart';
import 'package:shoe_store_app/pages/wallet/wallet_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  MainPage.routeName: (context) => MainPage(),
  CartPage.routeName: (context) => const CartPage(),
  DetailChatPage.routeName: (context) => DetailChatPage(
        product: ModalRoute.of(context)?.settings.arguments as ProductModel,
      ),
  EditProfilePage.routeName: (context) => const EditProfilePage(),
  CheckoutPage.routeName: (context) => const CheckoutPage(),
  ProductPage.routeName: (context) => ProductPage(
        product: ModalRoute.of(context)?.settings.arguments as ProductModel,
      ),
  CheckoutSuccessPage.routeName: (context) => const CheckoutSuccessPage(),
  SelectAddressPage.routeName: (context) => const SelectAddressPage(),
  OrderPage.routeName: (context) => OrderPage(
        initial: ModalRoute.of(context)?.settings.arguments as int,
      ),
  DetailOrderPage.routeName: (context) => DetailOrderPage(
        transaction:
            ModalRoute.of(context)?.settings.arguments as TransactionModel,
      ),
  PaymentPage.routeName: (context) => const PaymentPage(),
  WalletPage.routeName: (context) => const WalletPage(),
  TopUpPage.routeName: (context) => TopUpPage(),
  TopUpPaymentPage.routeName: (context) => const TopUpPaymentPage(),
  ChoosePaymentMethodPage.routeName: (context) =>
      const ChoosePaymentMethodPage(),
  AddressPage.routeName: (context) => const AddressPage(),
  AddAddressPage.routeName: (context) => AddAddressPage(),
  EditAddressPage.routeName: (context) => EditAddressPage(),
  SelectRegionPage.routeName: (context) => const SelectRegionPage(),
};
