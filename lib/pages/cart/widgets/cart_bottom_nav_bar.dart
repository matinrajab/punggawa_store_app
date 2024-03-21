import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CartBottomNavBar extends StatelessWidget {
  final int price;

  const CartBottomNavBar({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    List<CartModel> carts = cartProvider.carts;
    List<CartModel> cartSelected = cartProvider.cartSelected;
    List<CartModel> checkouts = checkoutProvider.checkouts;

    return Container(
      height: 170,
      color: backgroundColor1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: pagePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: carts.length == cartSelected.length,
                      onChanged: (bool? value) {
                        if (value != null) {
                          value
                              ? cartProvider.selectAll()
                              : cartProvider.unselectAll();
                        }
                      },
                      activeColor: primaryColor,
                      checkColor: whiteColor,
                    ),
                    Text(
                      'All',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Total ',
                      style: primaryTextStyle,
                    ),
                    Text(
                      currencyFormat(price),
                      style: priceTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: subtitleTextColor,
          ),
          const SizedBox(
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
                  onTap: () {
                    checkouts.isEmpty
                        ? Fluttertoast.showToast(
                            msg: "Please select items",
                          )
                        : Navigator.pushNamed(
                            context,
                            CheckoutPage.routeName,
                          );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Continue to Checkout',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: whiteColor,
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
    );
  }
}
