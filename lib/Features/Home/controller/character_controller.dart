import 'dart:convert';

import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/data/dataSource/api_services.dart';
import 'package:rickandmortey/Features/Home/data/model/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterController extends GetxController {
  final characters = <Character>[].obs;
  final isLoading = false.obs;
  final ApiService _apiService = ApiService();

  static const String _cacheKey = 'cachedCharacters';

  @override
  void onReady() {
    super.onReady();
    fetchCharacters();
  }

  void fetchCharacters() async {
    try {
      isLoading(true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final cachedCharactersJson = prefs.getString(_cacheKey);

      if (cachedCharactersJson != null) {
        final List<Character> cachedCharacters =
            (json.decode(cachedCharactersJson) as List<dynamic>)
                .map((json) => Character.fromJson(json))
                .toList();
        characters.assignAll(cachedCharacters);
      }

      var fetchedCharacters = await _apiService.getCharacters();
      characters.assignAll(fetchedCharacters);

      prefs.setString(_cacheKey, json.encode(characters.toList()));
    } catch (e) {
      print('Error fetching characters: $e');
    } finally {
      isLoading(false);
    }
    update();
  }
}
