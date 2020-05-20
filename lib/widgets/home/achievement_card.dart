import 'package:flutter/material.dart';

class AchievementCard extends StatelessWidget {
  final String title;
  final String count;
  final String imageUrl;

  AchievementCard(this.imageUrl, this.title, this.count);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1),
      child: Card(
        semanticContainer: true,
        borderOnForeground: true,
        elevation: 3.0,
        color: Colors.deepOrangeAccent[100],
        child: SingleChildScrollView(
          primary: true,
          scrollDirection: Axis.horizontal,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                width: 100,
                height: 120,
                child: FittedBox(
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      child: Text(title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.5,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      '$count +',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
