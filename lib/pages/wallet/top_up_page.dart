import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/payment/payment_page.dart';
import 'package:shoe_store_app/pages/wallet/top_up_payment_page.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:intl/intl.dart';

class TopUpPage extends StatelessWidget {
  static const routeName = '/top-up';

  TopUpPage({
    super.key,
  });

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);

    handleConfirm() async {
      if (await transactionProvider.topUp(int.parse(_amountController.text))) {
        Navigator.pushNamed(context, TopUpPaymentPage.routeName);
      } else {
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Top Up',
          isSuccess: false,
        );
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'Top Up',
        leadingIcon: backIcon,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(pagePadding),
        color: backgroundColor3,
        child: MyButton(
          text: 'Confirm',
          onTap: handleConfirm,
          fontWeight: semiBold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Center(
          child: TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            style: primaryTextStyle,
            cursorColor: primaryTextColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundColor2),
                borderRadius: generalBorderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: backgroundColor2),
                borderRadius: generalBorderRadius,
              ),
              filled: true,
              fillColor: backgroundColor2,
              hintText: 'Amount',
              hintStyle: subtitleTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
