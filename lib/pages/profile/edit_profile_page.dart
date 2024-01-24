import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/profile/widgets/edit_profile_text_form.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final TextEditingController _nameController =
      TextEditingController(text: 'Matin Muhammad');
  final TextEditingController _usernameController =
      TextEditingController(text: '@matin');
  final TextEditingController _emailController =
      TextEditingController(text: 'matin@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close_rounded,
            color: primaryTextColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/image/image_profile.png',
                  height: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                EditProfileTextForm(
                  title: 'Name',
                  controller: _nameController,
                ),
                SizedBox(
                  height: 24,
                ),
                EditProfileTextForm(
                  title: 'Username',
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 24,
                ),
                EditProfileTextForm(
                  title: 'Email Address',
                  controller: _emailController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
