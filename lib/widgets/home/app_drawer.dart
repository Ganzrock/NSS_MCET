import 'package:flutter/material.dart';

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
          fontFamily: 'MonoSerrat',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: <Widget>[
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Theme.of(context).accentColor,
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
              buildListTile('Profile', Icons.person_outline, () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
              buildListTile('Bookmarks', Icons.bookmark, () {
                // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),
              buildListTile('Notifications', Icons.bookmark, () {
                // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              buildListTile('About', Icons.bookmark, () {
                // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),
              buildListTile('How to use?', Icons.bookmark, () {
                // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),
            ],
          ),
          Divider(),
          buildListTile('Change Theme', Icons.bookmark, () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          SizedBox(
            height: 20,
          ),
          buildListTile('Developers', Icons.bookmark, () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
