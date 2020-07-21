import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding * 0.2),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.4 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 95.0, top: 5),
                  child: Text(
                    'Hello Shafi,',
                    style: theme.textTheme.headline5.copyWith(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),

                Spacer(),

                //Image.asset()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 88.0, left: 48),
            child: Row(
              children: [
                Text(
                  "Welcome Back,These are Some \n            of our Contributions",
                  style: theme.textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
