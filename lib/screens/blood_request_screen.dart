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
        if (docs.documents[i].data['isDonor'] == 'Yes')
          queryResultSet.add(docs.documents[i].data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
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
                  Text('BLOOD GROUP : ',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      )),
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

                        builderSet = queryResultSet;
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
                  RaisedButton(
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
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            queryResultSet.length == 0
                ? _buildCenterText('Search to see the Donors')
                : builderSet.length == 0
                    ? _buildCenterText('Couldn\'t reach servers...Try Again')
                    : Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'TOTAL DONORS :  ${builderSet.length}',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(_bloodGroup),
                          ),
                          Container(
                            height: mediaQuery.height * 0.68,
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
        heightFactor: MediaQuery.of(context).size.height,
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
