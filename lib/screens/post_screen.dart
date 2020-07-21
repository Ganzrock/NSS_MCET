import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  final String title;
  final String postImageUrl;
  final String content;
  final String author;
  final String authorImageUrl;
  final String dateTime;
  final String id;
  int views;
  final bool isMe;
  PostScreen({
    this.author,
    this.authorImageUrl,
    this.content,
    this.dateTime,
    this.postImageUrl,
    this.title,
    this.id,
    this.views,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    final dWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    print(id);
    Provider.of<Articles>(context, listen: false).updateViews(id, views + 1);
    var headerText;
    if (title.length < 40) {
      headerText = title;
    } else {
      headerText = author + ''' 's Article''';
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: FittedBox(
              child: Text(headerText, style: theme.textTheme.headline1)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.indigo,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [
            isMe
                ? DropdownButton(
                    underline: Container(),
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black87,
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.feedback),
                              SizedBox(width: 8),
                              Text('Edit'),
                            ],
                          ),
                        ),
                        value: 'edit',
                      ),
                      DropdownMenuItem(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.exit_to_app),
                              SizedBox(width: 8),
                              Text('Delete'),
                            ],
                          ),
                        ),
                        value: 'delete',
                      ),
                    ],
                    onChanged: (itemIdentifier) {
                      if (itemIdentifier == 'delete') {}
                      if (itemIdentifier == 'edit') {}
                    },
                  )
                : Container()
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Column(children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: dWidth * 0.98,
                  height: dWidth * 0.75,
                  child: Image.network(postImageUrl, fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  width: dWidth * 0.95,
                  height: dWidth * 0.2,
                  child: Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'BebasNeue',
                        fontSize: 20.0,
                        letterSpacing: 1.0,
                        wordSpacing: 3.0,
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.center,
                  width: dWidth * 0.85,
                  child: Text(
                    content,
                    style: theme.textTheme.headline3,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: [
                        FittedBox(
                          child: Text(
                            'Written By',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        FittedBox(
                          child: Text(
                            author,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(authorImageUrl),
                      radius: 20.0,
                    ),
                    Column(
                      children: [
                        FittedBox(
                          child: Text('Posted on',
                              style: theme.textTheme.headline2),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        FittedBox(
                          child: Text(
                            '$dateTime',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ])),
        ));
  }
}
