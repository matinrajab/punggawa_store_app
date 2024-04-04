import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/services/address_service.dart';

class AddressProvider with ChangeNotifier {
  List<AddressModel> _addresses = [];
  int _addressSelected = 0;
  int _addressSelectedToEdit = 0;
  bool _isButtonLoading = false;
  bool _isAlertLoading = false;

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

  int get addressSelectedToEdit => _addressSelectedToEdit;
  set addressSelectedToEdit(int addressSelectedToEdit) {
    _addressSelectedToEdit = addressSelectedToEdit;
    notifyListeners();
  }

  bool get isButtonLoading => _isButtonLoading;
  set isButtonLoading(bool isButtonLoading) {
    _isButtonLoading = isButtonLoading;
    notifyListeners();
  }

  bool get isAlertLoading => _isAlertLoading;
  set isAlertLoading(bool isAlertLoading) {
    _isAlertLoading = isAlertLoading;
    notifyListeners();
  }

  Future<void> getAddresses() async {
    try {
      List<AddressModel> addresses = await AddressService().getAddresses();

      _addresses = addresses;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<bool> storeAddress({required AddressModel address}) async {
    try {
      await AddressService().storeAddress(address: address);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateAddress({required AddressModel address}) async {
    try {
      await AddressService().updateAddress(address: address);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAddress({required int id}) async {
    try {
      await AddressService().deleteAddress(id: id);

      return true;
    } catch (e) {
      return false;
    }
  }
}
