import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/address_api_model.dart';
import 'package:shoe_store_app/services/address_api_service.dart';

class AddressApiProvider with ChangeNotifier {
  List<AddressApiModel> _regions = [];

  AddressApiModel _province = AddressApiModel(id: '', text: '');
  AddressApiModel _city = AddressApiModel(id: '', text: '');
  AddressApiModel _district = AddressApiModel(id: '', text: '');
  AddressApiModel _postalCode = AddressApiModel(id: '', text: '');
  String _nowSelected = 'Province';
  bool _isNotFilled = false;

  List<AddressApiModel> get regions => _regions;
  set regions(List<AddressApiModel> regions) {
    _regions = regions;
    notifyListeners();
  }

  AddressApiModel get province => _province;
  set province(AddressApiModel province) {
    _province = province;
    notifyListeners();
  }

  AddressApiModel get city => _city;
  set city(AddressApiModel city) {
    _city = city;
    notifyListeners();
  }

  AddressApiModel get district => _district;
  set district(AddressApiModel district) {
    _district = district;
    notifyListeners();
  }

  AddressApiModel get postalCode => _postalCode;
  set postalCode(AddressApiModel postalCode) {
    _postalCode = postalCode;
    notifyListeners();
  }

  String get nowSelected => _nowSelected;
  set nowSelected(String nowSelected) {
    _nowSelected = nowSelected;
    notifyListeners();
  }

  bool get isNotFilled => _isNotFilled;
  set isNotFilled(bool isNotFilled) {
    _isNotFilled = isNotFilled;
    notifyListeners();
  }

  Future<void> getAddress(String apiUrl) async {
    try {
      List<AddressApiModel> regions = await AddressApiService().getAddress(apiUrl);

      _regions = regions;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  resetData() {
    _province.text = '';
    _city.text = '';
    _district.text = '';
    _postalCode.text = '';
    _nowSelected = 'Province';
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }
}
