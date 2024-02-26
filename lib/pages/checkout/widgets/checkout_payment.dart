import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/checkout/choose_payment_method_page.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        color: backgroundColor4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Consumer<PaymentMethodProvider>(
                  builder: (context, paymentProvider, _) => Text(
                    paymentProvider.paymentMethods[paymentProvider.methodSelected].name!,
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ChoosePaymentMethodPage.routeName),
                child: Text(
                  'Edit',
                  style: priceTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
