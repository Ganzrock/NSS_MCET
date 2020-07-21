import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/user_details.dart';
import 'package:provider/provider.dart';
import '../widgets/nss_home/body.dart';

class NssHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(width),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(double width) {
    return AppBar(
      elevation: 0,
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/nn.png"),
          ),
          Container(
              padding: const EdgeInsets.all(10.0), child: Text('NSS MCET')),
          Consumer<UserData>(
            builder: (_, user, child) => Container(
              margin: EdgeInsets.only(left: width / (width / 130)),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user.imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}
