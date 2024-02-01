import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  String _address = 'Mexico Utara';
  List<TransactionModel> _transactions = [];

  String get address => _address;
  set address(String address) {
    _address = address;
    notifyListeners();
  }

  List<TransactionModel> get transactions => _transactions;
  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransactionService()
          .checkout(token, carts, _address, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getTransactions() async {
    try {
      List<TransactionModel> transactions =
          await TransactionService().getTransactions();

      _transactions = transactions;
    } catch (e) {
      print(e);
    }
  }
}
