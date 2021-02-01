import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:flutter_complete_guide/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  Messages({this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    var prevDate = '';
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(),
          );
        }
        return StreamBuilder(
            stream: Firestore.instance
                .collection('chat')
                .orderBy(
                  'createdAt',
                  descending: true,
                )
                .snapshots(),
            builder: (ctx, chatSnapshot) {
              if (chatSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final chatDocs = chatSnapshot.data.documents;
              return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx, index) {
                    final now = DateTime.now();
                    var date = DateTime.parse(chatDocs[index]['createdAt']);
                    var indicator = true;
                    var indicatorText = DateFormat.MMMMd().format(date);
                    String d;
                    dateToString(date) {
                      if (date.day == now.day && date.month == now.month)
                        d = DateFormat.Hm().format(date);
                      else {
                        d = DateFormat.MMMMd().format(date) +
                            '  ' +
                            DateFormat.Hm().format(date);
                      }
                    }

                    dateToString(date);
//Indicating the user for diiferent in time of messages

                    // if (index < chatDocs.length) {
                    //   var date1 =
                    //       DateTime.parse(chatDocs[index + 1]['createdAt']);
                    //   prevDate = dateToString(date1);
                    //   if (prevDate == date)
                    //     indicator = true;
                    //   else
                    //     indicator = false;
                    // }
                    return Column(
                      children: [
                        if (index == chatDocs.length - 1) SizedBox(height: 100),
                        MessageBubble(
                            chatDocs[index]['text'],
                            chatDocs[index]['username'],
                            chatDocs[index]['userImage'],
                            chatDocs[index]['userId'] ==
                                futureSnapshot.data.uid,
                            key: ValueKey(chatDocs[index].documentID),
                            width: width,
                            d: d,
                            indicator: false,
                            indicatorText: indicatorText),
                        if (index == 0) SizedBox(height: 100),
                      ],
                    );
                  });
            });
      },
    );
  }
}
