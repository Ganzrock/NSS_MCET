import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/home/gallery_list_item.dart';

class GalleryListView extends StatelessWidget {
  final String title;

  GalleryListView(this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSubtitle(title, context),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              GalleryListItem('assets/images/rally.png'),
              GalleryListItem('assets/images/plant.png'),
              GalleryListItem('assets/images/rally.png'),
              GalleryListItem('assets/images/plant.png'),
              GalleryListItem('assets/images/rally.png'),
              GalleryListItem('assets/images/plant.png'),
              GalleryListItem('assets/images/rally.png'),
              GalleryListItem('assets/images/plant.png'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSubtitle(String text, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
    );
  }
}
