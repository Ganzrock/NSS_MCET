import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
    this.width,
    this.date,
  });

  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  final double width;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    var d = '';
    if (date.day == now.day && date.month == now.month)
      d = DateFormat.Hm().format(date);
    else {
      d = DateFormat.MMMEd().format(date) + '  ' + DateFormat.Hm().format(date);
    }
    print(d);

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          // isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            if (isMe)
              Container(
                width: width - (width / 1.47),
                height: 30.0,
                padding: const EdgeInsets.only(bottom: 15.0, left: 4.0),
                child: FittedBox(
                  child: Text(d),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Colors.indigoAccent[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(15),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
                ),
              ),
              width: width / 1.6,
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10.0,
                  left: isMe ? 30.0 : 16.0,
                  right: isMe ? 16.0 : 30.0),
              margin: EdgeInsets.symmetric(
                vertical: 16,
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
                        color: isMe ? Colors.indigo[700] : Colors.white70,
                        fontSize: 12.0,
                        fontFamily: 'MontSerrat'),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.black87 : Colors.white,
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
            if (!isMe)
              Container(
                width: width - (width / 1.47),
                padding: const EdgeInsets.only(bottom: 15.0, right: 4.0),
                child: FittedBox(
                  child: Text(d),
                ),
              ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : (width / 1.6) - 20,
          right: isMe ? (width / 1.6) - 20 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
