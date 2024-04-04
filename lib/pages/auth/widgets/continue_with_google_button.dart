import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/auth/widgets/button_with_prefix.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleContinueWithGoogle() async {
      authProvider.isGoogleLoading = true;
      if (await authProvider.signInWithGoogle()) {
        UserModel user = authProvider.user;
        String email = user.email!;
        String password = authProvider.passwordTemp;
        if (await authProvider.login(
          email: email,
          password: password,
        )) {
          await Provider.of<TransactionProvider>(context, listen: false)
              .getTransactions();
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (route) => false);
          await Provider.of<AddressProvider>(context, listen: false)
              .getAddresses();
        } else {
          String name = user.name!;
          String username = user.username!;
          if (await authProvider.register(
            name: name,
            username: username,
            email: email,
            password: password,
          )) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainPage.routeName, (route) => false);
          }
        }
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Login',
        );
      }
      authProvider.isGoogleLoading = false;
    }

    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) => authProvider.isGoogleLoading
          ? MyCircularIndicator.show()
          : ButtonWithPrefix(
              widget: Image.asset(
                'assets/image/google_logo.png',
                height: 30,
              ),
              text: 'Continue with Google',
              onTap: handleContinueWithGoogle,
            ),
    );
  }
}
