import 'package:flutter/material.dart';

import 'chat_screen.dart';
import '../widgets/drawer.dart';
import 'article_screen.dart';
import 'bookmarks_screen.dart';
import 'nss_home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': NssHomeScreen(),
        'title': 'Home',
      },
      {
        'page': ArticleScreen(),
        'title': 'Articles',
      },
      {'page': BookmarkScreen(), 'title': 'Bookmarks'},
      {
        'page': ChatScreen(),
        'title': 'Chat',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      drawerEdgeDragWidth: 100.0,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.description),
              title: Text('Post')),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.bookmark),
              title: Text('Bookmark')),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.people),
              title: Text('Community')),
        ],
      ),
    );
  }
}
