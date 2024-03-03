import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/services/address_service.dart';

class AddressProvider with ChangeNotifier {
  List<AddressModel> _addresses = [];
  int _addressSelected = 0;
  bool _isLoading = false;

  List<AddressModel> get addresses => _addresses;
  set addresses(List<AddressModel> addresses) {
    _addresses = addresses;
    notifyListeners();
  }

  int get addressSelected => _addressSelected;
  set addressSelected(int addressSelected) {
    _addressSelected = addressSelected;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> getAddresses() async {
    try {
      List<AddressModel> addresses = await AddressService().getAddresses();

      _addresses = addresses;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> storeAddress({required AddressModel address}) async {
    try {
      await AddressService().storeAddress(address: address);

      return true;
    } catch (e) {
      return false;
    }
  }
}
