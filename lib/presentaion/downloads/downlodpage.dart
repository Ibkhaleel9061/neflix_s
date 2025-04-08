import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/downloads/downloads_bloc.dart';
import '../../core/colors/Colors.dart';
import '../../core/strings.dart';
import '../widgets/AppBarWidgets.dart';

// Downlode page main widget
class Downlodpage extends StatelessWidget {
  Downlodpage({super.key});

  final _WidgetList = [
    const _smartDowlouds(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Appbarwidgets(
              title: 'Downlod',
            )),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _WidgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(height: 20),
            itemCount: _WidgetList.length));
  }
}

class _smartDowlouds extends StatelessWidget {
  const _smartDowlouds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        SizedBox(height: 66),
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        kwidth,
        Text('Smart Downloads', style: TextStyle(fontSize: 29))
      ],
    );
  }
}

// image  circke  section code

//  paragrfs widget
class Section2 extends StatelessWidget {
  Section2({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DownloadsBloc>(context).add(
      const DownloadsEvent.getDownloadsImage(),
    );
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introduction download for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
        kheigh,
        const Text(
          'Well download a personalised selection of\nmovies and shows for you, so theres\nalways something to watch on your\ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 21),
        ),
        kheigh,
        //*********************** */
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // print(state.downloads![0].posterPath);
            if (state.downloads.isEmpty || state.downloads.length < 3) {
              return const Center(
                child: Text(
                  'Loading....',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            //  download page circle  widget
            return SizedBox(
              //  circle widget image cerve for diger
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        radius: size.width * 0.4,
                        backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                      ),
                      /********************************************************************************************* */
                      DownlodImagewidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[0].posterPath}', //https://image.tmdb.org/t/p/w500/
                        margin: EdgeInsets.only(left: 130, bottom: 50),
                        angle: 20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                        radius: 20,
                      ),
                      DownlodImagewidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[1].posterPath}',
                        margin: EdgeInsets.only(right: 130, bottom: 50),
                        angle: -20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                        radius: 20,
                      ),
                      DownlodImagewidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[2].posterPath}',
                        radius: 30,
                        margin: EdgeInsets.only(bottom: 8),
                        angle: 1,
                        size: Size(size.width * 0.5, size.width * 0.65),
                      ),
                    ]),
            );
          },
        ),

        kheigh,
      ],
    );
  }
}

//section 3 buttons widget

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheigh,
        SizedBox(
          width: 350,
          child: MaterialButton(
            color: kbuttoncolorblue,
            onPressed: () {
              //
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: kwhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheigh,
        MaterialButton(
          color: kwhitecolor,
          onPressed: () {
            //
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: const Text(
              'See what you can downlod',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

//  download page circle image widget
/// A widget that displays an image in a rotated position with rounded corners.

class DownlodImagewidget extends StatelessWidget {
  const DownlodImagewidget({
    Key? key,
    required this.size,
    required this.imageList,
    required this.margin,
    this.radius = 10,
    this.angle = 0,
  }) : super(key: key);

  final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                  image: NetworkImage(
                imageList,
              ))),
        ),
      ),
    );
  }
}
