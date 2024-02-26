import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyAlertDialog extends StatelessWidget {
  final String text;
  final GestureTapCallback onYesTapped;

  const MyAlertDialog({
    super.key,
    required this.text,
    required this.onYesTapped,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Text(
                  text,
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    text: 'No',
                    onTap: () => Navigator.pop(context),
                    height: 44,
                    buttonColor: backgroundColor5,
                    fontColor: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyButton(
                    text: 'Yes',
                    onTap: onYesTapped,
                    height: 44,
                    fontColor: blackTextColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
