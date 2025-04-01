import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class ProfileCard extends StatefulWidget {
  final String exerciseName;
  final String imageUrl;
  final void Function() markAsDone;
  const ProfileCard({
    super.key,
    required this.exerciseName,
    required this.imageUrl,
    required this.markAsDone,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Image.asset(widget.imageUrl, width: 50, fit: BoxFit.cover),
            SizedBox(width: 10),
            Text(
              widget.exerciseName,
              style: TextStyle(
                fontSize: 16,
                // color: kMainBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: widget.markAsDone,
              icon: Icon(Icons.check, color: kMainColor),
            ),
          ],
        ),
      ),
    );
  }
}
