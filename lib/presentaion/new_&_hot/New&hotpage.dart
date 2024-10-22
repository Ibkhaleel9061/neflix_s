import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:neflix_s/core/colors/Colors.dart';

import '../../application/NewAndHot/new_and_hot_bloc.dart';

import '../../core/strings.dart';
import 'widget/coming_soon_widget.dart';
import 'widget/everyones_watching_widget.dart';

// New & Hot page main widget code
class NewAndHotPage extends StatelessWidget {
  const NewAndHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Adjust preferred height
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            actions: [
              //
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 15),
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              const SizedBox(width: 15),
            ],
            // chage page coming soon and every wachingf
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: kwhitecolor,
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kwhitecolor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              tabs: [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: '👀 Everyone Watching',
                ),
              ],
            ),
          ),
        ),
        body: const SafeArea(
          child: TabBarView(children: [
            ComingSoonWidgetList(
              key: Key('coming_soon'),
            ),
            EveryOnesWatchingWidgetList(
              key: Key('everyons_watching'),
            )
          ]),
        ),
      ),
    );
  }
}

// Coming Soon Widge tList
class ComingSoonWidgetList extends StatelessWidget {
  const ComingSoonWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    //Refresh indicater
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
                "error while loading coming soon list",
              ),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text(
                "while loading coming soon is empty",
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemBuilder: (BuildContext context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String day = '';
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final foramteDate = DateFormat.yMMMMd('en_US').format(_date!);
                  month = foramteDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  day = movie.releaseDate!.split('-')[1];
                } catch (e) {
                  log(e.toString());
                  month = '';
                  day = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: day,
                  posterPath: '$imageAppendUrl${movie.posterPath}',
                  movieName: movie.originalTitle ?? 'No title',
                  decription: movie.overview ?? 'no decription',
                );
              },
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}

//Every Ones Watching Widget List
class EveryOnesWatchingWidgetList extends StatelessWidget {
  const EveryOnesWatchingWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOnesWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOnesWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
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
                "error while loading coming soon list",
              ),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text(
                "while loading every ones watching is empty",
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemBuilder: (BuildContext context, index) {
                final tv = state.everyOneIsWatchingList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }

                return EveryOnesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.posterPath}',
                  movieName: tv.originalName ?? 'no name',
                  decription: tv.overview ?? 'no decrition',
                );
              },
              itemCount: state.everyOneIsWatchingList.length,
            );
          }
        },
      ),
    );
  }
}
