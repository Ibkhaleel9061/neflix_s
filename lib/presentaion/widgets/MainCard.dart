import 'package:flutter/material.dart';

import '../../core/colors/Colors.dart';

//  image list view widget  code

class mainCard extends StatelessWidget {
  final String imageUrl;
  const mainCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
          )),
      //borderRadius: BorderRadius.circular(7),
      //fit: BoxFit.cover,
    );
  }
}
