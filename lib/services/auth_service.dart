import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/api/base_url.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = '${BaseUrl.baseUrl}/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      await prefs.setString('token', user.token!);

      return user;
    } else {
      throw Exception('Register Failed');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = '${BaseUrl.baseUrl}/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      await prefs.setString('token', user.token!);

      return user;
    } else {
      throw Exception('Login Failed');
    }
  }

  Future<UserModel> fetch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = '${BaseUrl.baseUrl}/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization' : token!,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = token;

      return user;
    } else {
      throw Exception('Fetch User Failed');
    }
  }
}
