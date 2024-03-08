import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/shared/api_url.dart';

class TopUpService{
  late SharedPreferences prefs;

  Future<String> topUp({
    required int amount,
  }) async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = topUpUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      'amount': amount,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      String snapToken = data['snapToken'];

      return snapToken;
    } else {
      throw Exception('Gagal TopUp');
    }
  }

}