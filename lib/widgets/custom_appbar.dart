import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/notifications_screen.dart';

import 'constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  final bool openDrawer;
  final bool showNotify;
  final bool backButton;
  CustomAppBar({
    this.title,
    this.openDrawer = false,
    this.backButton = true,
    this.showNotify = true,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Positioned(
      top: 10.0,
      child: Container(
        width: width,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: height / (height / 15.0)),
          // color: kPrimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          )),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromRGBO(68, 80, 226, 0.9),
                  // Color.fromRGBO(110, 38, 199, 0.9),
                  gradientStartColor,
                  gradientEndColor,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: height / (height / 20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // CircleAvatar(
                //   radius: 20,
                //   backgroundImage: AssetImage("assets/images/nn.png"),
                // ),
                if (backButton)
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                Container(
                  // padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: showNotify ? Colors.white : Colors.transparent,
                      ),
                      onPressed: showNotify
                          ? () => Navigator.of(context)
                              .pushNamed(NotificationScreen.routeName)
                          : () {},
                    ),
                    if (openDrawer)
                      IconButton(
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                  ],
                  // Consumer<UserData>(
                  //   builder: (_, user, child) => InkWell(
                  //     onTap: () {
                  //       Navigator.of(context)
                  //           .pushNamed(ProfilePage.routeName);
                  //     },
                  //     child: Container(
                  //       // margin: EdgeInsets.only(left: width / (width / 80)),
                  //       child: CircleAvatar(
                  //         radius: 16,
                  //         backgroundImage: NetworkImage(user.imageUrl),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
