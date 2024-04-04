import 'dart:convert';

import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/models/city_api_model.dart';
import 'package:shoe_store_app/models/province_api_model.dart';
import 'package:shoe_store_app/shared/api_url.dart';
import 'package:http/http.dart' as http;

class RajaOngkirService {
  Future<List<ProvinceApiModel>> getProvince() async {
    String url = getProvinceUrl;
    var headers = {'key': Config.rajaOngkirApiKey};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body)['rajaongkir']['results'];
      List<ProvinceApiModel> provinces = [];
      results.map((e) => provinces.add(ProvinceApiModel.fromJson(e))).toList();

      return provinces;
    }
    throw Exception('Gagal Get Province!');
  }

  Future<List<CityApiModel>> getCity(String provinceId) async {
    String url = getCityUrl;
    var headers = {'key': Config.rajaOngkirApiKey};

    var response = await http.get(
      Uri.parse("$url?province=$provinceId"),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body)['rajaongkir']['results'];
      List<CityApiModel> cities = [];
      results.map((e) => cities.add(CityApiModel.fromJson(e))).toList();

      return cities;
    }
    throw Exception('Gagal Get City!');
  }

  Future<int> getShippingPrice({
    required String destinationId,
    required int totalItems,
  }) async {
    String url = costUrl;
    var body = {
      'key': Config.rajaOngkirApiKey,
      'origin': '444',
      'destination': destinationId,
      'weight': '${700 * totalItems}',
      'courier': 'jne',
    };

    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body)['rajaongkir']['results'][0];
      int cost = results['costs'][0]['cost'][0]['value'];

      return cost;
    }
    throw Exception('Gagal Get Cost!');
  }
}
