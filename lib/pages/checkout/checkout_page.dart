import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_tile.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleCheckout() async {
      if (await transactionProvider.checkout(
        authProvider.user.token!,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts.clear();
        Navigator.pushNamedAndRemoveUntil(
            context, checkoutSuccessPage, (route) => false);
      }
    }

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
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(pagePadding),
        color: backgroundColor3,
        child: MyButton(
          text: 'Checkout Now',
          onTap: handleCheckout,
          fontWeight: semiBold,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(pagePadding),
        children: [
          Text(
            'List Items',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          Column(
            children: cartProvider.carts
                .map(
                  (cart) => CheckoutTile(
                    cart: cart,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          const CheckoutAddress(
            yourAddress: 'Mexico Utara',
          ),
          const SizedBox(
            height: 30,
          ),
          const CheckoutPayment(),
        ],
      ),
    );
  }
}
