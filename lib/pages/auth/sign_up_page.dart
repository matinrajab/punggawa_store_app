import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/auth/widgets/auth_text_form.dart';
import 'package:shoe_store_app/pages/auth/widgets/footer.dart';
import 'package:shoe_store_app/pages/widgets/title_and_subtitle.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SignUpPage extends StatelessWidget {
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
        name: _nameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, mainPage, (route) => false);
      } else {
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Register',
          isSuccess: false,
        );
      }
      authProvider.isLoading = false;
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  prefixIconAsset: 'assets/icon/icon_name.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Username',
                  controller: _usernameController,
                  hintText: 'Your Username',
                  prefixIconAsset: 'assets/icon/icon_username.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Email Address',
                  controller: _emailController,
                  hintText: 'Your Email Address',
                  prefixIconAsset: 'assets/icon/icon_email.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'Your Password',
                  prefixIconAsset: 'assets/icon/icon_password.png',
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
