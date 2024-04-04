import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:shoe_store_app/services/auth_service.dart';
import 'package:shoe_store_app/shared/random_string_generator.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  String _passwordTemp = '';
  bool _isLoading = false;
  bool _isGoogleLoading = false;

  UserModel get user => _user;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  String get passwordTemp => _passwordTemp;
  set passwordTemp(String passwordTemp) {
    _passwordTemp = passwordTemp;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isGoogleLoading => _isGoogleLoading;
  set isGoogleLoading(bool isGoogleLoading) {
    _isGoogleLoading = isGoogleLoading;
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

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount account = await AuthService().signInWithGoogle();
      String email = account.email;
      String random = RandomStringGenerator().getRandomString(5);

      _user = UserModel(
        name: account.displayName,
        username: '${email.substring(0, email.indexOf('@'))}_$random',
        email: email,
      );
      _passwordTemp = account.id;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateProfile({
    String? key,
    String? value,
  }) async {
    try {
      UserModel user = await AuthService().updateProfile(
        key: key,
        value: value,
        token: _user.token,
      );

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> fetch() async {
    try {
      UserModel user = await AuthService().fetch();

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await AuthService().logout();
      return true;
    } catch (e) {
      return false;
    }
  }
}
