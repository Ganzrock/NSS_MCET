import 'package:flutter/material.dart';

import '../screens/new_article.dart';
import '../screens/blood_request_screen.dart';

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
          fontFamily: 'RobotoCondensed',
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 90,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.orange[500],
              child: Text(
                'NSS MCET',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Blood Request', Icons.local_hospital, () {
              Navigator.of(context).pushNamed(BloodRequestScreen.routeName);
            }),
            buildListTile('New Article', Icons.note_add, () {
              Navigator.of(context).pushNamed(NewArticle.routeName);
            }),
          ],
        ),
        elevation: 10.0,
      ),
    );
  }
}
