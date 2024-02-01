import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/pages/transaction/widgets/order_card.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/theme/theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    List<TransactionModel> transactions = transactionProvider.transactions;

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Your Order',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
      ),
      body: Center(
        child: transactions.isEmpty
            ? const EmptyItem(
                iconAsset: 'assets/icon/icon_empty_cart.png',
                title: 'Oops! Your Order is Empty',
                subtitle: 'Let\'s find your favorite shoes',
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: pagePadding,
                ),
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index) => OrderCard(
                  transaction: transactions[index],
                ),
              ),
      ),
    );
  }
}
