import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_s/presentaion/fast_laugh/video_list_item.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

//Fast page main widget code
class FastlaughPage extends StatelessWidget {
  const FastlaughPage({super.key});

  @override //call the bloc
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(
        const Initialize(),
      );
    });
    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FastLaughBloc>(context).add(
            const Initialize(),
          );
        },
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
            builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('error while get data'),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text('error while get data'),
            );
          } else {
            return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                    widget: VideoListItem(
                      key: Key(index.toString()),
                      index: index,
                    ),
                    movieData: state.videosList[index],
                  );
                }));
          }
        }),
      ),
    ));
  }
}
