import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:flutter_complete_guide/widgets/user_profile/profile_icon.dart';
import 'package:provider/provider.dart';

import '../widgets/home/contribution_list.dart';
import '../widgets/home/name_card.dart';
import '../providers/user_details.dart';

class AboutScreen extends StatefulWidget {
  static const routeName = '/about-screen';
  @override
  _AboutScreen createState() => _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: width,
          child: Stack(
            children: <Widget>[
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Center(
                    child: _buildWhoCard(
                      'Who we Are?',
                      "National Service Scheme(NSS) , DR. MCET , is a platform for the students to work on the improvement of the community. Team work and Leadership qualities are the two side of NSS.National Service Scheme, is the most active and perseverent organization in the campus in the field of social/community service. We provide opportunities to students to contribute their bit in the welfare of the society from educating the underprivileged to innovating solutions to social problems using technology.",
                      Colors.indigo[200],
                      width,
                      height,
                    ),
                  ),
                  Center(
                    child: _buildWhoCard(
                      'What We Do?',
                      "We aim to bring about a positive change in the society with focus on Education and Development of the underprivileged, conserving Nature and sowing the seeds of Sustainability.More than 150 volunteers guided by a team of 10 members carry out several initiatives throughout the year.We also work in close collaboration with several NGOs and Governmental bodies for reaching out to more and more beneficiaries. Our work continues untill  there are social problems let unsolved",
                      Colors.indigo[200],
                      width,
                      height,
                    ),
                  ),
                  Center(
                    child: _buildWhoCard(
                      'Why We Do?',
                      "Spreading happiness through community service has been one of the primary objectives of NSS.With innovative activities across the departments catering to all classes of the campus residents, we try to create small, happy and memorable moments in their lives.And working in NSS itself has been one of the prime sources of happiness for the people associated with us. We want this nation to be a community of active people who serve their duty as an Indian and improving its weakness",
                      Colors.indigo[200],
                      width,
                      height,
                    ),
                  ),
                ],
              ),
              CustomAppBar(title: 'About'),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(46.0),
      //     ),
      //     color: Colors.white,
      //   ),
      //   padding: const EdgeInsets.all(10),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       FlatButton(
      //         child: Text('BACK',
      //             style: TextStyle(
      //               color: Colors.indigoAccent,
      //             )),
      //         onPressed: () => Navigator.of(context).pop(),
      //       ),
      //     ],
      //   ),
      // ),
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

  Widget _buildWhoCard(
      String title, String content, Color color, double width, double height) {
    return Container(
      width: width * 0.8,
      height: height * 0.7,
      child: Card(
        elevation: 6.0,
        color: color,
        shadowColor: color.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Container(
          width: double.infinity,
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'BebasNeue',
                      letterSpacing: 2,
                      wordSpacing: 3.5)),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              width: width * 0.8,
              alignment: Alignment.center,
              child: Text(content,
                  style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Monserrat')),
            ),
          ]),
        ),
      ),
    );
  }
}
