import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/api/base_url.dart';
import 'package:http/http.dart' as http;

class TransactionStatusService {
  Future<void> updateStatus({
    required String status,
    required int id,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = '${BaseUrl.baseUrl}/transaction-status/$id';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      'status': status,
    });

    var response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('Gagal Get Transactions!');
    }
  }
}
