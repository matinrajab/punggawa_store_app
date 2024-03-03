import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/shared/api_url.dart';

class AddressService {
  late SharedPreferences prefs;

  Future<List<AddressModel>> getAddresses() async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var url = getAddressesUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<AddressModel> addresses = [];
      data
          .map((transaction) =>
              addresses.add(AddressModel.fromJson(transaction)))
          .toList();

      return addresses;
    } else {
      throw Exception('Gagal Get Addresses!');
    }
  }

  storeAddress({required AddressModel address}) async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var url = storeAddressUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      'province_name': address.province!.name,
      'province_id': address.province!.idFromApi,
      'city_name': address.city!.name,
      'city_id': address.city!.idFromApi,
      'district_name': address.district!.name,
      'district_id': address.district!.idFromApi,
      'postal_code_name': address.postalCode!.name,
      'postal_code_id': address.postalCode!.idFromApi,
      'address_category_id': address.addressCategory!.id,
      'name': address.name,
      'phone': address.phone,
      'detail': address.detail,
      'additional': address.additional,
    });

    print('mau post');

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print('sudah post');

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Gagal menambahkan address');
    }
  }
}
