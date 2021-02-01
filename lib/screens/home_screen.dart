import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Custom_icons/my_flutter_app_icons.dart';

import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/blood_request_screen.dart';
import 'package:flutter_complete_guide/screens/gallery.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'chat_screen.dart';
import 'article_screen.dart';

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
        'page': ArticleScreen(),
        'title': 'Home',
      },
      {
        'page': GalleryScreen(false),
        'title': 'Articles',
      },
      {
        'page': BloodRequestScreen(false),
        'title': 'New Article',
      },
      {
        'page': ChatScreen(false),
        'title': 'Chat',
      },
      {
        'page': ProfilePage(false),
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
    final Color selectedColor = Colors.white;
    final Color unSelectedColor = Colors.grey;
    return Scaffold(
      drawerEdgeDragWidth: 20.0,
      drawer: MainDrawer(),

      // backgroundColor: kBackgroundColor.withOpacity(0.12),
      resizeToAvoidBottomInset: true,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar:
          // Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top: Radius.circular(30.0),
          //     ),
          //   ),
          //   elevation: 0.0,
          //   child:
          Container(
        margin: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // Color.fromRGBO(68, 80, 226, 0.9),
              // Color.fromRGBO(110, 38, 199, 0.9),
              gradientStartColor,
              gradientEndColor,
            ],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        // padding: const EdgeInsets.all(10),
        // margin: EdgeInsets.symmetric(horizontal: 7.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _selectPage(0);
              },
              color:
                  (_selectedPageIndex == 0) ? selectedColor : unSelectedColor,
            ),
            IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                _selectPage(1);
              },
              color:
                  (_selectedPageIndex == 1) ? selectedColor : unSelectedColor,
            ),
            IconButton(
              icon: Icon(Icons.local_hospital),
              onPressed: () {
                _selectPage(2);
              },
              color:
                  (_selectedPageIndex == 2) ? selectedColor : unSelectedColor,
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                _selectPage(3);
              },
              color:
                  (_selectedPageIndex == 3) ? selectedColor : unSelectedColor,
            ),
            IconButton(
              icon: Icon(Icons.perm_identity),
              onPressed: () {
                _selectPage(4);
              },
              color:
                  (_selectedPageIndex == 4) ? selectedColor : unSelectedColor,
            ),
          ],
        ),
      ),
      // ),

      // BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   iconSize: 20.0,
      //   elevation: 5.0,
      //   selectedIconTheme: IconThemeData(opacity: 0.8, size: 27.0),
      //   unselectedIconTheme: IconThemeData(opacity: 0.7, size: 23.0),
      //   onTap: _selectPa_selectPage()ge,
      //   backgroundColor: Colors.white.withOpacity(0.9),
      //   unselectedItemColor: Colors.grey.withOpacity(0.92),
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   currentIndex: _selectedPageIndex,
      //   selectedLabelStyle: TextStyle(
      //     fontWeight: FontWeight.w600,
      //   ),
      // unselectedLabelStyle:
      //     TextStyle(fontWeight: FontWeight.w500, color: Colors.blueGrey[300]),
      // type: BottomNavigationBarType.fixed,
      // items: [
      //   BottomNavigationBarItem(
      //     backgroundColor: Colors.white,
      //     icon: Icon(Icons.home),
      //     title: Text(''),
      //   ),
      //   BottomNavigationBarItem(
      //     backgroundColor: Colors.white,
      //     icon: Icon(Icons.description),
      //     title: Text(' '),
      //   ),

      //   BottomNavigationBarItem(
      //     backgroundColor: Colors.white,
      //     icon: Icon(Icons.local_hospital),
      //     title: Text(' '),
      //   ),
      //   // BottomNavigationBarItem(icon: Icon(Icons.ac_unit)),
      //   BottomNavigationBarItem(
      //     backgroundColor: Colors.white,
      //     icon: Icon(Icons.people),
      //     title: Text(' '),
      //   ),
      // ],
      // ),
    );
  }
}
