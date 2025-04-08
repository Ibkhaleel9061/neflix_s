import 'package:flutter/material.dart';

// Search page top search Title name  widget
class Screechtexttitle extends StatelessWidget {
  final String title;
  const Screechtexttitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
    );
  }
}
