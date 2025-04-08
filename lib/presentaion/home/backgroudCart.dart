import 'package:flutter/material.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/home/CustomButtonWidget.dart';

//Home page main image code and buttons
class BackgroudCard extends StatelessWidget {
  const BackgroudCard({
    super.key,
    required this.posterList,
  });
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterList[0]),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const custmButtonWidget(
                  title: 'my List',
                  icon: Icons.add,
                ),
                palyButton(),
                custmButtonWidget(
                  title: 'Info',
                  icon: Icons.info,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

// Home page Main image widget playbutton
class palyButton extends StatelessWidget {
  const palyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kwhitecolor),
        ),
        icon: Icon(
          Icons.play_arrow,
          size: 25,
          color: Colors.black,
        ),
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'play',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ));
  }
}
