import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/screens/notifications_screen.dart';
import 'package:flutter_complete_guide/widgets/constants.dart';
import 'package:flutter_complete_guide/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/providers/articles.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/new_article.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import 'package:flutter_complete_guide/widgets/user_profile/large_post_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleScreen extends StatefulWidget {
  static const routeName = '/articles';

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<Article> articles = [];
  List<Article> _articles;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    final noArticles = Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 20.0),
        Text('Please wait.. We are reaching the servers!'),
      ],
    ));
    return FutureBuilder(
      future: Provider.of<UserData>(context, listen: false).setUser().then(
          (value) => Provider.of<Articles>(context, listen: false)
              .fetchAndSetArticles()),
      builder: (_, user) {
        articles = user.data;
        return Scaffold(
          drawer: MainDrawer(),
          backgroundColor: kBackgroundColor.withOpacity(0.12),
          floatingActionButton: Container(
            width: width / (width / 50),
            height: width / (width / 50),
            child: Card(
              elevation: 5.0,
              // color: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(55.0))),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // Color.fromRGBO(68, 80, 226, 0.9),
                      // Color.fromRGBO(110, 38, 199, 0.9),
                      gradientStartColor,
                      gradientEndColor,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(55.0),
                  ),
                ),
                child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.add, size: 18.0),
                    onPressed: () => Navigator.of(context).pushNamed(NewArticle.routeName)),
              ),
            ),
          ),

          //  FloatingActionButton(
          //   backgroundColor: kPrimaryColor,

          //   foregroundColor: Colors.white,
          //   child: Icon(Icons.add),
          //   isExtended: false,
          //   mini: true,
          //   tooltip: 'Write Your Article',
          //   elevation: 20.0,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(8.0),
          //     ),
          //   ),
          //   focusColor: Colors.indigo.withOpacity(0.5),
          //   // onPressed: () {},
          //   onPressed: () =>
          //       Navigator.of(context).pushNamed(NewArticle.routeName),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          // backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                articles == null
                    ? noArticles
                    : articles.length == 0
                        ? noArticles
                        : SmartRefresher(
                            enablePullDown: true,
                            enablePullUp: false,
                            header: WaterDropHeader(),
                            footer: CustomFooter(
                              builder: (BuildContext context, LoadStatus mode) {
                                Widget body;
                                if (mode == LoadStatus.idle) {
                                  body = Text("pull up load");
                                } else if (mode == LoadStatus.loading) {
                                  body = CupertinoActivityIndicator();
                                } else if (mode == LoadStatus.failed) {
                                  body = Text("Load Failed!Click retry!");
                                } else if (mode == LoadStatus.canLoading) {
                                  body = Text("release to load more");
                                } else {
                                  body = Text("No more Data");
                                }
                                return Container(
                                  height: 55.0,
                                  child: Center(child: body),
                                );
                              },
                            ),
                            controller: _refreshController,
                            onRefresh: _onRefresh,
                            onLoading: _onLoading,
                            child: (articles != null || articles.length != 0)
                                ? ListView.builder(
                                    itemCount: articles.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (ctx, index) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: height / (height / 30)),
                                            LargePostCard(
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
                                        ),
                                      );
                                    },
                                  )
                                : Container(),
                          ),
                CustomAppBar(
                  title: 'NSS MCET',
                  openDrawer: true,
                  backButton: false,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    // monitor network fetch

    await Future.delayed(Duration(milliseconds: 1000));
    _articles = await Provider.of<Articles>(context, listen: false)
        .fetchAndSetArticles();
    setState(() {
      if (_articles != null) articles.insertAll(0, _articles);
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _articles = await Provider.of<Articles>(context, listen: false)
        .fetchAndSetArticles();
    if (mounted)
      setState(() {
        if (_articles != null) articles.insertAll(0, _articles);
      });
    _refreshController.loadComplete();
  }
}
