import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:provider/provider.dart';

import '../custom_appbar.dart';
import './post_card.dart';
import 'list_card.dart';

class PostCards extends StatelessWidget {
  static const routeName = 'user-articles';
  List articles = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<Articles>(
      builder: (_, a, child) {
        articles = a.userArticles;
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Your Articles', style: theme.textTheme.headline1),
          //   backgroundColor: Colors.white,
          //   leading: IconButton(
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.indigo,
          //     ),
          //     onPressed: () => Navigator.of(context).pop(),
          //   ),
          // ),
          body: SafeArea(
            child: Stack(
              children: [
                articles.length == 0
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 20.0),
                          Text('Please wait.. We are reaching the servers!'),
                        ],
                      ))
                    : ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              if (index == 0) SizedBox(height: 70),
                              PostCard(
                                articles[index].imageUrl,
                                articles[index].title,
                                articles[index].author,
                                articles[index].content,
                                articles[index].userImage,
                                articles[index].time,
                                articles[index].id,
                                articles[index].views,
                                articles[index].favorite,
                                articles[index].bookmarks,
                                articles[index].likes,
                                articles[index].isMe,
                                articles[index].isBookmark,
                                articles[index].isFav,
                              ),
                            ],
                          );
                        },
                      ),
                CustomAppBar(
                  title: 'My Articles',
                  backButton: true,
                  showNotify: false,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
