import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/widgets/my_text_field.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ContactField extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneController;

  const ContactField({
    super.key,
    required this.fullNameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: primaryTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        MyTextField(
          controller: fullNameController,
          hintText: 'Full Name',
          textValidator: 'Required',
        ),
        const SizedBox(
          height: 6,
        ),
        MyTextField(
          controller: phoneController,
          hintText: 'Phone Number',
          textValidator: 'Required',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
