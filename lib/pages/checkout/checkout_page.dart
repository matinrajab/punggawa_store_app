import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
import 'package:shoe_store_app/pages/address/add_address_page.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/payment/payment_page.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary.dart';
import 'package:shoe_store_app/pages/widgets/detail_tile.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    PaymentMethodProvider paymentProvider =
        Provider.of<PaymentMethodProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);

    handleCheckout() async {
      AddressProvider addressProvider =
          Provider.of<AddressProvider>(context, listen: false);
      List<AddressModel> addresses = addressProvider.addresses;
      if (addresses.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => MyAlertDialog(
            text:
                'You don\'t have a shipping address yet, want to create a new one?',
            onYesTapped: () =>
                Navigator.popAndPushNamed(context, AddAddressPage.routeName),
          ),
        );
        return;
      }

      PaymentMethodModel paymentMethod =
          paymentProvider.paymentMethods[paymentProvider.methodSelected];
      if (await transactionProvider.checkout(
        token: authProvider.user.token!,
        carts: cartProvider.carts,
        totalPrice: cartProvider.totalPrice(),
        paymentMethod: paymentMethod,
        addressId: addresses[addressProvider.addressSelected].id!,
      )) {
        cartProvider.carts.clear();
        if (paymentMethod.name == 'Transfer') {
          Navigator.pushNamed(context, PaymentPage.routeName);
        } else {
          await Provider.of<TransactionProvider>(context, listen: false)
              .getTransactions();
          pageProvider.currentIndex = 3;
          Navigator.pushNamedAndRemoveUntil(
            context,
            OrderPage.routeName,
            ModalRoute.withName(MainPage.routeName),
            arguments: 1,
          );
        }
        if (paymentMethod.name == 'Wallet') {
          await Provider.of<AuthProvider>(context, listen: false).fetch();
        }
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Checkout',
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'Checkout Details',
        leadingIcon: backIcon,
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
                  (cart) => DetailTile(
                    cart: cart,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          const CheckoutAddress(),
          const SizedBox(
            height: 30,
          ),
          const CheckoutPayment(),
          const SizedBox(
            height: 30,
          ),
          PaymentSummary(
            quantity: cartProvider.totalItems(),
            productPrice: cartProvider.totalPrice(),
          ),
        ],
      ),
    );
  }
}
