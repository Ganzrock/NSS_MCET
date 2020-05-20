import 'package:flutter/material.dart';

import 'achievement_card.dart';

class Contributions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          AchievementCard(
            'assets/images/plant.png',
            'Tree Plantation',
            '200',
          ),
          AchievementCard(
            'assets/images/school.png',
            'Visited Schools',
            '40',
          ),
          AchievementCard(
            'assets/images/blood_camp.png',
            'Blood Camps',
            '200',
          ),
          AchievementCard(
            'assets/images/village.png',
            'Visited Villages',
            '10',
          ),
          AchievementCard(
            'assets/images/rally.png',
            'Rally',
            '200',
          ),
          AchievementCard(
            'assets/images/medical_camp.png',
            'Medical Camps',
            '200',
          ),
        ],
      ),
    );
  }
}
