import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 78, 80, 5),
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
