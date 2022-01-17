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
  
  Widget _currentWidget = SizedBox();
  int _selectedIndex = 0;

  bool mangaLoaded = false;
  List<Map<String, dynamic>> mangaList;
  List<Map<String, dynamic>> mangaUrlList;


  void _loadScreen() {
    switch(_selectedIndex) {
      case 0: return setState(() => _currentWidget = MangaHome(
        mangaList: mangaList,
        mangaUrlList: mangaUrlList,
      ));
      case 1: return setState(() => _currentWidget = LatestChapters());
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

    if (await webscraper.loadWebPage('/genero/sobrenatural')) {
      /*mangaList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a > img', 
        ['src', 'alt']
      );*/

      mangaList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-md-3.col-6.manga_portada > div.page-item-detail > div.manga_biblioteca.c-image-hover > a > img',
        ['src', 'title']);
      /*mangaUrlList = webscraper.getElement(
        'div.container-main-left > div.panel-content-homepage > div > a',
        ['href'],
      );*/

      mangaUrlList = webscraper.getElement(
        'div.row.row-eq-height > div.col-xl-3.col-md-3.col-6.manga_portada > div.page-item-detail > div.manga_biblioteca.c-image-hover > a',
        ['href']
      );  
    
      //print(mangaList);
      print(mangaUrlList);

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
      body: mangaLoaded
          ? MangaHome(
        mangaList: mangaList,
        mangaUrlList: mangaUrlList,
          )
          : Center(child: CircularProgressIndicator()),
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
