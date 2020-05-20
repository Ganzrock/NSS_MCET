import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/home/gallery_list.dart';

import '../screens/blood_request_screen.dart';
import '../screens/user_details_screen.dart';

import '../widgets/home/contribution_list.dart';
import '../widgets/home/name_card.dart';
import 'notifications_screen.dart';
import '../providers/user_details.dart';

class NssHomeScreen extends StatefulWidget {
  @override
  _NssHomeScreenState createState() => _NssHomeScreenState();
}

class _NssHomeScreenState extends State<NssHomeScreen> {
  var uName = '';
  var _showNameCard = true;

  var userImageUrl = 'https://dummyimage.com/20/fff/000';

  String get userName {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        uName = doc['username'];
      });
    });
    return uName;
  }

  String get userImage {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        userImageUrl = doc['image_url'];
      });
    });
    return userImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/nn.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'NSS MCET',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.indigo[900],
            fontFamily: '',
            fontWeight: FontWeight.w900,
            fontSize: 22.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
            iconSize: 20.0,
            color: Colors.black54,
          ),
          GestureDetector(
            child: Container(
              height: 18.0,
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: (userImageUrl == null)
                    ? AssetImage('assets/images/plant.png')
                    : NetworkImage(userImage),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // CustomAppBar(),
            if (_showNameCard)
              Stack(
                children: <Widget>[
                  NameCard(userName),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSubtitle('Contributions'),
                Contributions(),
                _buildSubtitle('Gallery'),
                GalleryListView('Republis Day'),
                GalleryListView('APJ Memeorial'),
                GalleryListView('Independence Day'),
                GalleryListView('Eye Camp'),
                GalleryListView('Rally'),
                GalleryListView('Marathon'),
                GalleryListView('Special Camp'),
                GalleryListView('Swachh Bharat'),
                GalleryListView('Agastya Workshop'),
                GalleryListView('Unnat Bharat'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BloodRequestScreen.routeName);
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
