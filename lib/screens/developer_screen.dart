import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              width: width * 0.65,
              height: height,
              color: Colors.white,
            ),
            Container(
              width: width * 0.35,
              height: height * 8,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
