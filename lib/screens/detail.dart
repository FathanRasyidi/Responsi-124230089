import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final category;

  const DetailPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Detail'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
    //   body: SingleChildScrollView(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Center(
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(16),
    //             child: Image.network(
    //               amiibo.image,
    //               height: 200,
    //               width: 200,
    //               fit: BoxFit.cover,
    //               errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported, size: 100),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           amiibo.name.isNotEmpty ? amiibo.name : amiibo.character,
    //           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //         ),
    //         const SizedBox(height: 10),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text('Character:', style: const TextStyle(fontSize: 16)),
    //             Text('${amiibo.character}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //           const Text('Game Series:', style: TextStyle(fontSize: 16)),
    //           Text('${amiibo.gameSeries}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),
    //         const SizedBox(height: 8),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //           const Text('Amiibo Series:', style: TextStyle(fontSize: 16)),
    //           Text('${amiibo.amiiboSeries}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),
    //         const SizedBox(height: 8),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //           const Text('Type:', style: TextStyle(fontSize: 16)),
    //           Text('${amiibo.type}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),
    //         const SizedBox(height: 8),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //           const Text('Head:', style: TextStyle(fontSize: 16)),
    //           Text('${amiibo.head}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),
    //         const SizedBox(height: 8),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //           const Text('Tail:', style: TextStyle(fontSize: 16)),
    //           Text('${amiibo.tail}', style: const TextStyle(fontSize: 16)),
    //           ],
    //         ),

    //         const SizedBox(height: 12),
    //         const Divider(),
    //         const SizedBox(height: 8),
    //         const Text('Release Dates', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    //         const SizedBox(height: 8),


    //         const SizedBox(height: 20),
    //       ],
    //     ),
    //   ),
    );
  }
}