import 'package:flutter/material.dart';

//buttons widget code
class custmButtonWidget extends StatelessWidget {
  const custmButtonWidget(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 25,
      this.textSize = 18,
      this.letterSpacingtext = 0})
      : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final double letterSpacingtext;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
