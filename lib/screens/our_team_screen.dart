import 'package:flutter/material.dart';

import '../providers/our_team.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';

class OurTeamScreen extends StatefulWidget {
  static const routeName = '/our-team';

  @override
  _OurTeamScreenState createState() => _OurTeamScreenState();
}

class _OurTeamScreenState extends State<OurTeamScreen> {
  List<OurTeamItem> currentTeam = OurTeam.ourTeam2019;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                color: kBackgroundColor.withOpacity(0.12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: kBackgroundColor.withOpacity(0.12),
                      padding: EdgeInsets.symmetric(
                        vertical: height / (height / 10),
                        horizontal: height / (height / 10),
                      ),
                      height: height * 0.15,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: width * 0.1,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Our Team',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Product Sans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    DropdownButton(
                      underline: Container(),
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.indigo,
                      ),
                      items: [
                        buildDropDown('2019'),
                        buildDropDown('2018'),
                        buildDropDown('2017'),
                        buildDropDown('2016'),
                        buildDropDown('2015'),
                        buildDropDown('2014'),
                        buildDropDown('2013'),
                        buildDropDown('2012'),
                        buildDropDown('2011'),
                        buildDropDown('2010'),
                        buildDropDown('2009'),
                        buildDropDown('2008'),
                        buildDropDown('2007'),
                      ],
                      onChanged: (itemIdentifier) {
                        if (itemIdentifier != '2019' ||
                            itemIdentifier != '2018')
                          showDialog(
                            context: context,
                            builder: (_) => SimpleDialog(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Text(
                                      'Sorry! Most of the Sections are empty now. We are getting the photos as early as possible'),
                                )
                              ],
                            ),
                          );

                        setState(() {
                          if (itemIdentifier == '2019') {
                            currentTeam = OurTeam.ourTeam2019;
                          } else if (itemIdentifier == '2018') {
                            currentTeam = OurTeam.ourTeam2018;
                          } else if (itemIdentifier == '2017') {
                            currentTeam = OurTeam.ourTeam2017;
                          } else if (itemIdentifier == '2016') {
                            currentTeam = OurTeam.ourTeam2016;
                          } else if (itemIdentifier == '2015') {
                            currentTeam = OurTeam.ourTeam2015;
                          } else if (itemIdentifier == '2014') {
                            currentTeam = OurTeam.ourTeam2014;
                          } else if (itemIdentifier == '2013') {
                            currentTeam = OurTeam.ourTeam2013;
                          } else if (itemIdentifier == '2012') {
                            currentTeam = OurTeam.ourTeam2012;
                          } else if (itemIdentifier == '2011') {
                            currentTeam = OurTeam.ourTeam2011;
                          } else if (itemIdentifier == '2010') {
                            currentTeam = OurTeam.ourTeam2010;
                          } else if (itemIdentifier == '2009') {
                            currentTeam = OurTeam.ourTeam2009;
                          } else if (itemIdentifier == '2008') {
                            currentTeam = OurTeam.ourTeam2008;
                          } else if (itemIdentifier == '2007') {
                            currentTeam = OurTeam.ourTeam2007;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: kBackgroundColor.withOpacity(0.12),
                  child: (currentTeam.length != 0)
                      ? ListView.builder(
                          itemCount: currentTeam.length,
                          itemBuilder: (_, index) => buildContainer(
                            currentTeam[index].name,
                            currentTeam[index].position,
                            currentTeam[index].dep,
                            currentTeam[index].year,
                            currentTeam[index].imageName,
                            currentTeam[index].color,
                            width,
                            height,
                          ),
                        )
                      : Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            margin: EdgeInsets.only(bottom: 30.0),
                            child: Text(
                                ' Information of Past Seniors will be availabe at the official launch of this application. :)'),
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String name, String role, String dep, String year,
      String imageName, Color color, double width, double height) {
    return Container(
        width: width * 0.2,
        height: height * 0.23,
        child: Row(
          children: [
            Card(
              elevation: 15,
              shadowColor: Colors.indigo,
              margin: EdgeInsets.fromLTRB(
                width * 0.10,
                height * 0.015,
                width * 0.07,
                height * 0.015,
              ),
              child: Container(
                width: width * 0.35,
                height: height * 0.23,
                color: color,
                child: Image.asset(
                  'assets/images/$imageName.png',
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: height * 0.009,
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MontSerrat',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  dep,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black,
                    fontFamily: 'Orbitron',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  year,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                    // fontFamily: 'Orbitron',
                  ),
                ),
              ],
            )
          ],
        )
        // color: (index % 2 == 0) ? Colors.blue : Colors.indigo,
        );
  }

  DropdownMenuItem buildDropDown(String text) {
    return DropdownMenuItem(
      child: Container(
        child: Row(
          children: <Widget>[
            // Icon(Icons.exit_to_app),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
      value: text,
    );
  }
}
