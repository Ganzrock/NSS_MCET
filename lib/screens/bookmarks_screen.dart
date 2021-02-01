import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../widgets/user_profile/post_card.dart';

class BookmarkScreen extends StatelessWidget {
  static const routeName = '/bookmarks';

  static const routeName2 = '/favorites';

  final String route;
  List articles = [];

  BookmarkScreen(this.route);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    return Consumer<Articles>(
      builder: (_, a, child) {
        route == 'bookmarks'
            ? articles = a.bookmarkArticles
            : articles = a.favoriteArticles;
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Bookmarks',
          //       style: TextStyle(
          //         color: Colors.white,
          //       )),
          //   backgroundColor: Colors.indigo,
          //   leading: IconButton(
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.white,
          //     ),
          //     onPressed: () => Navigator.of(context).pop(),
          //   ),
          // ),
          backgroundColor: Colors.indigo[100],
          body: articles.length == 0
              ? SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(40.0),
                        // margin: ,
                        child: Center(
                            child: Text(route == 'bookmarks'
                                ? 'No BookMarks! \n\nYou can add to bookmark for reading later :)'
                                : 'No Favorites! \n\n Your favorite articles will be saved here !')),
                      ),
                      CustomAppBar(
                        title: route == 'bookmarks' ? 'Bookmarks' : 'Favorites',
                        showNotify: false,
                      ),
                    ],
                  ),
                )
              : SafeArea(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              if (index == 0) SizedBox(height: height * 0.09),
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
                        title: route == 'bookmarks' ? 'Bookmarks' : 'Favorites',
                        showNotify: false,
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
