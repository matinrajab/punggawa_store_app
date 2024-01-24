import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/auth/widgets/auth_text_form.dart';
import 'package:shoe_store_app/pages/auth/widgets/footer.dart';
import 'package:shoe_store_app/pages/widgets/header.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
                  title: 'Sign Up',
                  subtitle: 'Register and Happy Shopping',
                ),
                SizedBox(
                  height: 50,
                ),
                AuthTextForm(
                  fieldName: 'Full Name',
                  controller: _nameController,
                  hintText: 'Your Full Name',
                  prefixIconAsset: 'assets/icon/icon_name.png',
                ),
                SizedBox(
                  height: 20,
                ),
                AuthTextForm(
                  fieldName: 'Username',
                  controller: _usernameController,
                  hintText: 'Your Username',
                  prefixIconAsset: 'assets/icon/icon_username.png',
                ),
                SizedBox(
                  height: 20,
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
                  text: 'Sign Up',
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, mainPage, (route) => false),
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
