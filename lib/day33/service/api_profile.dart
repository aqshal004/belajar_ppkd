import 'dart:convert';
import 'dart:developer';
import 'package:belajar_ppkd/day33/constant/endpoint.dart';
import 'package:belajar_ppkd/day33/models/edit_profile.dart';
import 'package:belajar_ppkd/day33/models/profile.dart';
import 'package:belajar_ppkd/preferences/preferences_handler.dart';
import 'package:http/http.dart' as http;

class ProfileAPI {
  // Mendapatkan data profile user
  static Future<ProfileModel> getProfile() async {
    final url = Uri.parse(Endpoint.profile); // Tambahkan endpoint profile di constant
    
    // Ambil token dari storage (shared preferences / secure storage)
    final token = await PreferenceHandler.getToken(); // Implement fungsi ini sesuai cara Anda menyimpan token
    
    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    log("GET PROFILE STATUS: ${response.statusCode}");
    log("GET PROFILE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Gagal mengambil data profile");
    }
  }

  // Update profile user
  static Future<EditProfileModel> updateProfile({
    required String name,
    // required String email,
  }) async {
    final url = Uri.parse(Endpoint.updateProfile); // Tambahkan endpoint update profile
    
    // Ambil token dari storage
    final token = await PreferenceHandler.getToken();
    
    final response = await http.put( // atau http.post tergantung API backend
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: {
        "name": name,
        // "email": email,
      },
    );

    log("UPDATE PROFILE STATUS: ${response.statusCode}");
    log("UPDATE PROFILE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      return EditProfileModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Gagal memperbarui profile");
    }
  }

  // Helper function untuk mengambil token
  // Sesuaikan dengan cara Anda menyimpan token (SharedPreferences, FlutterSecureStorage, dll)
  static Future<String> _getToken() async {
    // Contoh menggunakan SharedPreferences:
    // final prefs = await SharedPreferences.getInstance();
    // return prefs.getString('auth_token') ?? '';
    
    // Atau menggunakan FlutterSecureStorage:
    // final storage = FlutterSecureStorage();
    // return await storage.read(key: 'auth_token') ?? '';
    
    // Sementara return hardcode untuk testing
    return 'YOUR_AUTH_TOKEN_HERE';
  }
}