import 'dart:convert';

import 'package:flutter/material.dart';
import '../model/detail.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// launchUrl(Uri.parse(gameList[widget.index].linkStore));

class DetailPage extends StatelessWidget {
  final meal;
  const DetailPage({super.key, required this.meal});

  Future<MealDetail> fetchDetail() async {
    final String _baseUrl =
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$meal";
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return MealDetail.fromJson(data['meals'][0]);
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Detail'), elevation: 0),
      body: FutureBuilder<MealDetail>(
        future: fetchDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError)
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          if (!snapshot.hasData)
            return const Center(child: Text("Error Loading Data"));

          final meal = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    meal.strMealThumb,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(Icons.fastfood, size: 50),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text(
                    meal.strMeal,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.category, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 5),
                        Text(
                          "Category: ${meal.strCategory}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Icon(Icons.place, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 5),
                        Text(
                          "Area: ${meal.strArea}",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(height: 30, thickness: 1),

                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: meal.ingredients
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            "- $e",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const Divider(height: 30, thickness: 1),

                const Text(
                  "Instructions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  meal.strInstructions,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.grey[800],
                  ),
                ),

                const SizedBox(height: 20),

                if (meal.strYoutube.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        launchUrl(Uri.parse(meal.strYoutube));
                      },
                      icon: const Icon(Icons.play_circle_fill),
                      label: const Text("Watch Tutorial"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
