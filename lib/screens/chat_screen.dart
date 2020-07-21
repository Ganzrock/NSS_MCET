import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';

import 'package:flutter_complete_guide/widgets/chat/messages.dart';
import 'package:flutter_complete_guide/widgets/chat/new_message.dart';
import 'package:flutter_complete_guide/widgets/user_profile/profile_icon.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/Community';
  bool _isEdit = false;

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
      appBar: AppBar(
        title: Text(
          'Community',
          textAlign: TextAlign.left,
          style: theme.textTheme.headline1,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [ProfileIcon(width: width)],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            padding: EdgeInsets.only(bottom: 40.0),
            child: Messages(width: width),
          ),
          NewMessage(
            isEdit: widget._isEdit,
            toggleFunction: toggleEdit,
          ),
        ],
      ),
    );
  }

  void toggleEdit(bool editStatus) {
    setState(() {
      widget._isEdit = editStatus;
    });
  }
}
