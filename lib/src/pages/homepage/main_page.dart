import 'package:flutter/material.dart';
import 'package:manga_project/src/constants/constants.dart';
import 'package:manga_project/src/widgets/bot_nav_item.dart';
import 'package:manga_project/src/pages/homepage/homepage_latest.dart';
import 'package:manga_project/src/pages/homepage/homepage_manga.dart';
import 'package:web_scraper/web_scraper.dart';

class HomePageNavigator extends StatefulWidget {
  const HomePageNavigator({Key key}) : super(key: key);

  @override
  State<HomePageNavigator> createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  
  Widget _currentWidget = SizedBox.expand();
  int _selectedIndex = 0;

  bool mangaLoaded = false;
  List<Map<String, dynamic>> mangaList;

  void _loadScreen() {
    switch(_selectedIndex) {
      case 0: return setState(() => _currentWidget = LatestChapters());
      case 1: return setState(() => _currentWidget = MangaHome());
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _loadScreen();
  }

  void fetchManga() async {
    final webscraper = WebScraper(Constants.mangaUrl);

    if (await webscraper.loadWebPage('/read')) {
      mangaList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a > img', 
        ['src', 'alt']
      );

      print(mangaList);

      setState(() {
        mangaLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchManga();
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
          botNavItem(Icons.list_alt, 'New chapters'),
          botNavItem(Icons.book_rounded, 'Manga'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
