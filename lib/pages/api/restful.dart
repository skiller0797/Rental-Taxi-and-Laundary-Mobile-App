import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<String> login(String email, String password, bool rememberMe) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.145.82:3000/api/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'remember_me': rememberMe.toString(),
      }),
    );
    if (response.statusCode == 200) {
      final cookie = response.headers['set-cookie'];
      const FlutterSecureStorage secureStorage = FlutterSecureStorage();

      if (rememberMe) {
        await secureStorage.write(key: 'cookie', value: cookie);
        await secureStorage.write(key: 'email', value: email);
        await secureStorage.write(key: 'password', value: password);
        await secureStorage.write(key: 'rememberMe', value: 'true');
      } else {
        await secureStorage.deleteAll();
      }
      var data = jsonDecode(response.body.toString());
      return data['message'];
    } else {
      // Error handling
      // throw Exception('Connection failed');
      return 'connectionFailed';
    }
  } catch (e) {
    return 'Unknow error';
  }
}

Future<String> signup(String fullname, String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.145.82:3000/api/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fullname': fullname,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return data['message'];
    } else {
      // Error handling
      // throw Exception('Connection failed');
      return 'connectionFailed';
    }
  } catch (e) {
    return 'connectionFailed';
  }
}

Future<String> logout() async {
  try {
    final response = await http.get(
        Uri.parse('http://192.168.145.82:3000/api/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode == 200) {
      return 'loggedout';
    } else {
      return 'connectionFailed';
    }
  } catch (e) {
    return 'connectionFailed';
  }
}
