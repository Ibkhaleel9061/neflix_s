import 'package:flutter/material.dart';
import 'package:neflix_s/presentaion/widgets/MainCard.dart';
import 'package:neflix_s/presentaion/widgets/MainTitil.dart';

import '../../core/colors/Colors.dart';

// Home page List widget code

class MainTitileCart extends StatelessWidget {
  const MainTitileCart({
    super.key,
    required this.title,
    required this.posterList,
  });

  final String title;
  final List<String?> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Maintitile(title: title),
        kheigh,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              19,
              (index) => mainCard(
                imageUrl: posterList[index]!,
              ),
            ),
          ),
        )
      ],
    );
  }
}
