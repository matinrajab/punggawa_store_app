import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/services/region_api_service.dart';

class RegionApiProvider with ChangeNotifier {
  List<RegionApiModel> _regions = [];

  RegionApiModel _province = RegionApiModel(id: '', text: '');
  RegionApiModel _city = RegionApiModel(id: '', text: '');
  RegionApiModel _district = RegionApiModel(id: '', text: '');
  RegionApiModel _postalCode = RegionApiModel(id: '', text: '');
  String _nowSelected = '';
  bool _isRequiredAppear = false;

  List<RegionApiModel> get regions => _regions;
  set regions(List<RegionApiModel> regions) {
    _regions = regions;
    notifyListeners();
  }

  RegionApiModel get province => _province;
  set province(RegionApiModel province) {
    _province = province;
    notifyListeners();
  }

  RegionApiModel get city => _city;
  set city(RegionApiModel city) {
    _city = city;
    notifyListeners();
  }

  RegionApiModel get district => _district;
  set district(RegionApiModel district) {
    _district = district;
    notifyListeners();
  }

  RegionApiModel get postalCode => _postalCode;
  set postalCode(RegionApiModel postalCode) {
    _postalCode = postalCode;
    notifyListeners();
  }

  String get nowSelected => _nowSelected;
  set nowSelected(String nowSelected) {
    _nowSelected = nowSelected;
    notifyListeners();
  }

  bool get isRequiredAppear => _isRequiredAppear;
  set isRequiredAppear(bool isRequiredAppear) {
    _isRequiredAppear = isRequiredAppear;
    notifyListeners();
  }

  Future<void> getAddress(String apiUrl) async {
    try {
      List<RegionApiModel> regions = await RegionApiService().getAddress(apiUrl);

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
