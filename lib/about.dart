import 'package:flutter/material.dart';
import 'design_static.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Design(
      title: 'SOBRE',
      content: const Center(
        child: Text(
          'Conteúdo SOBRE',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}