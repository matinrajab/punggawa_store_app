import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/category_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    await Provider.of<CategoryProvider>(context, listen: false).getCategories();
    if (await Provider.of<AuthProvider>(context, listen: false).fetch()) {
      await Provider.of<TransactionProvider>(context, listen: false)
          .getTransactions();
      Navigator.pushReplacementNamed(context, mainPage);
    } else {
      Navigator.pushReplacementNamed(context, signInPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Image.asset(
          'assets/image/image_splash.png',
          width: 130,
        ),
      ),
    );
  }
}
