import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
import 'package:shoe_store_app/pages/checkout/widgets/payment_method_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ChoosePaymentMethodPage extends StatelessWidget {
  static const routeName = '/choose-payment-method';

  const ChoosePaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentMethodProvider paymentProvider =
        Provider.of<PaymentMethodProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    List<PaymentMethodModel> paymentMethods = paymentProvider.paymentMethods;

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'Payment Method',
        leadingIcon: backIcon,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        itemCount: paymentMethods.length,
        itemBuilder: (BuildContext context, int index) =>
            Consumer<PaymentMethodProvider>(
          builder: (context, paymentProvider, _) {
            PaymentMethodModel paymentMethod =
                paymentProvider.paymentMethods[index];
            return GestureDetector(
              onTap: () {
                if (paymentMethod.name == 'Wallet') {
                  if (authProvider.user.balance! < cartProvider.totalPrice()) {
                    MySnackBar.showSnackBar(
                      context: context,
                      message: 'Your balance is not enough',
                      isSuccess: false,
                    );
                  } else {
                    paymentProvider.methodSelected = index;
                  }
                } else {
                  paymentProvider.methodSelected = index;
                }
              },
              child: PaymentMethodItem(
                paymentMethod: paymentMethod.name!,
                isSelected: paymentProvider.methodSelected == index,
              ),
            );
          },
        ),
      ),
    );
  }
}
