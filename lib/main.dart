import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/chat_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/article_screen.dart';
import 'screens/blood_request_screen.dart';
import 'screens/new_article.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/user_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NSS MCET',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Color.fromRGBO(14, 78, 80, 6),
        accentColor: Colors.orange,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomeScreen();
          }
          return AuthScreen();
        },
      ),
      routes: {
        NewArticle.routeName: (_) => NewArticle(),
        ArticleScreen.routeName: (_) => ArticleScreen(),
        BloodRequestScreen.routeName: (_) => BloodRequestScreen(),
        BookmarkScreen.routeName: (_) => BookmarkScreen(),
        NotificationScreen.routeName: (_) => NotificationScreen(),
        ChatScreen.routeName: (_) => ChatScreen(),
        ProfilePage.routeName: (_) => ProfilePage(),
      },
    );
  }
}
