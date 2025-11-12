import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:belajar_ppkd/day32/models/rickmorty_model.dart';

Future<List<Result>> fetchRickMorty() async {
  final response = await http.get(
    Uri.parse("https://rickandmortyapi.com/api/character"),

  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> characterJson = json.decode(response.body)["results"];
    return characterJson.map((json) => Result.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load Rick and Morty characters");
  }
}
