import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import '../widgets/gallery/single_page.dart';
import '../widgets/constants.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../providers/gallery.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = '/gallery';
  static const routeNameWithBackButton = '/gallery-with-back-button';

  int currentPage = 1;
  final bool backButton;

  GalleryScreen(this.backButton);
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.12),
      body: Container(
        child: SafeArea(
          child: Stack(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //     // Padding(
              //     //   padding: const EdgeInsets.all(32.0),
              //     //   child: Column(
              //     //     children: <Widget>[
              //     //       Padding(
              //     //         padding: const EdgeInsets.only(top: 20),
              //     //         child: Center(
              //     //           child: Text(
              //     //             'GALLERY',
              //     //             style: TextStyle(
              //     //               fontFamily: 'Avenir',
              //     //               fontSize: 44,
              //     //               color: Colors.grey[100],
              //     //               fontWeight: FontWeight.w900,
              //     //             ),
              //     //             textAlign: TextAlign.left,
              //     //           ),
              //     //         ),
              //     //       ),
              //     //     ],
              //     //   ),
              //     // ),
              //     // SizedBox(height: size.height / (size.height / 65)),
              Container(
                height: size.height,
                padding: const EdgeInsets.only(left: 32),
                color: kPrimaryColor.withOpacity(0.02),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: size.width - (size.width / (size.width / 128)),
                  layout: SwiperLayout.STACK,
                  itemHeight: height,
                  autoplay: true,
                  autoplayDisableOnInteraction: true,
                  autoplayDelay: 5000,
                  containerHeight: height * 0.8,
                  containerWidth: width * 0.8,
                  // loop: false,
                  // indicatorLayout: PageIndicatorLayout(),
                  // control: SwiperPlugin(),
                  duration: 700,
                  // outer: true,
                  onIndexChanged: (ind) => setState(() {
                    widget.currentPage = ind + 1;
                  }),
                  // itemWidth: width * 0.8,
                  itemBuilder: (context, index) {
                    widget.currentPage = index + 1;

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              Container(
                                height: height * 0.55,
                                width: width * 0.80,
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              size.height / (size.height / 80),
                                        ),
                                        Text(
                                          planets[index].name,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 24,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                            height: size.height /
                                                (size.height / 15)),
                                        Text(
                                          planets[index].description ?? '',
                                          maxLines: 8,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: 'MontSerrat',
                                            fontSize: 14,
                                            color: contentTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                            height: size.height /
                                                (size.height / 15)),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: width * 0.12,
                            top: height * 0.12,
                            child: Hero(
                              tag: planets[index].position,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    AssetImage(planets[index].iconImage),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              CustomAppBar(
                title: 'Event Gallery',
                backButton: widget.backButton,
                showNotify: !widget.backButton,
              ),
              // Positioned(
              //   bottom: 10.0,
              //   child: Row(
              //     children: [
              //       InkWell(
              //         onTap: () => Navigator.push(
              //           context,
              //           PageRouteBuilder(
              //             pageBuilder: (context, a, b) => DetailPage(
              //               planetInfo: planets[0],
              //             ),
              //           ),
              //         ),
              //         child: Container(
              //           width: width / 2,
              //           height: height / (height / 100),
              //           child: Card(
              //             child: Row(
              //               children: [
              //                 Icon(Icons.arrow_back_ios),
              //                 Text('PREV'),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
              Positioned(
                bottom: height * 0.03,
                left: width * 0.470,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     buildDotContainer(true, height, width),
                //     buildDotContainer(true, height, width),
                //     buildDotContainer(true, height, width),
                //     buildDotContainer(true, height, width),
                //   ],
                // ),

                child: Text('${widget.currentPage} / 9'),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.vertical(
        //       top: Radius.circular(46.0),
        //     ),
        //     color: navigationColor,
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
      ),
    );
  }

  Widget buildDotContainer(bool isSelected, double height, double width) {
    // prin+ t(isSelected);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: isSelected ? width / (width / 10) : width / (width / 20),
      height: isSelected ? height / (height / 10) : height / (height / 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
        color: isSelected ? kPrimaryColor : secondaryTextColor,
      ),
    );
  }
}
