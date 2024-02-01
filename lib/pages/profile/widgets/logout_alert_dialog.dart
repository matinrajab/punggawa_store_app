import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleLogout() async {
      if (await authProvider.logout()) {
        Navigator.pushNamedAndRemoveUntil(
            context, signInPage, (route) => false);
        pageProvider.currentIndex = 0;
      } else {
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Logout',
          isSuccess: false,
        );
      }
    }

    return AlertDialog(
      backgroundColor: backgroundColor3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Text(
                  'Yakin mau keluar? :\')',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    text: 'ga jadi',
                    onTap: () => Navigator.pop(context),
                    height: 44,
                    fontColor: blackTextColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  MyButton(
                    text: 'yakin',
                    onTap: handleLogout,
                    height: 44,
                    buttonColor: backgroundColor5,
                    fontColor: primaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
