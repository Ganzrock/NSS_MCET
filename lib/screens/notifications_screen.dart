import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Notifications',
      //       style: TextStyle(
      //         color: Colors.white,
      //       )),
      //   backgroundColor: Colors.indigo,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     ),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: Text('No Notifications'),
              ),
            ),
            CustomAppBar(
              title: 'Notifications',
              backButton: true,
              showNotify:false,
            ),
          ],
        ),
      ),
    );
  }
}
