import 'package:flutter/material.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/home/CustomButtonWidget.dart';

import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String decription;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.decription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                day,
                style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                imageUrl: posterPath,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            letterSpacing: -3,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // const Spacer(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          custmButtonWidget(
                            icon: Icons.notifications,
                            title: "Remind me",
                            iconSize: 20,
                            textSize: 12,
                            letterSpacingtext: 0,
                          ),
                          kwidth,
                          custmButtonWidget(
                            icon: Icons.info,
                            title: "Info",
                            iconSize: 20,
                            textSize: 12,
                          ),
                          kwidth
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kheigh,
              const Text("coming on day month"),
              kheigh,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheigh,
              Text(decription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 15))
            ],
          ),
        ),
      ],
    );
  }
}
