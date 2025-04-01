import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/model/user_model.dart';

User user = User(
  userId: "123456",
  fullName: "John Doe",
  age: 30,
  gender: "Male",
  address: "123 Main St, City, Country",
  description: "Fitness enthusiast",

  exerciseList: [
    ExerciseData().exerciseList[0],
    ExerciseData().exerciseList[1],
  ],

  equipmentList: [
    EquipmentData().equipmentList[0],
    EquipmentData().equipmentList[1],
  ],

  favExerciseList: [ExerciseData().exerciseList[0]],

  favEquipmentList: [EquipmentData().equipmentList[0]],
);
