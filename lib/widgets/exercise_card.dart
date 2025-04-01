import 'package:flutter/material.dart';

import 'package:workout_planner/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  // final bool showMore;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    // required this.showMore
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.46,
      decoration: BoxDecoration(
        color: kCardBgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(imageUrl, width: 100, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 15, color: kMainColor),
            ),
          ],
        ),
      ),
    );
  }
}
