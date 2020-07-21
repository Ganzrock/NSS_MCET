import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/post_screen.dart';

import 'package:intl/intl.dart';

class ListCard extends StatelessWidget {
  final String title;
  final String author;
  final Timestamp date;
  final String imageUrl;
  final String content;
  final String userImage;

  ListCard(this.author, this.date, this.imageUrl, this.title, this.content,
      this.userImage);

  @override
  Widget build(BuildContext context) {
    final _date = DateFormat.yMMMMd().format(date.toDate()).toString();
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostScreen(
                  author: author,
                  authorImageUrl: userImage,
                  content: content,
                  dateTime: _date,
                  postImageUrl: imageUrl,
                  title: title,
                )));
      },
      child: ListTile(
        leading: Text(_date),
        trailing: Text(
          title,
        ),
      ),
    );
  }
}
