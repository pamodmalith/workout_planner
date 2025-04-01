import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/model/exercise_model.dart';
import 'package:workout_planner/widgets/exercise_card.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDescription;
  final List<Exercise> exerciseList;

  const ExerciseDetailsPage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  // Date Time Format
  final DateFormat dateFormat = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  final userData = user;

  @override
  Widget build(BuildContext context) {
    // Date Time
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${formattedDate.toUpperCase()} $formattedDay",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kSubtitleColor,
              ),
            ),
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: kMainBlackColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.exerciseDescription,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor,
                ),
              ),
              SizedBox(height: kDefaultPadding),

              // Grid View
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                ),
                itemCount: widget.exerciseList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExerciseCard(
                    title: widget.exerciseList[index].exerciseName,
                    imageUrl: widget.exerciseList[index].exerciseImageUrl,
                    description:
                        "${widget.exerciseList[index].noOfMinutes} mins of workout",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
