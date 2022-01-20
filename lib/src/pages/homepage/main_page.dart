import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/widgets/bot_nav_item.dart';
import 'package:manga_project/src/pages/homepage/homepage_latest.dart';
import 'package:manga_project/src/pages/homepage/homepage_manga.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key key}) : super(key: key);

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  
  Widget _currentWidget = SizedBox.expand();
  int _selectedIndex = 0;

  void _loadScreen() {
    switch(_selectedIndex) {
      case 0: return setState(() => _currentWidget = MangaHome());
      case 1: return setState(() => _currentWidget = LatestChapters());
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _loadScreen();
  }

  @override
  void initState() {
    super.initState();
    _loadScreen();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.black,
      body: _currentWidget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Constants.amber,
        unselectedItemColor: Constants.lightgrey,
        backgroundColor: Constants.black,
        items: [
          botNavItem(Icons.home, 'Home'),
          botNavItem(Icons.list_alt, 'New chapters'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
