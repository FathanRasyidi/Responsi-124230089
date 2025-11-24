import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsi/model/categories.dart';
import 'package:http/http.dart' as http;
import 'package:responsi/screens/detail.dart';
import 'package:responsi/screens/meals.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  Future<List<MealsCategory>> fetchCategory() async {
    final String _baseUrl = "https://www.themealdb.com/api/json/v1/1/categories.php";
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> kategori = jsonResponse['categories'];
        return kategori.map((item) => MealsCategory.fromJson(item)).toList();
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
      appBar: AppBar(
        title: Center(child: Text("Meals Category"),),
      ),
      body: FutureBuilder<List<MealsCategory>>(
        future: fetchCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final categories = snapshot.data ?? [];
          if (categories.isEmpty) {
            return const Center(child: Text('No categories found.'));
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealsPage(category : cat.category)));
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            cat.image,
                            fit: BoxFit.fitHeight,
                            height: 150,
                          ),
                        ),
                        Center(
                          child: Text(
                            cat.category,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            cat.desc,

                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  
}