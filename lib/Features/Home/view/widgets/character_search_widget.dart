import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/controller/character_controller.dart';
import 'package:rickandmortey/Features/Home/view/widgets/character_list_widget.dart';
import 'package:rickandmortey/Features/Home/data/model/character_model.dart';

class CharacterSearchDelegate extends SearchDelegate<String> {
  final CharacterController characterController = Get.find();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Character> suggestionList = query.isEmpty
        ? characterController.characters
        : characterController.characters
            .where((character) =>
                character.name!.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return CharacterList(characters: suggestionList);
  }
}
