import 'dart:convert';
import 'dart:developer';
import 'package:belajar_ppkd/day33/constant/endpoint.dart';
import 'package:belajar_ppkd/day33/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthAPILogin {
  static Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);

    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {
        "email": email,
        "password": password,
      },
    );

    log("LOGIN STATUS: ${response.statusCode}");
    log("LOGIN RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Login gagal");
    }
  }
}
