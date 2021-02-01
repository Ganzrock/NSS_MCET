import 'package:flutter/material.dart';
import '../../providers/gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // SizedBox(height: 180),
                        Padding(
                          padding: EdgeInsets.only(top: height / (height / 20)),
                          child: Text(
                            planetInfo.name,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 41,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          'NSS-MCET',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 21,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: height / (height / 10)),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height / (height / 10)),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: height / (height / 20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gallery',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 25,
                            color: const Color(0xff47455f),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Hero(
                            tag: planetInfo.position,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: height / (height / 10),
                                  right: height / (height / 20)),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 55,
                                backgroundImage:
                                    AssetImage(planetInfo.iconImage),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                      height: height * 0.70,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                          itemCount: planetInfo.images.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(
                                    planetInfo.images[index],
                                    fit: BoxFit.cover,
                                  )),
                            );
                          })

                      //  ListView.builder(
                      //     itemCount: planetInfo.images.length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (context, index) {
                      //       return Card(
                      //         clipBehavior: Clip.antiAlias,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(24),
                      //         ),
                      //         child: AspectRatio(
                      //             aspectRatio: 1,
                      //             child: Image.network(
                      //               planetInfo.images[index],
                      //               fit: BoxFit.cover,
                      //             )),
                      //       );
                      //     }),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        child: GestureDetector(
                      onTap: () {
                        launch("");
                      },
                      child: Center(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.indigo[800]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "More",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   right: -64,
            //   child:
            // ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
