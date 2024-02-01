import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/pages/profile/widgets/edit_profile_text_form.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Center(
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                UserModel user = authProvider.user;
                List<Map<String, String>> fields = [
                  {'title': 'Name', 'value': user.name!},
                  {'title': 'Username', 'value': user.username!},
                  {'title': 'Email', 'value': user.email!},
                ];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/image/image_profile.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: fields
                          .map(
                            (field) => EditProfileTextForm(
                              title: field['title']!,
                              value: field['value']!,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
