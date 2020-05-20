import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/home/gallery_list_item.dart';

class GalleryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildSubtitle('Republic Day'),
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
    );
  }

  Widget _buildSubtitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
