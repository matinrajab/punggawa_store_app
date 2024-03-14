import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/address/address_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_menu.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_page_header.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/wallet/punggawa_pay_page.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePageHeader(),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor1,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              children: [
                ProfileMenu(
                  title: 'Account',
                  options: const [
                    'Edit Profile',
                    'My Addresses',
                  ],
                  routes: [
                    () =>
                        Navigator.pushNamed(context, EditProfilePage.routeName),
                    () => Navigator.pushNamed(context, AddressPage.routeName),
                  ],
                ),
                ProfileMenu(
                  title: 'Transaction',
                  options: const [
                    'Order History',
                  ],
                  routes: [
                    () => Navigator.pushNamed(context, OrderPage.routeName,
                        arguments: 0),
                  ],
                ),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) => ProfileMenu(
                    title: 'My Wallet',
                    options: [
                      'PunggawaPay (${currencyFormat(authProvider.user.balance!)})',
                    ],
                    routes: [
                      () => Navigator.pushNamed(
                          context, PunggawaPayPage.routeName),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
