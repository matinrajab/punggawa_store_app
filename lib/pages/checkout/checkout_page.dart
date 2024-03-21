import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
import 'package:shoe_store_app/pages/address/add_address_page.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_payment.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/payment/payment_page.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary.dart';
import 'package:shoe_store_app/pages/widgets/detail_tile.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutPage extends StatelessWidget {
  static const routeName = '/checkout';

  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
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
    List<CartModel> cartSelected = cartProvider.cartSelected;
    List<CartModel> checkouts = checkoutProvider.checkouts;

    handleCheckout() async {
      checkoutProvider.isLoading = true;
      AddressProvider addressProvider =
          Provider.of<AddressProvider>(context, listen: false);
      List<AddressModel> addresses = addressProvider.addresses;
      if (addresses.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => MyAlertDialog(
            text: 'Want to create a new shipping address?',
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
        carts: checkouts,
        totalPrice: checkoutProvider.totalPrice(),
        paymentMethod: paymentMethod,
        addressId: addresses[addressProvider.addressSelected].id!,
      )) {
        if (identical(checkouts, cartSelected)) {
          cartProvider.onCheckout();
        }
        checkoutProvider.resetData();
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
      checkoutProvider.isLoading = false;
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'Checkout Details',
        leadingIcon: backIcon,
      ),
      bottomNavigationBar: Container(
        height: 110,
        padding: const EdgeInsets.all(pagePadding),
        color: backgroundColor1,
        child: Consumer<CheckoutProvider>(
          builder: (context, checkoutProvider, _) => checkoutProvider.isLoading
              ? MyCircularIndicator.show()
              : MyButton(
                  text: 'Checkout Now',
                  onTap: handleCheckout,
                  fontWeight: semiBold,
                ),
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
            children: checkouts
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
            quantity: checkoutProvider.totalItems(),
            productPrice: checkoutProvider.totalPrice(),
          ),
        ],
      ),
    );
  }
}
