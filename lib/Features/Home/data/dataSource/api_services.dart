import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmortey/Features/Home/data/model/character_model.dart';

class ApiService {
  static const String baseUrl = 'https://rickandmortyapi.com/api/';

  Future<List<Character>> getCharacters() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/character'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['results'];
        List<Character> characters =
            data.map((json) => Character.fromJson(json)).toList();
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
