import 'package:flutter/material.dart';

import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/model/equipmnet_model.dart';
import 'package:workout_planner/model/exercise_model.dart';
import 'package:workout_planner/widgets/add_equipment_card.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  // import user data
  final userData = user;

  // exercise & equipment list
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${userData.fullName}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),

                // List of AddExerciseCard
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];

                      return AddExerciseCard(
                        exerciseTitle: exercise.exerciseName,
                        imageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: exercise.noOfMinutes,
                        isAdded: userData.exerciseList.contains(exercise),
                        isFavorite: userData.favExerciseList.contains(exercise),
                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exerciseList.contains(exercise)) {
                              userData.removeExercise(exercise);
                              // print("Exercise Removed: ${userData.exerciseList.last.exerciseName}");
                              return;
                            } else {
                              userData.addExercise(exercise);
                              // print("Exercise Added: ${userData.exerciseList.last.exerciseName}");
                            }
                          });
                        },
                        toggleAddFavoriteExercise: () {
                          setState(() {
                            if (userData.favExerciseList.contains(exercise)) {
                              userData.removeFavoriteExercise(exercise);
                              // print("Favorite Exercise Removed: ${userData.favExerciseList.last.exerciseName}");
                              return;
                            } else {
                              userData.addFavoriteExercise(exercise);
                              // print("Favorite Exercise Added: ${userData.favExerciseList.last.exerciseName}");
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  "All Equipments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: equipmentList.length,
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        equipmentDescription: equipment.equipmentDescription,
                        noOfMinuites: equipment.noOfMinutes,
                        noOfCalories: equipment.noOfCalories,
                        isAdded: userData.equipmentList.contains(equipment),
                        isFavorite: userData.favEquipmentList.contains(
                          equipment,
                        ),
                        toggleAddEquipment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                            // print(userData.equipmentList.length);
                          });
                        },
                        toggleAddFavoriteEquipment: () {
                          setState(() {
                            if (userData.favEquipmentList.contains(equipment)) {
                              userData.removeFavoriteEquipment(equipment);
                            } else {
                              userData.addFavoriteEquipment(equipment);
                            }
                            // print(userData.favEquipmentList.length);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
