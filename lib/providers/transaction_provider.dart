import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
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

  List<TransactionModel> get transactions => _transactions;
  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> checkout({
    required String token,
    required List<CartModel> carts,
    required int totalPrice,
    required PaymentMethodModel paymentMethod,
    required int addressId,
  }) async {
    try {
      String? snapToken = await TransactionService().checkout(
        token: token,
        carts: carts,
        addressId: addressId,
        totalPrice: totalPrice,
        paymentMethod: paymentMethod,
      );

      _snapToken = snapToken ?? '';
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> addBonus(
    int amount,
  ) async {
    try {
      await TransactionService().addBonus(amount: amount);

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
