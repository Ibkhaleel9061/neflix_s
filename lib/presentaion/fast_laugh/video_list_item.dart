import 'package:flutter/material.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/fast_laugh/fast_lanugh_vido_playerState.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

import '../../core/strings.dart';
import '../../domain/downloads/models/downloads.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

// Fast page video widget page buttuns code
class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(children: [
      FastLaughVidoPlayer(
        videoUrl: videoUrl,
        onStateChanged: (bool) {},
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              IconButton(onPressed: () {}, icon: Icon(Icons.volume_down)),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage(
                              '$imageAppendUrl$posterPath'), // reel profile url
                    ),
                  ),
                  ValueListenableBuilder(
                      valueListenable: likedVideosIdNotifier,
                      builder: (BuildContext c, Set<int> newLikedListIds,
                          Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdNotifier.value.remove(_index);
                              likedVideosIdNotifier.notifyListeners();
                            },
                            child: const VideoActionsWidget(
                              icon: Icons.favorite,
                              title: "Iike",
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdNotifier.value.add(_index);
                            likedVideosIdNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.favorite_outline,
                            title: "Iiked",
                          ),
                        );
                      }),
                  const VideoActionsWidget(
                    icon: Icons.add,
                    title: "My List",
                  ),
                  GestureDetector(
                    onTap: () {
                      //Share.share(videoUrl);
                    },
                    child: const VideoActionsWidget(
                      icon: Icons.share,
                      title: "Share",
                    ),
                  ),
                  const VideoActionsWidget(
                    icon: Icons.play_arrow,
                    title: "Play",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

//Fast video play & pose widget
class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kwhitecolor,
            size: 40,
          ),
          Text(
            title,
            style: TextStyle(color: kwhitecolor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
