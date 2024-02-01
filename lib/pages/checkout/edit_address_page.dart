import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    TextEditingController textEditingController = TextEditingController(text: transactionProvider.address);

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
        title: Text(
          'Your Address',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              transactionProvider.address = textEditingController.text;
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.check,
              color: primaryColor,
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
          minLines: 1,
          maxLines: 5,
        ),
      ),
    );
  }
}
