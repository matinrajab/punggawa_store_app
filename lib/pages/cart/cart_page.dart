import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/cart/widgets/cart_tile.dart';
import 'package:shoe_store_app/pages/main/widgets/my_bottom_nav_bar.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final bool _isEmpty = false;

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close_rounded,
            color: primaryTextColor,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 180,
        color: backgroundColor3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$666',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              color: subtitleTextColor,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: generalBorderRadius,
                  color: primaryColor,
                ),
                child: Material(
                  borderRadius: generalBorderRadius,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: generalBorderRadius,
                    onTap: () => Navigator.pushNamed(context, checkoutPage),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Continue to Checkout',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: primaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: _isEmpty
            ? EmptyItem(
                iconAsset: 'assets/icon/icon_empty_cart.png',
                title: 'Opss! Your Cart is Empty',
                subtitle: 'Let\'s find your favorite shoes',
              )
            : ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: pagePadding),
                children: [
                  CartTile(
                    imageAsset: 'assets/image/image_shoe.png',
                    productName: 'Adidas',
                    price: 666,
                  ),
                ],
              ),
      ),
    );
  }
}
