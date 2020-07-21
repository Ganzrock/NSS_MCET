import 'package:flutter/material.dart';

import '../constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                FeaturePlantCard(
                  image: "assets/images/gall.jpg",
                  press: () {},
                  name: "",
                ),
                FeaturePlantCard(
                  image: "assets/images/teaam.jpg",
                  press: () {},
                  name: "",
                ),
              ],
            ),
            Row(
              children: <Widget>[
                FeaturePlantCard(
                  image: "assets/images/suggest.jpg",
                  press: () {},
                  name: "",
                ),
                FeaturePlantCard(
                  image: "assets/images/About.jpg",
                  press: () {},
                  name: "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.press,
    this.name,
  }) : super(key: key);
  final String image;
  final Function press;
  final String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
          child: Center(child: Text(name)),
        ),
        margin: EdgeInsets.only(
          left: 62,
          top: kDefaultPadding / 1.3,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.28,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.circular(70),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
     
    );
  }
}
