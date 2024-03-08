import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/wallet_card_item.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/image/wallet_card_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, _) => WalletCardItem(
                      title: 'Name',
                      information: '${authProvider.user.name}',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/icon/punggawapay.png',
                  height: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) => WalletCardItem(
                title: 'Balance',
                information: currencyFormat(authProvider.user.balance!),
                informationFontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
