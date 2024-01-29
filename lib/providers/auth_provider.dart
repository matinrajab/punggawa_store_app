import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  bool _isLoading = false;

  UserModel get user => _user;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading){
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> fetch() async {
    try {
      UserModel user = await AuthService().fetch();

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

}
