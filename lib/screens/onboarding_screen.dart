import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'auth_screen.dart';

// Temporibus autem aut\n
// officiis debitis aut rerum\n
// necessitatibus

// Excepteur sint occaecat cupidatat\n
// non proident, sunt in\n
// culpa qui officia

class OnBoardingScreen extends StatefulWidget {
  int page = 1;
  static const routeName = '/onboarding-screen';
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle greyStyle =
      TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
  static const TextStyle whiteStyle = TextStyle(
      fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 40.0,
    color: Colors.white,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );
  static const TextStyle emptyStyle = TextStyle(
    fontSize: 40.0,
    color: Colors.black,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pages = [
    Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 30.0, top: 50.0, bottom: 20.0, right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/nss.png'),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('assets/images/mcet.png',
                      fit: BoxFit.contain),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/m.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "NSS MCET",
                          style: OnBoardingScreen.emptyStyle,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          "Not Me But You",
                          style: OnBoardingScreen.descriptionGreyStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.indigo[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 20.0),
            child: Text(
              "NSS MCET",
              style: OnBoardingScreen.goldcoinGreyStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/log.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN",
                        style: OnBoardingScreen.greyStyle,
                      ),
                      Text(
                        "Details",
                        style: OnBoardingScreen.boldStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Enter Your\n"
                        "Login Credential\n"
                        "",
                        style: OnBoardingScreen.descriptionGreyStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 20.0),
            child: Text(
              "NSS MCET",
              style: OnBoardingScreen.goldCoinWhiteStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset("assets/images/t1.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BLOOD ",
                        style: OnBoardingScreen.whiteStyle,
                      ),
                      Text(
                        "Request",
                        style: OnBoardingScreen.boldStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Quick\n"
                        "Blood Request in\n"
                        "Emergency Situation",
                        style: OnBoardingScreen.descriptionWhiteStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 20.0),
            child: Text(
              "NSS MCET",
              style: OnBoardingScreen.goldCoinWhiteStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Image.asset("assets/images/t2.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ARTICLE",
                        style: OnBoardingScreen.whiteStyle,
                      ),
                      Text(
                        "Publishing",
                        style: OnBoardingScreen.boldStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Post\n"
                        "Your Creatives \n"
                        "and Innovations",
                        style: OnBoardingScreen.descriptionWhiteStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 50.0, bottom: 20.0),
            child: Text(
              "NSS MCET",
              style: OnBoardingScreen.goldCoinWhiteStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/c1.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COMMUNITY",
                        style: OnBoardingScreen.whiteStyle,
                      ),
                      Text(
                        "Chat",
                        style: OnBoardingScreen.boldStyle,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Share\n"
                        "your Ideas and \n"
                        "Thoughts",
                        style: OnBoardingScreen.descriptionWhiteStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            enableLoop: false,
            fullTransitionValue: 600,
            // enableSlideIcon: true,

            // waveType: WaveType.liquidReveal,
            positionSlideIcon: 0.9,

            onPageChangeCallback: (activePageIndex) {
              print(activePageIndex.toString() + ' ' + widget.page.toString());
              setState(() {
                widget.page = widget.page + 1;
                if (activePageIndex < 4 && activePageIndex < widget.page) {
                  widget.page = activePageIndex;
                }
                // </Widget>if (widget.page == 5) {
                //   Navigator.of(context)
                //       .pushReplacementNamed(AuthScreen.routeName);
                // }
              });

              setState(() {});
            },
            slideIconWidget: InkWell(
              onTap: () {},
              child: Text(
                'Swipe <<  ',
                style: TextStyle(fontFamily: 'Orbitron'),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.03,
            right: (widget.page < 4) ? width * 0.280 : width * 0.335,
            child: (widget.page < 4)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDotContainer(widget.page == 1, height, width),
                      buildDotContainer(widget.page == 2, height, width),
                      buildDotContainer(widget.page == 3, height, width),
                      buildDotContainer(widget.page == 4, height, width),
                    ],
                  )
                : MaterialButton(
                    child: Text('Get Started'),
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(AuthScreen.routeName),
                    color: Colors.white,
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildDotContainer(bool isSelected, double height, double width) {
    print(isSelected);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: isSelected ? width / (width / 10) : width / (width / 15),
      height: isSelected ? height / (height / 10) : height / (height / 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        color: Colors.white,
      ),
    );
  }
}
