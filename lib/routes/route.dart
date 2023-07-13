import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import '../pages/home/page_home.dart';
import '../pages/get_loc/page_getLoc.dart';
import '../pages/share_loc/page_shareLoc.dart';
import '../pages/bookmarks/page_bookmarks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          VideoYoutube(),
          GetLocation(),
          ShareYourLocation(),
          DaftarKode(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blue,
            activeTitleColor: Colors.blue.shade600,
          ),
          BottomBarItem(
            icon: Icon(Icons.search),
            title: Text('Get Loc'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.send),
            title: Text('Share Loc'),
            backgroundColorOpacity: 0.1,
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.book_sharp),
            title: Text('Bookmarks'),
            activeColor: Colors.blue,
            activeIconColor: Colors.blue.shade600,
          ),
        ],
      ),
    );
  }
}
