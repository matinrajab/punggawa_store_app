import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/services/transaction_service.dart';
import 'package:shoe_store_app/services/transaction_status_service.dart';

class TransactionProvider with ChangeNotifier {
  String _address = 'Mexico Utara';
  String _snapToken = '';
  List<TransactionModel> _transactions = [];
  bool _isLoading = false;

  String get address => _address;
  set address(String address) {
    _address = address;
    notifyListeners();
  }

  String get snapToken => _snapToken;
  set snapToken(String snapToken) {
    _snapToken = snapToken;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
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
      String snapToken = await TransactionService().checkout(
        token,
        carts,
        _address,
        totalPrice,
      );

      _snapToken = snapToken;
      return true;
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

  Future<bool> updateStatus({
    required String status,
    required int id,
  }) async {
    try {
      await TransactionStatusService().updateStatus(
        status: status,
        id: id,
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
