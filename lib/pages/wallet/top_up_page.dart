import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/wallet/top_up_payment_page.dart';
import 'package:shoe_store_app/pages/wallet/widgets/amount_option.dart';
import 'package:shoe_store_app/pages/wallet/widgets/amount_text_form_field.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/top_up_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class TopUpPage extends StatelessWidget {
  static const routeName = '/top-up';

  TopUpPage({
    super.key,
  });

  final TextEditingController _amountController =
      TextEditingController(text: 'Rp 0');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TopUpProvider topUpProvider =
        Provider.of<TopUpProvider>(context, listen: false);

    handleConfirm() async {
      if (await topUpProvider.topUp()) {
        Navigator.pushNamed(context, TopUpPaymentPage.routeName);
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Top Up',
        );
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.pop(context);
        topUpProvider.resetData();
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: backgroundColor1,
          appBar: MyAppBar(
            text: 'Top Up',
            leadingIcon: backIcon,
            onLeadingPressed: () {
              Navigator.pop(context);
              topUpProvider.resetData();
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(pagePadding),
            color: backgroundColor1,
            child: MyButton(
              text: 'Confirm',
              fontWeight: semiBold,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  handleConfirm();
                }
              },
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(pagePadding),
            children: [
              const SizedBox(
                height: 100,
              ),
              AmountOption(
                amountController: _amountController,
              ),
              const SizedBox(
                height: 30,
              ),
              AmountTextFormField(
                textController: _amountController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
