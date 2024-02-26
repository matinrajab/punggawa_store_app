import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
import 'package:shoe_store_app/services/payment_method_service.dart';

class PaymentMethodProvider with ChangeNotifier{
  List<PaymentMethodModel> _paymentMethods = [];
  int _methodSelected = 0;

  List<PaymentMethodModel> get paymentMethods => _paymentMethods;
  set paymentMethods(List<PaymentMethodModel> paymentMethods){
    _paymentMethods = paymentMethods;
    notifyListeners();
  }

  int get methodSelected => _methodSelected;
  set methodSelected(int methodSelected){
    _methodSelected = methodSelected;
    notifyListeners();
  }

  Future<void> getPaymentMethods() async {
    try {
      List<PaymentMethodModel> paymentMethods = await PaymentMethodService().getPaymentMethods();

      _paymentMethods = paymentMethods;
    } catch (e) {
      print(e);
    }
  }
}