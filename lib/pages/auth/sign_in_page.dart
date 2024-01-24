import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/auth/widgets/auth_text_form.dart';
import 'package:shoe_store_app/pages/auth/widgets/footer.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: 'Login',
                  subtitle: 'Sign In to Continue',
                ),
                SizedBox(
                  height: 70,
                ),
                AuthTextForm(
                  fieldName: 'Email Address',
                  controller: _emailController,
                  hintText: 'Your Email Address',
                  prefixIconAsset: 'assets/icon/icon_email.png',
                ),
                SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  hintText: 'Your Password',
                  prefixIconAsset: 'assets/icon/icon_password.png',
                ),
                SizedBox(
                  height: 30,
                ),
                MyButton(
                  text: 'Sign In',
                  onTap: () => Navigator.pushReplacementNamed(context, mainPage),
                ),
                Footer(
                  text: 'Don\'t have an account?',
                  textButton: 'Sign up',
                  onTap: () => Navigator.pushNamed(context, signUpPage),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
