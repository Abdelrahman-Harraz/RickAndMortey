import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/data/model/character_model.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;

  const CharacterList({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        var character = characters[index];
        return GestureDetector(
          onTap: () {
            Get.toNamed('/DetailsScreen', arguments: character);
          },
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading1.gif',
                      image: character.image,
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        character.species ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
