import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/search_service.dart';

class BloodRequestScreen extends StatefulWidget {
  static const routeName = '/blood-request';

  @override
  _BloodRequestScreenState createState() => _BloodRequestScreenState();
}

class _BloodRequestScreenState extends State<BloodRequestScreen> {
  var buttonColor = Colors.green;
  var _bloodGroup = '';
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
        title: Text('Blood Request'),
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
                  MaterialButton(
                    visualDensity: VisualDensity.standard,
                    color: buttonColor,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                        buttonColor = Colors.grey;

                        builderSet = queryResultSet;
                      });

                      await Future.delayed(
                          const Duration(milliseconds: 100), () {});

                      setState(() {
                        buttonColor = Colors.green[700];
                      });
                      await Future.delayed(
                          const Duration(milliseconds: 300), () {});
                    },
                    child: Text('Search'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            builderSet.length == 0
                ? Container()
                : Container(
                    height: mediaQuery.height * 0.7,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        var item = builderSet[index];
                        return ExpansionTile(
                          leading: Icon(
                            Icons.perm_identity,
                          ),
                          title: Text(
                            item['username'].toString(),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            item['bloodGroup'].toString(),
                          ),
                          children: [
                            Text(
                              item['contact'].toString(),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        );
                      },
                      itemCount: queryResultSet.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
