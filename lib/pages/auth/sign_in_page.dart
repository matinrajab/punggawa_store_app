import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/sign_up_page.dart';
import 'package:shoe_store_app/pages/auth/widgets/auth_text_form.dart';
import 'package:shoe_store_app/pages/auth/widgets/footer.dart';
import 'package:shoe_store_app/pages/auth/widgets/continue_with_google_button.dart';
import 'package:shoe_store_app/pages/chat_admin/admin_chat_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SignInPage extends StatelessWidget {
  static const routeName = '/sign-in';

  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleSignIn() async {
      authProvider.isLoading = true;
      if (await authProvider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      )) {
        if (authProvider.user.role == 'user') {
          await Provider.of<TransactionProvider>(context, listen: false)
              .getTransactions();
          Navigator.pushNamedAndRemoveUntil(
              context, MainPage.routeName, (route) => false);
          await Provider.of<AddressProvider>(context, listen: false)
              .getAddresses();
        } else {
          await authProvider.getUsers();
          // Navigator.pushNamed(
          //   context,
          //   AdminDetailChatPage.routeName,
          //   arguments: UninitializedProductModel(),
          // );
          Navigator.pushReplacementNamed(context, AdminChatPage.routeName);
        }
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Login',
        );
      }
      authProvider.isLoading = false;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleAndSubtitle(
                  title: 'Login',
                  subtitle: 'Sign In to Continue',
                ),
                const SizedBox(
                  height: 70,
                ),
                AuthTextForm(
                  fieldName: 'Email Address',
                  controller: _emailController,
                  hintText: 'Your Email Address',
                  prefixIconAsset: 'assets/icon/email.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'Your Password',
                  prefixIconAsset: 'assets/icon/password.png',
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<AuthProvider>(
                  builder: (context, authProvider, _) => authProvider.isLoading
                      ? MyCircularIndicator.show()
                      : MyButton(
                          text: 'Sign In',
                          onTap: handleSignIn,
                        ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Or',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
                const ContinueWithGoogleButton(),
                Footer(
                  text: 'Don\'t have an account?',
                  textButton: 'Sign up',
                  onTap: () =>
                      Navigator.pushNamed(context, SignUpPage.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
