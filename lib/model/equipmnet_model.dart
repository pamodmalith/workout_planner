class Equipment {
  final int id;
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  final bool handOver;

  Equipment({
    required this.id,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.handOver,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Equipment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
