import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class Article {
  final String author;
  final int views;
  final String content;
  final String imageUrl;
  final String time;
  final String title;
  final String userImage;
  final List<String> bookmarks;
  final int favorite;
  final bool isBookmark;
  final bool isMe;
  final String userId;
  final String id;

  Article({
    @required this.id,
    @required this.author,
    @required this.views,
    @required this.content,
    @required this.imageUrl,
    @required this.time,
    @required this.title,
    @required this.userImage,
    @required this.favorite,
    @required this.isBookmark,
    @required this.isMe,
    @required this.userId,
    @required this.bookmarks,
  });
}

class Articles with ChangeNotifier {
  final String uid;

  Articles(this.uid);

  List<Article> _userArticles = [];
  List<Article> _allArticles = [];
  List<Article> _bookmarkArticles = [];

  Future<List<Article>> fetchAndSetArticles() async {
    _userArticles = [];
    _allArticles = [];
    _bookmarkArticles = [];
    final articlesData = await Firestore.instance
        .collection('articles')
        .orderBy(
          'createdAt',
          descending: true,
        )
        .getDocuments();

    articlesData.documents.forEach((article) {
      List<String> bookMarks = [];
      if (article['bookmarks'] != null)
        article['bookmarks'].forEach((b) => bookMarks.add(b.toString()));
      final isbookmark = bookMarks.contains(uid);
      _allArticles.add(
        Article(
          author: article['author'],
          bookmarks: bookMarks,
          content: article['content'],
          favorite: article['favorite'],
          imageUrl: article['image_url'],
          isBookmark: isbookmark,
          isMe: article['user-id'] == uid,
          time: article['time'].toString(),
          title: article['title'],
          userImage: article['user_image'],
          views: article['views'],
          id: article['id'],
          userId: article['user-id'],
        ),
      );

      if (article['user-id'] == uid) {
        _userArticles.add(
          Article(
            author: article['author'],
            bookmarks: bookMarks,
            content: article['content'],
            favorite: article['favorite'],
            imageUrl: article['image_url'],
            isBookmark: isbookmark,
            isMe: article['user-id'] == uid,
            time: article['time'],
            title: article['title'],
            userImage: article['user_image'],
            views: article['views'],
            id: article['id'],
            userId: article['user-id'],
          ),
        );
      }

      if (bookMarks.contains(uid)) {
        _bookmarkArticles.add(
          Article(
            author: article['author'],
            bookmarks: bookMarks,
            content: article['content'],
            favorite: article['favorite'],
            imageUrl: article['image_url'],
            isBookmark: isbookmark,
            isMe: article['user-id'] == uid,
            time: article['time'],
            title: article['title'],
            userImage: article['user_image'],
            views: article['views'],
            id: article['id'],
            userId: article['user-id'],
          ),
        );
      }
    });

    final articles = _allArticles;
    notifyListeners();
    return articles;
  }

  Future<void> createArticle(String author, String userImageUrl, String title,
      String content, int uArticleCount, File image) async {
    final date = DateTime.now().toString();
    final ref = FirebaseStorage.instance
        .ref()
        .child('article_image')
        .child(author)
        .child(uid + '$date.jgp');

    await ref.putFile(image).onComplete;

    final url = await ref.getDownloadURL();
    final id = date + uid;
    await Firestore.instance.collection('articles').document(id).setData({
      'author': author,
      'id': id,
      'title': title,
      'content': content,
      'image_url': url,
      'views': 0,
      'time': date,
      'user_image': userImageUrl,
      'createdAt': DateTime.now().toString(),
      'user-id': uid,
      'bookmarks': [""],
      'favorite': 0,
    });

    await Firestore.instance
        .collection('users')
        .document(uid)
        .updateData({'noOfPost': uArticleCount + 1});
  }

  Future<void> updateViews(String id, int view) async {
    await Firestore.instance
        .collection('articles')
        .document(id)
        .updateData({'views': view});
    fetchAndSetArticles();
  }

  Future<void> deletePost(String id) async {
    await Firestore.instance.collection('articles').document(id).delete();
    fetchAndSetArticles();
  }

  Future<void> changeBookmark(String articleId, List<String> bookmarks) async {
    await Firestore.instance
        .collection('articles')
        .document(articleId)
        .updateData({
      'bookmarks': bookmarks,
    });
    fetchAndSetArticles();
  }

  List<Article> get allArticles {
    final articles = _allArticles;
    return articles;
  }

  List<Article> get userArticles {
    final articles = _userArticles;
    return articles;
  }

  List<Article> get bookmarkArticles {
    final articles = _bookmarkArticles;
    return articles;
  }
}
