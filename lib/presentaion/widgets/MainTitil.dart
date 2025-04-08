import 'package:flutter/material.dart';

//Home page widget titile Names

class Maintitile extends StatelessWidget {
  const Maintitile({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
