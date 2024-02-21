import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SuccessAlertDialog extends StatelessWidget {
  const SuccessAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.close_rounded,
                color: primaryTextColor,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon/icon_success.png',
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Text(
                      'Hurray :)',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    text: 'View My Cart',
                    onTap: () => Navigator.popAndPushNamed(
                      context,
                      cartPage,
                    ),
                    height: 44,
                    width: 154,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
