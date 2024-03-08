import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/wallet/top_up_page.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/wallet_card.dart';
import 'package:shoe_store_app/shared/theme.dart';

class WalletPage extends StatelessWidget {
  static const routeName = '/wallet';

  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'My Wallet',
        leadingIcon: backIcon,
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: pagePadding),
        child: Center(
          child: SingleChildScrollView(
            child: WalletCard(),
          ),
        ),
      ),
    );
  }
}
