import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/chat_admin/admin_chat_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    await Provider.of<ProductProvider


    >(context, listen: false).getProducts();
    await Provider.of<ProductCategoryProvider>(context, listen: false)
        .getCategories();
    await Provider.of<AddressCategoryProvider>(context, listen: false)
        .getCategories();
    await Provider.of<PaymentMethodProvider>(context, listen: false)
        .getPaymentMethods();
    await Provider.of<RajaOngkirProvider>(context, listen: false)
        .getProvinces();
    if (await authProvider.fetch()) {
      if (authProvider.user.role == 'user') {
        await Provider.of<TransactionProvider>(context, listen: false)
            .getTransactions();
        await Provider.of<AddressProvider>(context, listen: false)
            .getAddresses();
        Navigator.pushReplacementNamed(context, MainPage.routeName);
      } else {
        await authProvider.getUsers();
        // Navigator.pushNamed(
        //   context,
        //   AdminDetailChatPage.routeName,
        //   arguments: UninitializedProductModel(),
        // );
        Navigator.pushNamed(context, AdminChatPage.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, SignInPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(66),
            child: Image.asset(
              'assets/image/splash.png',
            ),
          ),
        ),
      ),
    );
  }
}
