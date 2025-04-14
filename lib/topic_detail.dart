import 'package:flutter/material.dart';

class TopicDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const TopicDetail({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF504538),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF1F8E9),
    );
  }
}
