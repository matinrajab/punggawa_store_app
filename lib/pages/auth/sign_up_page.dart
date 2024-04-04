import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/widgets/auth_text_form.dart';
import 'package:shoe_store_app/pages/auth/widgets/footer.dart';
import 'package:shoe_store_app/pages/auth/widgets/continue_with_google_button.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/sign-up';

  SignUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleSignUp() async {
      authProvider.isLoading = true;
      if (await authProvider.register(
        name: _nameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (route) => false);
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Register',
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
                  title: 'Sign Up',
                  subtitle: 'Register and Happy Shopping',
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextForm(
                  fieldName: 'Full Name',
                  controller: _nameController,
                  hintText: 'Your Full Name',
                  prefixIconAsset: 'assets/icon/name.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Username',
                  controller: _usernameController,
                  hintText: 'Your Username',
                  prefixIconAsset: 'assets/icon/username.png',
                ),
                const SizedBox(
                  height: 20,
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
                          text: 'Sign Up',
                          onTap: handleSignUp,
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
                  text: 'Already have an account?',
                  textButton: 'Sign In',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
