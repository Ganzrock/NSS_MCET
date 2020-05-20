import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/home/gallery_list.dart';

import '../screens/blood_request_screen.dart';
import '../screens/user_details_screen.dart';

import '../widgets/home/contribution_list.dart';
import '../widgets/home/name_card.dart';

class NssHomeScreen extends StatefulWidget {
  @override
  _NssHomeScreenState createState() => _NssHomeScreenState();
}

class _NssHomeScreenState extends State<NssHomeScreen> {
  var uName;
  var _showNameCard = true;
  var userResults;
  var _onHover = false;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[200],
        elevation: 0.0,
        leading: Container(
          padding: EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/nn.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'NSS MCET',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: '',
            fontWeight: FontWeight.w900,
            fontSize: 22.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
            iconSize: 20.0,
            color: Colors.white54,
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            },
            iconSize: 20.0,
            color: Colors.white54,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // CustomAppBar(),
            if (_showNameCard)
              Stack(
                children: <Widget>[
                  NameCard('Gnana Ganesh'),
                  Positioned(
                    right: deviceWidth * 0.1,
                    child: IconButton(
                        color: Colors.white54,
                        iconSize: 20.0,
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            _showNameCard = false;
                          });
                        }),
                  )
                ],
              )
            else
              Container(),
            Positioned(
              top: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSubtitle('Contributions'),
                    Contributions(),
                    _buildSubtitle('Gallery'),
                    GalleryListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('BloodRequestScreen.routeName');
          },
          child: Image.asset(
            'assets/images/blood_drop2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          Text(
            'Swipe for more',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
