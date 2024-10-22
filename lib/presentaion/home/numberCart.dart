import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/widgets/MainTitil.dart';

// Home page this code "Top 10 Tv show in india Tosay" that widget

class TOPnumbercaed extends StatelessWidget {
  const TOPnumbercaed({
    super.key,
    required this.posterList,
    required this.title,
  });

  final List<String> posterList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Maintitile(title: "Top 10 Tv show in india Today"),
        kheigh,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => Numbercart(
                index: index,
                imageUrl: posterList[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Home page "Top Tv show " widget  number loop
class Numbercart extends StatelessWidget {
  const Numbercart({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: kRadius,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(imageUrl))),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kwhitecolor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 130,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
