import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_s/presentaion/search/ScreechTexttitle.dart';

import '../../application/search/search_bloc.dart';
import '../../core/colors/Colors.dart';
import '../../core/strings.dart';

// Search page top search List widget code
class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Screechtexttitle(title: 'Top Searchs'),
      kheigh,
      Expanded(child:
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.isError) {
          return const Center(child: Text("Error while getting data"));
        } else if (state.ideleList.isEmpty) {
          return const Center(child: Text("List is empty"));
        }
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            final movie = state.ideleList[index];
            return topsearchitemTile(
                title: movie.title ?? 'no title provider',
                imageURL: '$imageAppendUrl${movie.posterPath}');
          },
          separatorBuilder: (ctx, index) => const SizedBox(height: 20),
          itemCount: state.ideleList.length,
        );
      })),
    ]);
  }
}

// Search page
// movie name &  paly button widget
class topsearchitemTile extends StatelessWidget {
  const topsearchitemTile(
      {super.key, required this.title, required this.imageURL});

  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    final Screeenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: Screeenwidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageURL),
          )),
        ),
        kwidth,
        Expanded(
            child: Text(
          title,
          style: TextStyle(
              color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        Icon(
          Icons.play_circle_outline,
          color: kwhitecolor,
          size: 30, // Adjust size as needed
        ),
      ],
    );
  }
}
