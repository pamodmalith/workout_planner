import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/widgets/profile_card.dart';
import 'package:workout_planner/widgets/progress_cart.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Date Time Format
  final DateFormat dateFormat = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  // User Data
  final userData = user;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${formattedDate.toUpperCase()} $formattedDay",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kSubtitleColor,
                  ),
                ),
                Text(
                  "Hello, ${userData.fullName}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Your Progress",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 15),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kCardBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes spent: ${userData.calculateTotalMinutesSpent().toString()}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kMainColor,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Total Exercises Completed: ${userData.totlaExercisesCompleted}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kMainBlackColor,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Total Equipments Handovered: ${userData.totlaEquipmentHandedOver}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kMainBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your Exercises",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: kMainDarkBlueColor,
                  ),
                ),
                SizedBox(height: 10),

                // List of Exercises
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Exercise Data
                    final userExercise = userData.exerciseList[index];
                    return ProfileCard(
                      exerciseName: userExercise.exerciseName,
                      imageUrl: userExercise.exerciseImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markExerciseAsCompleted(userExercise.id);
                        });
                      },
                    );
                  },
                ),

                SizedBox(height: 20),
                Text(
                  "Your Equipments",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: kMainDarkBlueColor,
                  ),
                ),
                SizedBox(height: 10),
                // List of Equipments
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Exercise Data
                    final userEquipments = userData.equipmentList[index];
                    return ProfileCard(
                      exerciseName: userEquipments.equipmentName,
                      imageUrl: userEquipments.equipmentImageUrl,
                      markAsDone: () {
                        setState(() {
                          userData.markAsHandovered(userEquipments.id);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
