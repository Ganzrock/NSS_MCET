import 'package:flutter/material.dart';

import '../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/new.jpg",
            title: "Tree Plantation",
            country: "200+",
            press: () {},
          ),
          RecomendPlantCard(
              image: "assets/images/school.jpg",
              title: "School Visit",
              country: "40+",
              // price: 440,
              press: () {}),
          RecomendPlantCard(
            image: "assets/images/blood.jpg",
            title: "Blood Camp",
            country: "200+",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/rally.jpg",
            title: "Rally",
            country: "20+",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/village.jpg",
            title: "Village Visit",
            country: "10+",
            price: 440,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/images/Medical.jpg",
            title: "Medical Camp",
            country: "20+",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
