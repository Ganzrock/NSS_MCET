import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersScreen extends StatelessWidget {
  static const routeName = '/developers';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final mukeshImage = 'assets/images/mukesh.png';
    final shafiImage = 'assets/images/shafi.png';
    final ganeshImage = 'assets/images/ganesh.png';
    final mukeshProfile = 'https://mukeshnagaraj.github.io/cv';
    final shafiProfile = 'https://shafiudeen-portfolio.web.app';
    final ganeshProfile = 'https://gnanaganesh-resume.web.app';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ListView(
                children: [
                  SizedBox(height: height * 0.055),
                  buildContainer(width, height, 'GNANA GANESH S', 'Developer',
                      ganeshImage, ganeshProfile),
                  SizedBox(height: height * 0.035),
                  buildContainer(width, height, 'SHAFIUDEEN M', 'UI Designer',
                      shafiImage, shafiProfile),
                  SizedBox(height: height * 0.035),
                  buildContainer(width, height, 'MUKESH N', 'UX Designer',
                      mukeshImage, mukeshProfile),
                  // SizedBox(height: height * 0.035),
                ],
              ),
            ),
            // Positioned(
            //   right: width * 0.05,
            //   top: height * 0.1,
            //   child:
            // // ),
            // Positioned(
            //   right: width * 0.05,
            //   top: height * 0.14,
            //   child:
            // ),

            // Positioned(
            //   right: width * 0.05,
            //   top: height * 0.38,
            //   child:
            // ),
            // Positioned(
            //   right: width * 0.05,
            //   top: height * 0.42,
            //   child:
            // )
            // Cust.omAppBar(title:'Developers', back)
            Positioned(
              top: height / (height / 5),
              left: height / (height / 15),
              child: Container(
                width: width * 0.4,
                height: height * 0.05,
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    children: [Icon(Icons.arrow_back_ios), Text('Back')],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(double width, double height, String name, String des,
      String imageUrl, String profileUrl) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyCustomClipper(),
          child: InkWell(
            onTap: () => launch(profileUrl),
            child: Container(
                width: width,
                height: height * 0.27,
                decoration: BoxDecoration(
                  //  backgroundBlendMode:
                  // borderRadius: BorderRadius./
                  color: Colors.black,
                ),
                padding: EdgeInsets.all(height * 0.008),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: height * 0.05),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Orbitron',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      des,
                      style: TextStyle(
                        color: Colors.amber,
                        fontFamily: 'ProductSans',
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    Card(
                      color: Colors.amber,
                      elevation: 20,
                      shadowColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(height * 0.05))),
                      child: Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Positioned(
          top: height * 0.018,
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(
                height / (height / 20),
              ),
            )),
            elevation: 10,
            child: Container(
              width: width * 0.35,
              height: height * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height / (height / 50),
                  ),
                ),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
//  Positioned(
//               right: width * 0.05,
//               top: height * 0.21,
//               child: Container(
//                 width: width * 0.4,
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'Thanks to Flutter and its ability to develop  cross-platform applicationes  in  short time. \n\n Email-ID: gnanaganesh1999@gmail.com',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'MontSerrat',
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.normal,
//                     letterSpacing: 1.3,
//                   ),
//                 ),
//               ),
//             ),
