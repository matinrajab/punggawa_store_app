import 'package:flutter/material.dart';
import 'package:shoe_store_app/services/top_up_service.dart';

class TopUpProvider with ChangeNotifier {
  int _amount = 0;
  String _textControllerValue = '';
  String _snapToken = '';

  int get amount => _amount;
  set amount(int amount) {
    _amount = amount;
    notifyListeners();
  }

  String get textControllerValue => _textControllerValue;
  set textControllerValue(String textControllerValue) {
    _textControllerValue = textControllerValue;
    notifyListeners();
  }

  String get snapToken => _snapToken;
  set snapToken(String snapToken) {
    _snapToken = snapToken;
    notifyListeners();
  }

  Future<bool> topUp() async {
    try {
      String snapToken = await TopUpService().topUp(amount: _amount);

      _snapToken = snapToken;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  resetData() {
    _amount = 0;
    _textControllerValue = '';
  }
}
