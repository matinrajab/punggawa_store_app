import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);

    handleLogout() async {
      if (await authProvider.logout()) {
        Navigator.pushNamedAndRemoveUntil(
            context, signInPage, (route) => false);
        pageProvider.currentIndex = 0;
        transactionProvider.transactions.clear();
      } else {
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Logout',
          isSuccess: false,
        );
      }
    }

    return MyAlertDialog(
      text: 'Are you sure you want to logout?',
      onYesTapped: handleLogout,
    );
  }
}
