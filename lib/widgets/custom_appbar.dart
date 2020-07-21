import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15.0),
                width: 40.0,
                height: 40.0,
                child: Image.asset(
                  'assets/images/nn.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'NSS MCET',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: '',
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0),
                ),
              ),
            ],
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
                iconSize: 20.0,
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigator.of(context).pushNamed(ProfilePage.routeName);
                },
                iconSize: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
