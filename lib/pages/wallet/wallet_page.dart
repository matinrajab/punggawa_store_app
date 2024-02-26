import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/wallet/top_up_page.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  static const routeName = '/wallet';

  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'My Wallet',
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
          text: 'Top Up',
          onTap: () => Navigator.pushNamed(context, TopUpPage.routeName),
          fontWeight: semiBold,
        ),
      ),
      body: Center(
        child: Text(
          NumberFormat.currency(
            locale: 'id',
            symbol: 'IDR ',
            decimalDigits: 0,
          ).format(authProvider.user.balance),
          style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: semiBold,),
        ),
      ),
    );
  }
}
