import 'package:flutter/material.dart';

class GalleryListItem extends StatelessWidget {
  final String imageUrl;

  GalleryListItem(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.all(deviceWidth * 0.0125),
      color: Colors.indigoAccent[200],
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: deviceWidth / 2.55,
        height: deviceHeight / 5,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
    );
  }
}
