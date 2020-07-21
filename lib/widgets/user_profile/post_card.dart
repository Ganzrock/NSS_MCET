import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/screens/post_screen.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';

class PostCard extends StatefulWidget {
  final String articleImageUrl;
  final String articleTitle;
  final String author;
  final String content;
  final String userImage;
  final String time;
  final String id;
  final Key key;
  final int views;
  final int favorite;
  List<String> bookmarks;
  final bool isMe;
  bool isBookmark;

  PostCard(
      this.articleImageUrl,
      this.articleTitle,
      this.author,
      this.content,
      this.userImage,
      this.time,
      this.id,
      this.views,
      this.favorite,
      this.bookmarks,
      this.isMe,
      this.isBookmark,
      {this.key});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final date =
        DateFormat.yMMMMd().format(DateTime.parse(widget.time)).toString();
    var text = '';
    // final cl = widget.content.length;

    // var postHeight = 0.0;
    // if (cl > 150) {
    //   text = widget.content.substring(0, 150) + '. . .';
    // } else if (cl > 0) {
    //   text = widget.content;
    //   if (cl < 36) {
    //     postHeight = 3 * height / (height / 17.0);
    //   } else if (cl < 72) {
    //     postHeight = 2 * height / (height / 17.0);
    //   } else {
    //     postHeight = 1 * height / (height / 15.0);
    //   }
    // } else {
    //   postHeight = height / (height / 75.0);
    // }

    print(widget.id);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PostScreen(
                  author: widget.author,
                  authorImageUrl: widget.userImage,
                  content: widget.content,
                  dateTime: date,
                  postImageUrl: widget.articleImageUrl,
                  title: widget.articleTitle,
                  id: widget.id,
                  views: widget.views,
                )));
      },
      child: Container(
        width: width,
        // height: (height / 2) - postHeight + 45.0,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          margin: EdgeInsets.symmetric(
              vertical: height / (height / 6.0),
              horizontal: width / (width / 8.0)),
          child: Column(
            children: <Widget>[
              Container(
                height: height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.articleImageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FittedBox(
                            child: Text(
                              widget.articleTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                              maxLines: 3,
                              semanticsLabel: 'Title',
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Row(
                            children: <Widget>[
                              FittedBox(
                                child: Text(
                                  'by ${widget.author}',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 11.0),
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Icon(
                                Icons.person,
                                size: 4.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 4.0),
                              FittedBox(
                                child: Text(
                                  date,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 11.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      // onTap: () {
                      //   Navigator.of(context).pushNamed(ProfilePage.routeName2);
                      // },
                      child: Container(
                        height: height / (height / 40.0),
                        width: width / (width / 40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                            image: NetworkImage(widget.userImage),
                          ),
                        ),
                        // child: Image.network(
                        //   userImage,
                        //   fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / (height / 5.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            ' ${widget.views}',
                            style: TextStyle(
                              fontFamily: 'Lemonada',
                              fontSize: 13.0,
                            ),
                          ),
                          SizedBox(width: 3.0),
                          Icon(Icons.touch_app, size: 14.0),
                          SizedBox(width: 7.0),
                          Text(
                            ' ${widget.favorite}',
                            style: TextStyle(
                              fontFamily: 'Lemonada',
                              fontSize: 13.0,
                            ),
                          ),
                          SizedBox(width: 3.0),
                          Icon(Icons.favorite_border, size: 14.0),
                        ],
                      ),
                      ButtonBar(
                        children: [
                          IconButton(
                            icon: widget.isBookmark
                                ? Icon(Icons.bookmark, size: 17.0)
                                : Icon(Icons.bookmark_border, size: 17.0),
                            onPressed: () {
                              final userId =
                                  Provider.of<UserData>(context, listen: false)
                                      .uId;

                              widget.isBookmark
                                  ? widget.bookmarks.removeWhere(
                                      (bookmark) => bookmark == userId)
                                  : widget.bookmarks.add(userId);

                              setState(() {
                                widget.isBookmark = !widget.isBookmark;
                              });
                              Provider.of<Articles>(context, listen: false)
                                  .changeBookmark(widget.id, widget.bookmarks);
                            },
                          ),
                          if (widget.isMe)
                            IconButton(
                                icon: Icon(Icons.more_vert, size: 17.0),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                      ),
                                      content: RaisedButton(
                                          child: Text('Delete Post'),
                                          color: Colors.indigo,
                                          onPressed: () {
                                            Provider.of<Articles>(context,
                                                    listen: false)
                                                .deletePost(widget.id);
                                            Navigator.of(context).pop();
                                          }),
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
