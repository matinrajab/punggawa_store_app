import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/profile/edit_field_page.dart';
import 'package:shoe_store_app/shared/theme.dart';

class EditProfileTextForm extends StatelessWidget {
  final String title;
  final String value;
  final bool readOnly;

  const EditProfileTextForm({
    super.key,
    required this.title,
    required this.value,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readOnly
          ? () {}
          : () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditFieldPage(
                    title: title,
                    value: value,
                  ),
                ),
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: secondaryTextStyle.copyWith(fontSize: 13),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              color: readOnly ? secondaryTextColor : primaryTextColor,
            ),
          ),
          Divider(
            color: readOnly ? secondaryTextColor : subtitleTextColor,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
