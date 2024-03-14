import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class EditFieldPage extends StatelessWidget {
  final String title;
  final String value;

  const EditFieldPage({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: value);

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    handleUpdate() async {
      authProvider.isLoading = true;
      if (value == textEditingController.text ||
          await authProvider.updateProfile(
            key: title.toLowerCase(),
            value: textEditingController.text,
          )) {
        Navigator.pop(context);
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Update Profile',
        );
      }
      authProvider.isLoading = false;
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: MyAppBar(
        text: title,
        leadingIcon: closeIcon,
        actions: [
          Consumer<AuthProvider>(
            builder: (context, authProvider, _) => authProvider.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: secondaryColor,
                    ),
                  )
                : IconButton(
                    onPressed: handleUpdate,
                    icon: const Icon(
                      Icons.check,
                      color: secondaryColor,
                    ),
                  ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: TextField(
          controller: textEditingController,
          style: primaryTextStyle.copyWith(fontSize: 16),
          cursorColor: primaryTextColor,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: subtitleTextColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryTextColor),
            ),
          ),
          autofocus: true,
        ),
      ),
    );
  }
}
