import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../widgets/user_profile/post_cards.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  static const routeName2 = '/profile-with-back-button';

  // final bool isMe;
  final bool backButton;

  ProfilePage(this.backButton);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      //   title: Text(
      //     'Profile',
      //     textAlign: TextAlign.left,
      //     style: theme.textTheme.headline1,
      //   ),
      // ),
      backgroundColor: widget.backButton
          ? Colors.indigo[100]
          : kBackgroundColor.withOpacity(0.12),
      body: Consumer<UserData>(
        // future: Provider.of<UserData>(context).setUser(),
        builder: (_, userData, child) {
          // final user = userData;
          // print(userData.bio);
          var _isDonor = userData.isDonor == 'Yes';
          return !userData.hasData
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20.0),
                      Text('Almost Done!'),
                    ]))
              : SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        height: height,
                        // width:width*0.85,
                        margin: EdgeInsets.only(top: height / (height / 70)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: width * 0.85,
                              child: Card(
                                elevation: 5.0,
                                // color: Colors.indigo[200],
                                // margin: EdgeInsets.all(5.0),
                                shadowColor: Colors.indigoAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  width: width * 0.85,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: height / (height / 125.0),
                                        width: width / (width / 125.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(62.5),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(userData.imageUrl),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: height / (height / 20.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            userData.userName,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // if (user.isDonor == 'Yes')
                                          //   SizedBox(
                                          //     width: 10.0,
                                          //   ),
                                          // if (user.isDonor == 'Yes')
                                          //   Container(
                                          //     width: 20.0,
                                          //     height: 20.0,
                                          //     child: Image.asset(
                                          //       'assets/images/blood_drop.png',
                                          //       fit: BoxFit.cover,
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                      SizedBox(
                                          height: height / (height / 20.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              if (userData.noOfPost == 0) {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                        content: Text(
                                                            'Sorry! You have not wrtten any articles. ')));
                                              } else {
                                                Navigator.of(context).pushNamed(
                                                    PostCards.routeName);
                                              }
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  userData.noOfPost.toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'MontSerrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: secondaryTextColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: height /
                                                        (height / 5.0)),
                                                Text(
                                                  'ARTICLES',
                                                  style: TextStyle(
                                                      color: primaryTextColor),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  userData.bloodGroup,
                                                  style: TextStyle(
                                                      fontFamily: 'MontSerrat',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          secondaryTextColor),
                                                ),
                                                SizedBox(
                                                    height: height /
                                                        (height / 5.0)),
                                                Text(
                                                  'BLOOD GROUP',
                                                  style: TextStyle(
                                                      color: primaryTextColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            buildCard('EMAIL : ', userData.email, width, height,
                                email: true),
                            Card(
                              elevation: 5.0,
                              // color: Colors.indigo[200],
                              shadowColor: Colors.indigoAccent,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Container(
                                width: width * 0.85,
                                height: height * 0.075,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / (width / 40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('ROLL NUMBER'),
                                    Text(
                                      userData.rollNumber,
                                      style: TextStyle(
                                        fontFamily: 'MontSerrat',
                                        fontWeight: FontWeight.bold,
                                        color: secondaryTextColor,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Card(
                              elevation: 5.0,
                              // color: Colors.indigo[200],
                              shadowColor: Colors.indigoAccent,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              child: Container(
                                width: width * 0.85,
                                height: height * 0.075,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / (width / 40)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('BLOOD DONOR'),
                                    Switch(
                                      value: _isDonor,
                                      onChanged: (value) {
                                        setState(() {
                                          _isDonor = !_isDonor;
                                        });
                                        // userData.setDonor(userData.isDonor);
                                        userData
                                            .toggleBloodDonor(userData.isDonor);
                                        userData.setUser();
                                      },
                                      activeTrackColor: Colors.lightGreenAccent,
                                      activeColor: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Switch(
                            //   onChanged: () => setState(() {
                            //     isSelected = !isSelected;
                            //   }),
                            // )

                            SizedBox(height: height / (height / 10.0)),
                            Divider(),
                            Column(
                              children: [
                                SizedBox(height: height / (height / 10.0)),
                                InkWell(
                                  onTap: () => showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Text('Are you sure'),
                                      content: Text(
                                          'Do you want to logout from your account  ?'),
                                      actions: [
                                        ButtonBar(
                                          children: [
                                            FlatButton(
                                                child: Text('Yes'),
                                                onPressed: () {
                                                  FirebaseAuth.instance
                                                      .signOut();
                                                }),
                                            MaterialButton(
                                                child: Text('No'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  child: Card(
                                    elevation: 5.0,
                                    // color: Colors.indigo[200],
                                    shadowColor: Colors.indigoAccent,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 5.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: Container(
                                      width: width * 0.85,
                                      height: height * 0.075,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width / (width / 40)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('LOGOUT'),
                                          Icon(Icons.exit_to_app),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomAppBar(
                        title: 'Profile',
                        backButton: widget.backButton,
                        showNotify: !widget.backButton,
                      ),
                    ],
                  ),
                );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.exit_to_app),
      //   onPressed: () =>
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      //   mini: true,
      // ),
    );
  }

  Widget buildCard(String title, String content, double width, double height,
      {bool email = false}) {
    return Card(
      elevation: 5.0,
      // color: Colors.indigo[200],
      shadowColor: Colors.indigoAccent,
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        width: width * 0.85,
        height: height * 0.075,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                content,
                style: TextStyle(
                  fontFamily: 'MontSerrat',
                  fontWeight: FontWeight.bold,
                  color: secondaryTextColor,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
