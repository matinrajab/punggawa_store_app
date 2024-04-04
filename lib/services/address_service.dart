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
      var data = jsonDecode(response.body)['data'];
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
      'province': address.province!.name,
      'province_id': address.province!.provinceId,
      'city_type_id': address.city!.cityType!.id,
      'city_name': address.city!.name,
      'city_id': address.city!.cityId,
      'address_category_id': address.addressCategory!.id,
      'name': address.name,
      'phone': address.phone,
      'detail': address.detail,
      'additional': address.additional,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Gagal menambahkan address');
    }
  }

  updateAddress({required AddressModel address}) async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var url = '$updateAddressUrl/${address.id}';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      'province': address.province!.name,
      'province_id': address.province!.provinceId,
      'city_type_id': address.city!.cityType!.id,
      'city_name': address.city!.name,
      'city_id': address.city!.cityId,
      'address_category_id': address.addressCategory!.id,
      'name': address.name,
      'phone': address.phone,
      'detail': address.detail,
      'additional': address.additional,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Gagal mengedit address');
    }
  }

  deleteAddress({required int id}) async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    var url = '$deleteAddressUrl/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus address');
    }
  }
}
