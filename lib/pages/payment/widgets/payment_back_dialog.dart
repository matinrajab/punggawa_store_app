import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';

class PaymentBackDialog extends StatelessWidget {
  const PaymentBackDialog({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);

    handleBack() async {
      await Provider.of<AuthProvider>(context, listen: false).fetch();
      await Provider.of<TransactionProvider>(context, listen: false)
          .getTransactions();
      pageProvider.currentIndex = 0;
      Navigator.pushNamedAndRemoveUntil(
          context, MainPage.routeName, (route) => false);
    }

    return MyAlertDialog(
      text: 'Quit Payment?',
      onYesTapped: handleBack,
    );
  }
}
