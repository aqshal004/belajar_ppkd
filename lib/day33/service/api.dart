import 'dart:convert';
import 'dart:developer';
import 'package:belajar_ppkd/day33/constant/endpoint.dart';
import 'package:belajar_ppkd/day33/models/register_model.dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<RegisterUserModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}