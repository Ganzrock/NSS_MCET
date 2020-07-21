import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/bookmarks_screen.dart';

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
      child: SingleChildScrollView(
        child: Container(
          height: height + (height / (height / 51)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                                'assets/images/nn.png',
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
                        Navigator.of(context).pushReplacementNamed('/');
                      }),
                      buildListTile('Bookmarks', Icons.bookmark, () {
                        Navigator.of(context)
                            .pushNamed(BookmarkScreen.routeName);
                      }),
                      buildListTile('Notifications', Icons.notifications_active,
                          () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      buildListTile('Change Theme', Icons.settings_brightness,
                          () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      buildListTile('Logout', Icons.exit_to_app, () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      Divider(
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      buildListTile('About', Icons.info, () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      buildListTile('How to use?', Icons.question_answer, () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      Divider(
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      buildListTile('Feedback', Icons.comment, () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      buildListTile('Developers', Icons.perm_device_information,
                          () {
                        // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                      }),
                      Divider(
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Text('Crafted with ',
                      style: TextStyle(
                        fontFamily: 'Lemonada',
                        fontSize: 12.5,
                      )),
                  Icon(Icons.favorite, size: 13.0, color: Colors.red),
                  Text(
                    'NSS MCET',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        fontFamily: 'Lemonada',
                        color: Theme.of(context).primaryColor),
                  ),
                  Divider(
                    indent: 65.0,
                    endIndent: 65.0,
                  ),
                  SizedBox(
                    height: height / (height / 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
