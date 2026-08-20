import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: color),
    );
  }
}
