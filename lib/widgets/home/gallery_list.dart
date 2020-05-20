import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/home/gallery_list_item.dart';

class GalleryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              GalleryListItem(),
              GalleryListItem(),
            ],
          ),
          Row(
            children: <Widget>[
              GalleryListItem(),
              GalleryListItem(),
            ],
          ),
          Row(
            children: <Widget>[
              GalleryListItem(),
              GalleryListItem(),
            ],
          ),
        ],
      ),
    );
  }
}
