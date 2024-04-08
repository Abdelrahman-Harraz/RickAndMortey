import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/controller/character_controller.dart';
import 'package:rickandmortey/Features/Home/view/widgets/character_list_widget.dart';
import 'package:rickandmortey/Features/Home/view/widgets/character_search_widget.dart';

class HomeScreen extends StatelessWidget {
  final CharacterController characterController =
      Get.put(CharacterController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CharacterSearchDelegate());
            },
          ),
        ],
      ),
      body: GetBuilder<CharacterController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return CharacterList(
              characters: controller.characters,
            );
          }
        },
      ),
    );
  }
}
