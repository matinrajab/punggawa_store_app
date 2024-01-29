import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/profile/widgets/edit_profile_text_form.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel user = authProvider.user;

    final TextEditingController nameController = TextEditingController(
      text: user.name,
    );
    final TextEditingController usernameController = TextEditingController(
      text: user.username,
    );
    final TextEditingController emailController = TextEditingController(
      text: user.email,
    );

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
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
            icon: const Icon(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.profilePhotoUrl!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                EditProfileTextForm(
                  title: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                EditProfileTextForm(
                  title: 'Username',
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 24,
                ),
                EditProfileTextForm(
                  title: 'Email Address',
                  controller: emailController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
