import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/address/address_page.dart';
import 'package:shoe_store_app/pages/profile/edit_profile_page.dart';
import 'package:shoe_store_app/pages/profile/widgets/logout_alert_dialog.dart';
import 'package:shoe_store_app/pages/profile/widgets/profile_menu.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/wallet/wallet_page.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    onLogoutTapped() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const LogoutAlertDialog(),
      );
    }

    return Column(
      children: [
        AppBar(
          backgroundColor: backgroundColor1,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/image/profile.png',
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, _) => TitleAndSubtitle(
                      title: 'Halo, ${authProvider.user.name}',
                      subtitle: '@${authProvider.user.username}',
                      subtitleFontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onLogoutTapped,
                  icon: Image.asset(
                    'assets/button/exit.png',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: backgroundColor3,
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
                    'My Wallet',
                  ],
                  routes: [
                    () => Navigator.pushNamed(context, OrderPage.routeName,
                        arguments: 0),
                    () => Navigator.pushNamed(context, WalletPage.routeName),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
