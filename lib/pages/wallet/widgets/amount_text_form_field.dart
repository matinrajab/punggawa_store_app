import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/providers/top_up_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AmountTextFormField extends StatelessWidget {
  final TextEditingController textController;

  const AmountTextFormField({
    super.key,
    required this.textController,
  });

  final int topUpMinimum = 10000;

  @override
  Widget build(BuildContext context) {
    TopUpProvider topUpProvider =
        Provider.of<TopUpProvider>(context, listen: false);

    return TextFormField(
      controller: textController,
      onChanged: (value) {
        if (value.isEmpty) {
          textController.text = 'Rp 0';
        }
        topUpProvider.textControllerValue = value;
      },
      validator: (value) {
        String text;
        text = value!.replaceAll('Rp ', '');
        text = text.replaceAll('.', '');
        topUpProvider.amount = int.parse(text);
        if (topUpProvider.amount < topUpMinimum) {
          return 'Minimum top-up amount is ${currencyFormat(topUpMinimum)}';
        }
        return null;
      },
      inputFormatters: <TextInputFormatter>[
        CurrencyTextInputFormatter(
          locale: 'id',
          symbol: 'Rp ',
          decimalDigits: 0,
        ),
      ],
      keyboardType: TextInputType.number,
      style: primaryTextStyle,
      cursorColor: primaryTextColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        filled: true,
        fillColor: backgroundColor2,
        hintText: 'Amount',
        hintStyle: subtitleTextStyle,
      ),
    );
  }
}
