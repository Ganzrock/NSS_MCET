import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:flutter_complete_guide/screens/user_details_screen.dart';
import 'package:provider/provider.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Opacity(
        opacity: 0.89,
        child: Consumer<UserData>(
          builder: (_, user, child) => Container(
            padding: EdgeInsets.symmetric(vertical: width / (width / 40)),
            margin: EdgeInsets.only(right: width / (width / 10)),
            width: width / (width / 25),
            height: width / (width / 50),
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(user.imageUrl)),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(55))),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ProfilePage.routeName);
      },
    );
  }
}
