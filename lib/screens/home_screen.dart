import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/blood_request_screen.dart';
import 'package:flutter_complete_guide/screens/nss_home_screen.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';
import 'article_screen.dart';
import 'new_article.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  var userImageUrl = 'https://dummyimage.com/20/fff/000';

  @override
  void initState() {
    Provider.of<UserData>(context, listen: false).setUser;

    _pages = [
      {
        'page': AboutScreen(),
        'title': 'Home',
      },
      {
        'page': ArticleScreen(),
        'title': 'Articles',
      },
      {
        'page': BloodRequestScreen(),
        'title': 'New Article',
      },
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
    Provider.of<Articles>(context, listen: false).fetchAndSetArticles();
    return Scaffold(
      drawerEdgeDragWidth: 20.0,
      drawer: MainDrawer(),
      resizeToAvoidBottomInset: true,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 20.0,
        elevation: 5.0,
        selectedIconTheme: IconThemeData(opacity: 0.8, size: 27.0),
        unselectedIconTheme: IconThemeData(opacity: 0.7, size: 23.0),
        onTap: _selectPage,
        backgroundColor: Colors.white.withOpacity(0.9),
        unselectedItemColor: Colors.grey.withOpacity(0.92),
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, color: Colors.blueGrey[300]),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.description),
            title: Text(' '),
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.local_hospital),
            title: Text(' '),
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.people),
            title: Text(' '),
          ),
        ],
      ),
    );
  }
}
