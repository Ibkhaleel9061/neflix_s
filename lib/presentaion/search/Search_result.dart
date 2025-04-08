import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_s/presentaion/search/ScreechTexttitle.dart';
import 'package:neflix_s/presentaion/widgets/MainCard.dart';

import '../../application/search/search_bloc.dart';
import '../../core/colors/Colors.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Screechtexttitle(
            title: 'Movies & TV'), // search page top search Title name
        kheigh,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            // bloc search resulte
            builder: (context, state) {
              return GridView.count(
                //shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return mainCard(
                    imageUrl: movie.posterImageUrl,
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
