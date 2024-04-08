import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortey/Features/Home/data/model/character_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Character character = Get.arguments as Character;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  character.image,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildDetailItem('Name', character.name),
            _buildDetailItem('Status', character.status),
            _buildDetailItem('Species', character.species),
            _buildDetailItem('Gender', character.gender),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
