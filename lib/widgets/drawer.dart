import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/about_screen.dart';
import 'package:flutter_complete_guide/screens/blood_request_screen.dart';
import 'package:flutter_complete_guide/screens/bookmarks_screen.dart';
import 'package:flutter_complete_guide/screens/chat_screen.dart';
import 'package:flutter_complete_guide/screens/notifications_screen.dart';
import 'package:flutter_complete_guide/screens/our_team_screen.dart';
import 'package:flutter_complete_guide/screens/report_a_problem.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:flutter_complete_guide/screens/gallery.dart';
import 'package:flutter_complete_guide/screens/developers_Screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'MontSerrat',
          fontSize: 16,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
      elevation: 20.0,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height / (height / 25),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 65,
                      height: height / (height / 65),
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/nss.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 95,
                      height: height / (height / 65),
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/mcet.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / (height / 10),
              ),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
              ),
              buildListTile('Profile', Icons.person_outline, () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              }),
              buildListTile('Bookmarks', Icons.bookmark, () {
                Navigator.of(context).pushNamed(BookmarkScreen.routeName);
              }),
              buildListTile('Favorites', Icons.favorite, () {
                Navigator.of(context).pushNamed(BookmarkScreen.routeName2);
              }),
              buildListTile('Notifications', Icons.notifications_active, () {
                Navigator.of(context).pushNamed(NotificationScreen.routeName);
              }),
              // buildListTile('About', Icons.info, () {
              //   Navigator.of(context).pushNamed(AboutScreen.routeName);
              // }),

              buildListTile('Our Team', Icons.group, () {
                Navigator.of(context).pushNamed(OurTeamScreen.routeName);
              }),
              // buildListTile('Change Theme', Icons.settings_brightness,
              //     () {
              //   DynamicTheme.of(context).setThemeData(new ThemeData(
              //       primaryColor:
              //           Theme.of(context).primaryColor == Colors.indigo
              //               ? Colors.red
              //               : Colors.indigo));
              //   DynamicTheme.of(context).setBrightness(
              //       Theme.of(context).brightness == Brightness.dark
              //           ? Brightness.light
              //           : Brightness.dark);

              //   // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              // }),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
              ),
              // buildListTile('About', Icons.info, () {
              // //   Navigator.of(context).pushNamed(AboutScreen.routeName);
              // }),
              // buildListTile('Blood Donors', Icons.local_hospital, () {
              //   Navigator.of(context)
              //       .pushNamed(BloodRequestScreen.routeNameWithBackButton);
              // }),
              // buildListTile('NSS Gallery', Icons.image, () {
              //   Navigator.of(context)
              //       .pushNamed(GalleryScreen.routeNameWithBackButton);
              // }),
              // buildListTile('Community', Icons.group, () {
              //   Navigator.of(context)
              //       .pushNamed(ChatScreen.routeNameWithBackButton);
              // }),
              // Divider(
              //   indent: 40.0,
              //   endIndent: 40.0,
              // ),
              // buildListTile('How to use?', Icons.question_answer, () {
              //   // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              // }),

              buildListTile('Feedback', Icons.add_comment, () {
                Navigator.of(context).pushNamed(ReportProblemScreen.routeName);
              }),
              buildListTile('Developers', Icons.perm_device_information, () {
                Navigator.of(context).pushNamed(DevelopersScreen.routeName);
              }),

              buildListTile('Logout', Icons.exit_to_app, () {
                FirebaseAuth.instance.signOut();
              }),
              Divider(
                indent: 40.0,
                endIndent: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
