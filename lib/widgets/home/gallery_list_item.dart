import 'package:flutter/material.dart';

class GalleryListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Card(
        margin: EdgeInsets.all(deviceWidth * 0.0125),
        color: Colors.indigoAccent[100],
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              width: deviceWidth * 0.40,
              height: deviceHeight / 40,
              child: FittedBox(
                child: Text(
                  'Republic Day',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: deviceWidth / 2.6,
                height: deviceHeight / 5,
                child: Image.asset(
                  'assets/images/medical_camp.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
          ],
        ));
  }
}
