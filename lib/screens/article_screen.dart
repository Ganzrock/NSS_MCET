import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/new_article.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:flutter_complete_guide/widgets/user_profile/post_card.dart';
import 'package:flutter_complete_guide/widgets/user_profile/profile_icon.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  static const routeName = '/articles';

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<Article> articles = [];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    return Consumer<Articles>(
      builder: (_, a, child) {
        articles = a.allArticles;
        return Scaffold(
          appBar: AppBar(
            title: Text('Articles', style: theme.textTheme.headline1),
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              ProfileIcon(width: width),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo[400].withOpacity(0.96),
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
            isExtended: false,
            mini: true,
            tooltip: 'Write Your Article',
            elevation: 2.0,
            focusColor: Colors.indigo.withOpacity(0.5),
            // onPressed: () {},
            onPressed: () =>
                Navigator.of(context).pushNamed(NewArticle.routeName),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
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
