import 'dart:convert';
import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:http/http.dart' as http;

class RegionApiService {
  Future<List<RegionApiModel>> getAddress(String apiUrl) async {
    String url = '${Config.addressApiUrl}/$apiUrl';

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)['result'];
      List<RegionApiModel> regions = [];
      result.map((e) => regions.add(RegionApiModel.fromJson(e))).toList();

      return regions;
    }
    throw Exception('Gagal Get Address!');
  }
}
