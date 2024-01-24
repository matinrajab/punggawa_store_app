import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close_rounded, color: primaryTextColor,),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: EmptyItem(
            iconAsset: 'assets/icon/icon_empty_cart.png',
            title: 'Opss! Your Cart is Empty',
            subtitle: 'Let\'s find your favorite shoes'),
      ),
    );
  }
}
