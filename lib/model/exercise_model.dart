class Exercise {
  final int id;
  final String exerciseName;
  final String exerciseImageUrl;
  final int noOfMinutes;
  bool completed;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.completed,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Exercise && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
