import 'package:flutter/material.dart';

class NewArticle extends StatelessWidget {
  static const routeName = '/new-article';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Article'),
      ),
      body: Center(
        child: Text('New Article Page'),
      ),
    );
  }
}
