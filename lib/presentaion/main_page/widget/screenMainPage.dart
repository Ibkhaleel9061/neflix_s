import 'package:flutter/material.dart';
import 'package:neflix_s/presentaion/downloads/downlodpage.dart';
import 'package:neflix_s/presentaion/home/Home_page.dart';
import 'package:neflix_s/presentaion/main_page/widget/BottomNavictionBar.dart';
import 'package:neflix_s/presentaion/search/Searchpage.dart';

import '../../fast_laugh/Fast_laugh_page.dart';
import '../../new_&_hot/New&hotpage.dart';

// main page Bottome Navition Bar
class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    Homepage(),
    NewAndHotPage(),
    FastlaughPage(),
    Searchpage(),
    Downlodpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChngeNotifier,
            builder: (context, int pageindex, _) {
              return _pages[pageindex];
            }),
      ),
      bottomNavigationBar: BottomNavictionWidget(),
    );
  }
}
