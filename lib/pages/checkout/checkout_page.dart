import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_tile.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(pagePadding),
        color: backgroundColor3,
        child: MyButton(
          text: 'Checkout Now',
          onTap: () => Navigator.pushReplacementNamed(context, checkoutSuccessPage),
          fontWeight: semiBold,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(pagePadding),
        children: [
          Text(
            'List Items',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          CheckoutTile(
            imageAsset: 'assets/image/image_shoe.png',
            productName: 'productName',
            price: 666,
            totalItem: 1,
          ),
          CheckoutTile(
            imageAsset: 'assets/image/image_shoe.png',
            productName: 'productName',
            price: 666,
            totalItem: 2,
          ),
          SizedBox(
            height: 30,
          ),
          CheckoutAddress(
            yourAddress: 'Mexico Utara',
          ),
          SizedBox(
            height: 30,
          ),
          CheckoutPayment(
            quantity: 2,
            price: 666,
            shipping: 0,
          ),
        ],
      ),
    );
  }
}
