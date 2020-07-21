import 'package:flutter/material.dart';
import '../constants.dart';

import 'contributions.dart';
import 'features.dart';

import 'header_with_welcome.dart';
import 'title_with_swipe_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Contributions", press: () {}),
          RecomendsPlants(),

          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, bottom: 0),
              child: Text(
                "Features",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: kDefaultPadding / 4, left: 28),
              height: 4,
              width: 80,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          ),
          //TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
        ],
      ),
    );
  }
}
