import 'package:bioeduca/about.dart';
//import 'package:bioeduca/test.dart';
import 'package:bioeduca/topics.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BioEDuca',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/topics': (context) => const Topics(),
        '/about': (context) => const About(),
        //'/test': (context) => const Test(),
      },
    );
  }
}