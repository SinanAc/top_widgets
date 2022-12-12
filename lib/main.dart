import 'package:flutter/material.dart';
import 'package:top_widgets/widgets/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstWidget(),
    );
  }
}
