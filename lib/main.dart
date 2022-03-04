import 'package:dartt_giphy/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giphy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
