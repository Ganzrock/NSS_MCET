import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
    this.width,
    this.d,
    this.indicator,
    this.indicatorText,
  });

  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  final double width;
  final String d;
  final bool indicator;
  final String indicatorText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            // isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              if (indicator) SizedBox(height: 70),
              Container(
                decoration: BoxDecoration(
                  color: isMe
                      ? Colors.indigo[200].withOpacity(0.5)
                      : Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(15),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(15),
                  ),
                ),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color.fromRGBO(68, 80, 226, 0.9),
                //       Color.fromRGBO(110, 38, 199, 0.9),
                //       // gradientStartColor,
                //       // gradientEndColor,
                //     ],
                //   ),
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(55.0),
                //   ),
                // ),
                width: width / 1.9,
                padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10.0,
                    left: isMe ? 30.0 : 16.0,
                    right: isMe ? 16.0 : 30.0),
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isMe ? Colors.white : Colors.indigo[600],
                          fontSize: 12.0,
                          fontFamily: 'MontSerrat'),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      message,
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black87,
                        fontSize: 13.0,
                        fontFamily: 'MontSerrat',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    // Row(
                    //   children: [
                    //     Text(date.toString()),
                    //   ],
                    // )
                  ],
                ),
              ),
              Container(
                width: width - (width / 1.47),
                height: 30.0,
                padding: const EdgeInsets.only(bottom: 15.0, right: 4.0),
                child: FittedBox(
                  child: Text(d,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: 'MontSerrat',
                      )),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: indicator ? 70 : 0,
          left: isMe ? null : (width / 1.9) - 20,
          right: isMe ? (width / 1.9) - 20 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
        if (indicator)
          Positioned(
            top: 0.0,
            left: width / 2 - 20,
            child: Container(
              color: kBackgroundColor,
              child: Text(
                indicatorText,
                style: TextStyle(
                  color: secondaryTextColor,
                ),
              ),
            ),
          ),
      ],
      overflow: Overflow.visible,
    );
  }
}
