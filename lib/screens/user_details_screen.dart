import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  static const routeName2 = '/profile_view';

  final bool isMe;

  ProfilePage(this.isMe);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userResults;
  var uName = '';
  var userImageUrl = 'https://dummyimage.com/20/fff/000';
  var uBio = '';
  var uArticleCount = 0;
  var donor = '';
  var bloodGroup = '';

  String get userImage {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        userImageUrl = doc['image_url'];
      });
    });
    return userImageUrl;
  }

  String get userName {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        uName = doc['username'];
      });
    });
    return uName;
  }

  String get userBio {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        uBio = doc['bio'];
      });
    });
    return uBio;
  }

  String get userArticlesCount {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        uArticleCount = doc['noOfPost'];
      });
    });
    return uArticleCount.toString();
  }

  String get userIsDonor {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        donor = doc['isDonor'];
      });
    });
    return donor;
  }

  String get userBloodGroup {
    User().userData.then((DocumentSnapshot doc) {
      setState(() {
        bloodGroup = doc['bloodGroup'];
      });
    });
    return bloodGroup;
  }

  void beADonor() async {
    final user = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection('users')
        .document(user.uid)
        .updateData({'isDonor': 'Yes'});
    setState(() {
      donor = 'Yes';
    });
  }

  // getUser() async {
  //   final user = await FirebaseAuth.instance.currentUser();
  //   final userData =
  //       await Firestore.instance.collection('users').document(user.uid).get();
  //   return userData;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          widget.isMe
              ? DropdownButton(
                  underline: Container(),
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black87,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      value: 'edit',
                    ),
                    DropdownMenuItem(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.exit_to_app),
                            SizedBox(width: 8),
                            Text('Logout'),
                          ],
                        ),
                      ),
                      value: 'logout',
                    ),
                  ],
                  onChanged: (itemIdentifier) {
                    if (itemIdentifier == 'logout') {
                      FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  },
                )
              : Container()
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 125.0,
                width: 125.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(62.5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(userImage),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
                Text(
                  userName,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                if (donor == 'No')
                  FlatButton(
                    child: Text('Be a Donor', style: TextStyle(fontSize: 10.0)),
                    onPressed: beADonor,
                  )
              ]),
              SizedBox(height: 4.0),
              Text(
                userBio,
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          userArticlesCount,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'ARTICLES',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    userIsDonor == 'No'
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                userIsDonor,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'BLOOD DONOR',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                userBloodGroup,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                'BLOOD GROUP',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.table_chart),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              // buildImages(),
              // buildInfoDetail(),
              // buildImages(),
              // buildInfoDetail(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildImages() {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Container(
          height: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: AssetImage('assets/images/nn.png'),
                  fit: BoxFit.cover))),
    );
  }

  Widget buildInfoDetail() {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Maldives - 12 Days',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              SizedBox(height: 7.0),
              Row(
                children: <Widget>[
                  Text(
                    'Teresa Soto',
                    style:
                        TextStyle(color: Colors.grey.shade700, fontSize: 11.0),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.timer,
                    size: 4.0,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '3 Videos',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 11.0),
                  )
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Image.asset('assets/images/nn.png'),
                ),
              ),
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  child: Image.asset('assets/images/nn.png'),
                ),
              ),
              SizedBox(width: 7.0),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 22.0,
                  width: 22.0,
                  child: Image.asset('assets/images/nn.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
