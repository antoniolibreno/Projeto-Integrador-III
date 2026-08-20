import 'package:flutter/material.dart';


class TheoPage extends StatefulWidget {
  const TheoPage({super.key});

  @override
  State<TheoPage> createState() => _TheoPageState();
}

class _TheoPageState extends State<TheoPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        'assets/imgs/theo.jfif',
        fit: BoxFit.cover,
      ),
    );
  }
}