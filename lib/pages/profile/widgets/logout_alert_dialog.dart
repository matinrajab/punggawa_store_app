import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/sign_in_page.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    handleLogout() async {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      if (await authProvider.logout()) {
        PageProvider pageProvider =
            Provider.of<PageProvider>(context, listen: false);
        TransactionProvider transactionProvider =
            Provider.of<TransactionProvider>(context, listen: false);
        AddressProvider addressProvider =
            Provider.of<AddressProvider>(context, listen: false);

        Navigator.pushNamedAndRemoveUntil(
            context, SignInPage.routeName, (route) => false);
        pageProvider.currentIndex = 0;
        transactionProvider.transactions.clear();
        addressProvider.addresses.clear();
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Logout',
        );
      }
    }

    return MyAlertDialog(
      text: 'Are you sure you want to logout?',
      onYesTapped: handleLogout,
    );
  }
}
