import 'package:flutter/material.dart';

import 'blood_request_screen.dart';

class EmergencyScreen extends StatelessWidget {
  static const routeName = '/bookmarks';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(''),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BloodRequestScreen.routeName);
          },
          child: Image.asset(
            'assets/images/blood_drop2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
