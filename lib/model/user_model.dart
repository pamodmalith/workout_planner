import 'package:workout_planner/model/equipmnet_model.dart';
import 'package:workout_planner/model/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;
  int totlaExercisesCompleted = 0;
  int totlaEquipmentHandedOver = 0;

  final List<Exercise> exerciseList;
  final List<Exercise> favExerciseList;

  final List<Equipment> equipmentList;
  final List<Equipment> favEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.address,
    required this.description,
    required this.exerciseList,
    required this.favExerciseList,
    required this.equipmentList,
    required this.favEquipmentList,
  });

  // Methods
  // Add Exercise
  void addExercise(Exercise exercise) {
    if (!exerciseList.any((element) => element.id == exercise.id)) {
      exerciseList.add(exercise);
    }
  }

  // Remove Exercise
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  // Add Favorite Exercise
  void addFavoriteExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  // Remove Favorite Exercise
  void removeFavoriteExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  // Add Equipment
  void addEquipment(Equipment equipment) {
    if (!equipmentList.any((element) => element.id == equipment.id)) {
      equipmentList.add(equipment);
    }
  }

  // Remove Equipment
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  // Add Favorite Equipment
  void addFavoriteEquipment(Equipment equipment) {
    if (!favEquipmentList.any((item) => item.id == equipment.id)) {
      favEquipmentList.add(equipment);
    }
  }

  // Remove Favorite Equipment
  void removeFavoriteEquipment(Equipment equipment) {
    favEquipmentList.removeWhere((item) => item.id == equipment.id);
  }
}
