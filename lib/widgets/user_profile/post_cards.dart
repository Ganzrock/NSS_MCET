import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:provider/provider.dart';

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
          appBar: AppBar(
            title: Text('Your Articles', style: theme.textTheme.headline1),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.indigo,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: articles.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (ctx, index) {
                    return PostCard(
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
                      articles[index].isMe,
                      articles[index].isBookmark,
                    );
                  },
                ),
        );
      },
    );
  }
}
