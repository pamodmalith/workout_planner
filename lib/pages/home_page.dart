import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipments_details_page.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Date Time Format
  final DateFormat dateFormat = DateFormat('EEEE, MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  // User Data
  final userData = user;

  // exercise & equipment list
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = dateFormat.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
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
                  userData.fullName,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                ProgressCard(progressValue: 0.5, total: 100),
                SizedBox(height: kDefaultPadding),
                Text(
                  "Today’s Activity",
                  style: TextStyle(
                    // color: kMainBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ExerciseDetailsPage(
                                  exerciseTitle: "Warmups",
                                  exerciseDescription:
                                      "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                  exerciseList: exerciseList,
                                ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Warm Up",
                        imageUrl: "assets/images/exercises/cobra.png",
                        description: "see more...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => EquipmentsDetailsPage(
                                  equipmentTitle: "Equipments",
                                  equipmentDescription:
                                      "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                  equipmentList: equipmentList,
                                ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Equipment",
                        imageUrl: "assets/images/equipments/dumbbells2.png",
                        description: "see more...",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ExerciseDetailsPage(
                                  exerciseTitle: "Exercise",
                                  exerciseDescription:
                                      "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                  exerciseList: exerciseList,
                                ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Exercise",
                        imageUrl: "assets/images/exercises/dragging.png",
                        description: "see more...",
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ExerciseDetailsPage(
                                  exerciseTitle: "Streching",
                                  exerciseDescription:
                                      "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                  exerciseList: exerciseList,
                                ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Stretching",
                        imageUrl: "assets/images/exercises/yoga.png",
                        description: "see more...",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
