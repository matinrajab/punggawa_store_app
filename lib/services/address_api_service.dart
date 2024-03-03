import 'dart:convert';
import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/models/address_api_model.dart';
import 'package:http/http.dart' as http;

class AddressApiService {
  Future<List<AddressApiModel>> getAddress(String apiUrl) async {
    String url = '${Config.addressApiUrl}/$apiUrl';

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)['result'];
      List<AddressApiModel> regions = [];
      result.map((e) => regions.add(AddressApiModel.fromJson(e))).toList();

      return regions;
    }
    throw Exception('Gagal Get Address!');
  }
}
