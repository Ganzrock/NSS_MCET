import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/report_a_problem.dart';
import 'package:provider/provider.dart';

import '../widgets/user_profile/post_cards.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  static const routeName2 = '/profile_view';

  final bool isMe;

  ProfilePage(this.isMe);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.indigo),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Profile',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline1,
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
                            Icon(Icons.feedback),
                            SizedBox(width: 8),
                            Text('FeedBack'),
                          ],
                        ),
                      ),
                      value: 'report',
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
                      Navigator.of(context).pushNamed('/');
                    }
                    if (itemIdentifier == 'report') {
                      Navigator.of(context)
                          .pushNamed(ReportProblemScreen.routeName);
                    }
                  },
                )
              : Container()
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height - 70.0,
          child: Consumer<UserData>(
            builder: (_, user, child) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          height: 125.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(62.5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(user.imageUrl),
                            ),
                          ),
                        ),
                        SizedBox(height: height / (height / 20.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              user.userName,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            if (user.isDonor == 'Yes')
                              SizedBox(
                                width: 10.0,
                              ),
                            if (user.isDonor == 'Yes')
                              Container(
                                width: 20.0,
                                height: 20.0,
                                child: Image.asset(
                                  'assets/images/blood_drop.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: height / (height / 20.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  user.noOfPost.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: height / (height / 5.0)),
                                Text(
                                  'ARTICLES',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  user.bloodGroup,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: height / (height / 5.0)),
                                Text(
                                  'BLOOD GROUP',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                buildCard('EMAIL : ', user.email),
                buildCard('ROll Number : ', user.rollNumber),
                buildCard('BLOOD DONOR : ', user.isDonor.toString()),
                SizedBox(height: height / (height / 10.0)),
                Divider(),
                SizedBox(height: height / (height / 10.0)),
                FlatButton(
                    child: Text('View Your Articles',
                        style: TextStyle(
                          color: Colors.indigo,
                        )),
                    onPressed: () {
                      if (user.noOfPost == 0) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                content: Text(
                                    'Sorry! You have not wrtten any articles. ')));
                      } else {
                        Navigator.of(context).pushNamed(PostCards.routeName);
                      }
                    }),
                FlatButton(
                  child: Text(
                      user.isDonor == 'No'
                          ? 'Be a Blood Donor'
                          : 'Cancel Blood Donor',
                      style: TextStyle(
                        color: Colors.indigo,
                      )),
                  onPressed: () async {
                    if (user.isDonor == 'Yes') {
                      await user.toggleBloodDonor(user.isDonor);
                    } else {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            '''Thank You for your interest !
                           ''',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            ),
                          ),
                          titlePadding: EdgeInsets.all(10.0),
                          content:
                              Text('''Please Read the Following Instructions :
                        
1. Your contact details will be visible in the Donors Page.
2. You will be contacted by someone in time of need. So please agree only if you can donate blood.
3. You have to provide your contact details for reaching you. '''),
                          scrollable: true,
                          actions: [
                            FlatButton(
                              child: Text('Agree'),
                              onPressed: () async {
                                await user
                                    .toggleBloodDonor(user.isDonor)
                                    .then((_) => Navigator.of(context).pop());
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildCard(String title, String content) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.0),
                Text(title, style: TextStyle(color: Colors.grey)),
                SizedBox(width: 20.0),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    content,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
