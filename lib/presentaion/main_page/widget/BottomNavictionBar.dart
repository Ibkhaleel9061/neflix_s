import 'package:flutter/material.dart';

// All page Bottom Naviction Bar widget  code
ValueNotifier<int> indexChngeNotifier = ValueNotifier(0);

class BottomNavictionWidget extends StatelessWidget {
  const BottomNavictionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChngeNotifier,
      builder: (context, int newindex, _) {
        return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.collections), // Fire icon for "New & Hot"
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.emoji_emotions), // Fast forward icon for "Fast"
                label: 'Fast',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download), // Download icon for "Download"
                label: 'Download',
              ),
            ],
            currentIndex: newindex, // Set the initial selected index
            elevation: 3,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white, // Color for the selected item
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            iconSize: 35.0, // Increase icon size
            selectedFontSize: 18.0, // Increase the size of selected label
            unselectedFontSize: 14.0, //
            onTap: (index) {
              indexChngeNotifier.value = index;
            });
      },
    );
  }
}
