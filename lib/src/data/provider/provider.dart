import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Login
/// curl --location --request POST 'https://indiedu-api.herokuapp.com/api/login' \
/// --data-urlencode 'email=yazki.maulana@gmail.com' \
/// --data-urlencode 'password=12345678'

/// Register
/// curl --location --request POST 'https://indiedu-api.herokuapp.com/api/register' \
/// --header 'Accept: application/json' \
/// --data-urlencode 'email=yazki.maulana@gmail.com' \
/// --data-urlencode 'password=12345678' \
/// --data-urlencode 'name=Yazky'

/// Logout
/// curl --location --request POST 'https://indiedu-api.herokuapp.com/api/logout' \
// --header 'Authorization;' \
// --form '=""'

class UserModel {
  String? name;
  String? email;
  String? password;
  String? token;

  UserModel({
    this.email,
    this.password,
    this.token,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        token = json['token'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'token': token,
        'name': name,
      };
}

// ------------------------------------------------------------

class UserService {
  final String baseUrl = 'https://indiedu-api.herokuapp.com/api/';
  final String loginUrl = 'login';
  final String registerUrl = 'register';
  final String logoutUrl = 'logout';

  // SharedPreferences _prefs;
  saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  /// Login
  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    /// Login Request
    final header = {'Content-Type': 'application/json'};
    final body = json.encode({'email': email, 'password': password});
    final response = await http.post(
      Uri.parse('$baseUrl$loginUrl'),
      body: body,
      headers: header,
    );

    /// Login Response
    print(response.statusCode);
    if (response.statusCode == 200) {
      // return UserModel.fromJson(json.decode(response.body));
      final data = json.decode(response.body);
      UserModel user = UserModel.fromJson(data);
      // user.token = 'Bearer ' + data['token'];
      user.token = data['token'];
      print('token : ' + user.token.toString());
      await saveToken(user.token.toString());

      return user;
    } else {
      throw Exception('Failed to login');
    }
  }

  /// Register
  Future<UserModel?> register({
    String? name,
    String? email,
    String? password,
  }) async {
    // Register Request
    final header = {'Content-Type': 'application/json'};
    final body = json.encode({
      'name': name,
      'email': email,
      'password': password,
    });
    final response = await http.post(
      Uri.parse('$baseUrl$registerUrl'),
      body: body,
      headers: header,
    );

    /// Register Response
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      UserModel user = UserModel.fromJson(data);
      // user.token = 'Bearer ' + data['token'];
      user.token = data['token'];
      print(user.token);
      // await saveToken(user.token.toString());
      return user;
    } else {
      throw Exception('Failed to register');
    }
  }

  /// Logout
  Future<UserModel?> logout(String token) async {
    // Register Request
    final header = {'Content-Type': 'application/json', 'Authorization': token};

    // Register Response
    final response = await http.post(
      Uri.parse('$baseUrl$logoutUrl'),
      headers: header,
    );
  }
}

// ------------------------------------------------------------

/// Provider
class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? token = UserModel();

  UserModel? get user => _user;
  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  /// Login - provider
  Future<bool> login(String email, String password) async {
    try {
      UserModel? user = await UserService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return false;
    }
  }

  /// Register - provider
  Future<bool> register(String name, String email, String password) async {
    try {
      UserModel? user = await UserService().register(
        name: name,
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return false;
    }
  }

  // Logout - provider
  Future<bool> logout(String token) async {
    try {
      UserModel? user = await UserService().logout(token);
      _user = user;
      return true;
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
      return false;
    }
  }

  // Splash (check token) - provider
  Future<bool> checkToken() async {
    final result = await UserService.getToken();
    token!.token = result;
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  // Logout (remove token) - provider
  Future<bool> removeToken() async {
    final result = await UserService().removeToken();
    return result;
  }
}
