import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/home/backgroudCart.dart';
import 'package:neflix_s/presentaion/home/numberCart.dart';
import 'package:neflix_s/presentaion/widgets/MainTitileCart.dart';

import '../../application/home/home_bloc.dart';
import '../../core/strings.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false; // Scrolling down
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true; // Scrolling up
                      // Add more widgets here
                    }

                    // Returning true to stop the notification from propagating further
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<HomeBloc>(context)
                          .add(const GetHomeScreenData());
                    },
                    child: Stack(
                      children: [
                        BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );
                          } else if (state.hasError) {
                            return const Center(
                                child: Text(
                              "error while getting data",
                              style: TextStyle(color: kwhitecolor),
                            ));
                          }
                          // released past year
                          final _releasedPastYear =
                              state.pastYearMovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          // get id pase year
                          final _releasedPastYearId =
                              state.pastYearMovieList.map((m) {
                            return m.id;
                          }).toList();
                          // _releasedPastYearId.shuffle();
                          // trending
                          final _trending = state.trendingMovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          _trending.shuffle();
                          // get id trendimg
                          final _trendingId = state.trendingMovieList.map((m) {
                            return m.id;
                          }).toList();
                          _trendingId.shuffle();
                          //  trendse drama
                          final _trendse = state.tenseDramaMovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          _trendse.shuffle();
                          // get id trendse
                          final _trendsId = state.tenseDramaMovieList.map((m) {
                            return m.id;
                          }).toList();
                          // south indian movie
                          final _southIndia =
                              state.southIndianMovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          // get id pase year
                          final _southIndiaId =
                              state.southIndianMovieList.map((m) {
                            return m.id;
                          }).toList();
                          // tv shows
                          final _top10tvShows = state.trendingTvList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          // get id pase year
                          final _top10tvShowsId = state.trendingTvList.map((m) {
                            return m.id;
                          }).toList();
                          //print(state.trendingMovieList.length);
                          return ListView(
                            children: [
                              BackgroudCard(
                                posterList: _trendse,
                              ),
                              kheigh,
                              MainTitileCart(
                                //id: _releasedPastYearId,
                                title: "Released in the past year",
                                posterList: _releasedPastYear,
                              ),
                              kheigh,
                              MainTitileCart(
                                //id: _trendingId,
                                title: "Trending Now",
                                posterList: _trending,
                              ),
                              kheigh,
                              TOPnumbercaed(
                                posterList: _top10tvShows,
                                title: 'Top 10 TV show in india today',
                              ),
                              kheigh,
                              MainTitileCart(
                                //id: _trendsId,
                                title: " Tende Drames",
                                posterList: _trendse,
                              ),
                              kheigh,
                              MainTitileCart(
                                //id: _southIndiaId,
                                title: "South Indian Cinema",
                                posterList: _southIndia,
                              ),
                              kheigh,
                            ],
                          );
                        }),
                        scrollNotifier.value == true
                            ? AnimatedContainer(
                                duration: Duration(milliseconds: 1000),
                                width: double.infinity,
                                height: 80,
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        // app bar icone image
                                        Image.network(
                                          'https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png',
                                          width: 60,
                                          height: 60,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        kwidth,
                                        Container(
                                          width: 30,
                                          height: 30,
                                          color: Colors.blue,
                                        ),
                                        kwidth
                                      ],
                                    ),
                                    const Row(
                                      // main widget image under buttons
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'TV Show',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          'Movie',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          'Categories',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : kheigh,
                      ],
                    ),
                  ));
            }));
  }
}
