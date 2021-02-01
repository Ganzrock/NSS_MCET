import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_complete_guide/widgets/chat/messages.dart';
import 'package:flutter_complete_guide/widgets/chat/new_message.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/Community';
  static const routeNameWithBackButton = '/Community-with-back-button';
  bool _isEdit = false;

  final bool backButton;

  ChatScreen(this.backButton);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var userImage = '';

  @override
  void initState() {
    super.initState();

    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    });
    fbm.subscribeToTopic('chat');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Community',
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
      backgroundColor: kBackgroundColor.withOpacity(0.12),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: height,
              width: width,
              padding: EdgeInsets.only(bottom: 0.0),
              child: Messages(width: width),
            ),
            NewMessage(
              isEdit: widget._isEdit,
              toggleFunction: toggleEdit,
            ),
            CustomAppBar(
              title: 'Community',
              backButton: widget.backButton,
              showNotify: !widget.backButton,
            )
          ],
        ),
      ),
    );
  }

  void toggleEdit(bool editStatus) {
    setState(() {
      widget._isEdit = editStatus;
    });
  }
}
