import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/transaction_model.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction = ModalRoute.of(context)!.settings.arguments as TransactionModel;

    return const Placeholder();
  }
}
