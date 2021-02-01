import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/screens/post_screen.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';

import '../constants.dart';

class LargePostCard extends StatefulWidget {
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
  List<String> likes;
  final bool isMe;
  bool isBookmark;
  bool isFav;

  LargePostCard(
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
      this.likes,
      this.isMe,
      this.isBookmark,
      this.isFav,
      {this.key});

  @override
  _LargePostCardState createState() => _LargePostCardState();
}

class _LargePostCardState extends State<LargePostCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final date =
        DateFormat.yMMMMd().format(DateTime.parse(widget.time)).toString();
    var noOfCharacters = widget.content.length;
    String smallContent;
    var minRead = (noOfCharacters / 400).round();
    if (widget.content.length > 150)
      smallContent = widget.content.substring(0, 150) + ' [...]';
    else
      smallContent = widget.content;
    // final min = int.parse(minRead.toString());Read
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
                  isFav: widget.isFav,
                  likes: widget.likes,
                )));
      },
      child: Container(
        width: width * 0.87,
        height: (height / 1.35),
        // color: gradientEndColor,
        margin: EdgeInsets.only(top: height / (height / 50)),
        child: Stack(
          children: [
            Container(
              height: (height * 0.85),
              child: Card(
                elevation: 12,
                color: kPrimaryColor.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                margin: EdgeInsets.symmetric(horizontal: width / (width / 8.0)),
                child: Opacity(
                  opacity: 0.87,
                  child: Container(
                    // height: height / 1.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      // only(
                      //     topLeft: Radius.circular(25.0),
                      //     topRight: Radius.circular(25.0))
                      //     ,
                      image: DecorationImage(
                          image: NetworkImage(widget.articleImageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width * 0.87,
                height: height / (height / 270),
                margin: EdgeInsets.only(bottom: height / (height / 30)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.65,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 15.0),
                            child: Text(
                              widget.articleTitle,
                              // maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                              maxLines: 2,
                              semanticsLabel: 'Title',
                            ),
                          ),
                          // InkWell(
                          //   // onTap: () {
                          //   //   Navigator.of(context).pushNamed(ProfilePage.routeName2);
                          //   // },
                          //   child: Container(
                          //     height: height / (height / 40.0),
                          //     width: width / (width / 40.0),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          //       image: DecorationImage(
                          //         image: NetworkImage(widget.userImage),
                          //       ),
                          //     ),
                          //     // child: Image.network(
                          //     //   userImage,
                          //     //   fit: BoxFit.cover,
                          //   ),
                          // ),

                          SizedBox(height: height / (height / 5.0)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              smallContent,
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(height: height / (height / 15.0)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    '${widget.author}',
                                    style: TextStyle(
                                      color: secondaryTextColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    date,
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: width / (width / 2.0)),
                                      Icon(Icons.remove_red_eye, size: 15.0),
                                      SizedBox(width: width / (width / 2.0)),
                                      Text(
                                        ' ${widget.views}',
                                        style: TextStyle(
                                          fontFamily: 'Lemonada',
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      SizedBox(width: width / (width / 10.0)),
                                      Icon(
                                          widget.isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          size: 14.0),
                                      SizedBox(width: width / (width / 2.0)),
                                      Text(
                                        ' ${widget.favorite}',
                                        style: TextStyle(
                                          fontFamily: 'Lemonada',
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (minRead > 0)
                                    SizedBox(width: width / (width / 10.0)),
                                  if (minRead > 0) Text('$minRead min'),
                                  ButtonBar(
                                    children: [
                                      IconButton(
                                        icon: widget.isBookmark
                                            ? Icon(Icons.bookmark, size: 17.0)
                                            : Icon(Icons.bookmark_border,
                                                size: 17.0),
                                        onPressed: () {
                                          final userId = Provider.of<UserData>(
                                                  context,
                                                  listen: false)
                                              .uId;

                                          widget.isBookmark
                                              ? widget.bookmarks.removeWhere(
                                                  (bookmark) =>
                                                      bookmark == userId)
                                              : widget.bookmarks.add(userId);

                                          setState(() {
                                            widget.isBookmark =
                                                !widget.isBookmark;
                                          });
                                          Provider.of<Articles>(context,
                                                  listen: false)
                                              .changeBookmark(
                                                  widget.id, widget.bookmarks);
                                        },
                                      ),
                                      if (widget.isMe)
                                        IconButton(
                                            icon: Icon(Icons.more_vert,
                                                size: 17.0),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                  ),
                                                  content: RaisedButton(
                                                      child:
                                                          Text('Delete Post'),
                                                      color: Colors.indigo,
                                                      onPressed: () {
                                                        Provider.of<Articles>(
                                                                context,
                                                                listen: false)
                                                            .deletePost(
                                                                widget.id);
                                                        Navigator.of(context)
                                                            .pop();
                                                      }),
                                                ),
                                              );
                                            }),
                                    ],
                                  ),
                                ]),
                          ),
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
