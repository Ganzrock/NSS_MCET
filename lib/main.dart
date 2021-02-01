import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/about_screen.dart';
import 'package:flutter_complete_guide/screens/gallery.dart';
import 'package:flutter_complete_guide/screens/onboarding_screen.dart';
import 'package:flutter_complete_guide/screens/report_a_problem.dart';
import 'package:flutter_complete_guide/screens/splash_screen.dart';
import 'package:flutter_complete_guide/widgets/user_profile/post_cards.dart';
import 'package:provider/provider.dart';
import 'screens/chat_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/article_screen.dart';
import 'screens/blood_request_screen.dart';
import 'screens/new_article.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/our_team_screen.dart';
import 'screens/user_details_screen.dart';
import 'screens/developers_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // var articles = User().userArticles;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserData(),
        ),
        ChangeNotifierProvider(
          create: (_) => Articles(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NSS MCET',
        theme: ThemeData(
          // primarySwatch: Colors.indigo,
          backgroundColor: Color.fromRGBO(14, 78, 80, 6),
          accentColor: Colors.orange,
          accentColorBrightness: Brightness.light,
          scaffoldBackgroundColor: Color(0xFFF9F8FD),
          textTheme: TextTheme(
                  headline1: TextStyle(
                    color: Colors.indigo[900],
                    fontFamily: '',
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                  headline2: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                  headline3: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      fontFamily: 'Montserrat'))
              .apply(bodyColor: const Color(0xFF3C4046)),
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
              return OnBoardingScreen();
            }),
        routes: {
          HomeScreen.routeName: (_) => HomeScreen(),
          NewArticle.routeName: (_) => NewArticle(),
          ArticleScreen.routeName: (_) => ArticleScreen(),
          BloodRequestScreen.routeName: (_) => BloodRequestScreen(false),
          BloodRequestScreen.routeNameWithBackButton: (_) =>
              BloodRequestScreen(true),
          BookmarkScreen.routeName: (_) => BookmarkScreen('bookmarks'),
          BookmarkScreen.routeName2: (_) => BookmarkScreen('favorites'),
          NotificationScreen.routeName: (_) => NotificationScreen(),
          ChatScreen.routeName: (_) => ChatScreen(false),
          ChatScreen.routeNameWithBackButton: (_) => ChatScreen(true),
          ProfilePage.routeName: (_) => ProfilePage(true),
          ProfilePage.routeName2: (_) => ProfilePage(false),
          OnBoardingScreen.routeName: (_) => OnBoardingScreen(),
          PostCards.routeName: (_) => PostCards(),
          AuthScreen.routeName: (_) => AuthScreen(),
          ReportProblemScreen.routeName: (_) => ReportProblemScreen(),
          GalleryScreen.routeNameWithBackButton: (_) => GalleryScreen(true),
          GalleryScreen.routeName: (_) => GalleryScreen(false),
          AboutScreen.routeName: (_) => AboutScreen(),
          OurTeamScreen.routeName: (_) => OurTeamScreen(),
          DevelopersScreen.routeName: (_) => DevelopersScreen(),
        },
      ),
    );
  }
}
