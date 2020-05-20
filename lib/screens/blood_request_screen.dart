import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/search_service.dart';
import 'user_details_screen.dart';

class BloodRequestScreen extends StatefulWidget {
  static const routeName = '/blood-request';

  @override
  _BloodRequestScreenState createState() => _BloodRequestScreenState();
}

class _BloodRequestScreenState extends State<BloodRequestScreen> {
  var buttonColor = Colors.green;
  var _bloodGroup = 'O+';
  var isLoading = false;

  var queryResultSet = [];
  var builderSet = [];

  var lengthOfResult = 0;

  initiateSearch(value) async {
    queryResultSet = [];

    SearchService().searchByName(value).then((QuerySnapshot docs) {
      int i;
      for (i = 0; i < docs.documents.length; ++i) {
        queryResultSet.add(docs.documents[i].data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[200],
        elevation: 0.0,
        title: Text(
          'Blood Donors',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: '',
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
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
      body: Container(
        margin: EdgeInsets.only(top: 8.0),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Blood Group : ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  DropdownButton<String>(
                    iconEnabledColor: Colors.indigo,
                    value: _bloodGroup,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 8,
                    style: TextStyle(color: Colors.indigo),
                    underline: Container(
                      height: 1.5,
                      color: Colors.indigoAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _bloodGroup = newValue;

                        initiateSearch(_bloodGroup.trim().toUpperCase());
                      });
                    },
                    items: <String>[
                      'O+',
                      'O-',
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'AB+',
                      'AB-'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    width: 9.0,
                  ),
                  FlatButton(
                    visualDensity: VisualDensity.standard,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;

                        builderSet = queryResultSet;
                      });

                      await Future.delayed(
                          const Duration(milliseconds: 300), () {});
                    },
                    child: Text(
                      'Search',
                      style: TextStyle(color: buttonColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            queryResultSet.length == 0
                ? _buildCenterText('Serch to see the Donors')
                : builderSet.length == 0
                    ? _buildCenterText('Couldn\'t reach servers...Try Again')
                    : Container(
                        height: mediaQuery.height * 0.7,
                        width: double.infinity,
                        child: ListView.separated(
                          separatorBuilder: (ctx, index) {
                            return Divider();
                          },
                          itemBuilder: (ctx, index) {
                            var item = builderSet[index];
                            return ListTile(
                              leading: Icon(
                                Icons.perm_identity,
                              ),
                              title: Text(
                                item['username'].toString(),
                              ),
                              trailing: Text(
                                item['bloodGroup'].toString(),
                              ),
                            );
                          },
                          itemCount: queryResultSet.length,
                        ),
                      ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedButton(
        onPressed: () {},
        child: Text('Send Blood Request'),
        color: Colors.deepOrangeAccent[400],
      ),
    );
  }

  _buildCenterText(String s) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: Text(
          s,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 17.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
