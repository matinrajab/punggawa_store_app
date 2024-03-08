import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/wallet/widgets/amount_option_item.dart';
import 'package:shoe_store_app/providers/top_up_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AmountOption extends StatelessWidget {
  final TextEditingController amountController;

  AmountOption({
    super.key,
    required this.amountController,
  });

  final List<int> _numberOptions = [50, 100, 200, 300, 500, 1];
  final List<String> _unitOptions = ['K', 'K', 'K', 'K', 'K', 'million'];
  final List<int> _amountOptions = [
    50000,
    100000,
    200000,
    300000,
    500000,
    1000000,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _numberOptions.length,
        itemBuilder: (_, index) => Consumer<TopUpProvider>(
          builder: (context, topUpProvider, _) {
            return AmountOptionItem(
              leading: '${_numberOptions[index]}',
              trailing: _unitOptions[index],
              isSelected: topUpProvider.textControllerValue ==
                  currencyFormat(_amountOptions[index]),
              onTap: () {
                amountController.text = currencyFormat(_amountOptions[index]);
                topUpProvider.textControllerValue = amountController.text;
              },
            );
          },
        ),
      ),
    );
  }
}
