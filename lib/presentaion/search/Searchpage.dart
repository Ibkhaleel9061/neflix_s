import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_s/core/colors/Colors.dart';
import 'package:neflix_s/presentaion/search/Search_idle.dart';
import 'package:neflix_s/presentaion/search/Search_result.dart';

import '../../application/search/search_bloc.dart';
import '../../domain/debounce/debounce.dart';

// search main page
class Searchpage extends StatelessWidget {
  Searchpage({super.key});

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initalize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: kwhitecolor),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }

                ///Bloc movie query
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context).add(
                    SerachMovie(movieQuery: value),
                  );
                });
              },
            ),
            kheigh,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdle(); //view
                } else {
                  return const SearchResult(); //view result widget
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}
