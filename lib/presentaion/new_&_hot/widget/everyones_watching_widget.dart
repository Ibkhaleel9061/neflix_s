import 'package:flutter/material.dart';
import 'package:neflix_s/presentaion/home/CustomButtonWidget.dart';

import '../../../core/colors/colors.dart';

import '../../widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String decription;
  const EveryOnesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.decription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheigh,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              movieName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          kheigh,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(decription,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          kheigh20,
          VideoWidget(
            imageUrl: posterPath,
          ),
          kheigh20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              custmButtonWidget(
                icon: Icons.share,
                title: "share",
                iconSize: 35,
                textSize: 16,
                letterSpacingtext: 0,
              ),
              kwidth,
              custmButtonWidget(
                icon: Icons.add,
                title: "My List",
                iconSize: 35,
                textSize: 16,
                letterSpacingtext: 0,
              ),
              kwidth,
              custmButtonWidget(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 35,
                textSize: 16,
                letterSpacingtext: 0,
              ),
              kwidth
            ],
          )
        ],
      ),
    );
  }
}
