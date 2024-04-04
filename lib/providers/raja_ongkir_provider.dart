import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/city_api_model.dart';
import 'package:shoe_store_app/models/province_api_model.dart';
import 'package:shoe_store_app/services/raja_ongkir_service.dart';

class RajaOngkirProvider with ChangeNotifier {
  List<ProvinceApiModel> _provinces = [];
  List<CityApiModel> _cities = [];
  bool _isCitiesLoading = false;

  ProvinceApiModel _province = ProvinceApiModel();
  CityApiModel _city = CityApiModel();
  bool _isRequiredAppear = false;

  bool get isCitiesLoading => _isCitiesLoading;
  set isCitiesLoading(bool isCitiesLoading) {
    _isCitiesLoading = isCitiesLoading;
    notifyListeners();
  }

  List<ProvinceApiModel> get provinces => _provinces;
  set provinces(List<ProvinceApiModel> provinces) {
    _provinces = provinces;
    notifyListeners();
  }

  List<CityApiModel> get cities => _cities;
  set cities(List<CityApiModel> cities) {
    _cities = cities;
    notifyListeners();
  }

  ProvinceApiModel get province => _province;
  set province(ProvinceApiModel province) {
    _province = province;
    notifyListeners();
  }

  CityApiModel get city => _city;
  set city(CityApiModel city) {
    _city = city;
    notifyListeners();
  }

  bool get isRequiredAppear => _isRequiredAppear;
  set isRequiredAppear(bool isRequiredAppear) {
    _isRequiredAppear = isRequiredAppear;
    notifyListeners();
  }

  Future<void> getProvinces() async {
    try {
      List<ProvinceApiModel> provinces =
          await RajaOngkirService().getProvince();

      _provinces = provinces;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> getCities() async {
    try {
      List<CityApiModel> cities =
          await RajaOngkirService().getCity(_province.provinceId!);

      _cities = cities;
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void setProvince(String province) {
    for (int i = 0; i < _provinces.length; i++) {
      if (_provinces[i].province == province) {
        _province = _provinces[i];
        break;
      }
    }
  }

  void setCity(String type, String cityName) {
    for (int i = 0; i < _cities.length; i++) {
      if (_cities[i].type == type && _cities[i].cityName == cityName) {
        _city = _cities[i];
        break;
      }
    }
    notifyListeners();
  }

  resetData() {
    _province = ProvinceApiModel();
    _city = CityApiModel();
    _cities.clear();
    notifyListeners();
  }
}
