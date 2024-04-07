import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shoe_store_app/shared/api_url.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  late SharedPreferences prefs;

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    prefs = await SharedPreferences.getInstance();
    var url = registerUrl;
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
    prefs = await SharedPreferences.getInstance();
    var url = loginUrl;
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

  Future<GoogleSignInAccount> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account != null) {
      final GoogleSignInAuthentication auth = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
        accessToken: auth.accessToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      googleSignIn.signOut();

      return account;
    } else {
      throw Exception('Continue with Google Failed');
    }
  }

  Future<UserModel> updateProfile({
    String? key,
    String? value,
    String? token,
  }) async {
    var url = updateProfileUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      '$key': value,
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
      user.token = token;

      return user;
    } else {
      throw Exception('Update Profile Failed');
    }
  }

  Future<List<UserModel>> getUsers() async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = getUsersUrl;
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
      List<UserModel> users = [];
      data.map((user) => users.add(UserModel.fromJson(user))).toList();

      return users;
    } else {
      throw Exception('Get Users Failed');
    }
  }

  Future<UserModel> fetch() async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = fetchUserUrl;
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
      UserModel user = UserModel.fromJson(data);
      user.token = token;

      return user;
    } else {
      throw Exception('Fetch User Failed');
    }
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = logoutUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      await prefs.remove('token');
    } else {
      throw Exception('Logout Failed');
    }
  }
}
