class UserModel {
  final int id;
  final int gender;
  final int age;
  final int height;
  final int weight;
  final int fitnessLevel;
  final int weeklyWorkoutDays;
  final String workoutDuration;
  final int goal;
  final String dietaryRestrictions;
  final int preferredDiet;
  final String medicalConditions;

  UserModel({
    required this.id,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.fitnessLevel,
    required this.weeklyWorkoutDays,
    required this.workoutDuration,
    required this.goal,
    required this.dietaryRestrictions,
    required this.preferredDiet,
    required this.medicalConditions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      gender: json['gender'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      fitnessLevel: json['fitnessLevel'],
      weeklyWorkoutDays: json['weeklyWorkoutDays'],
      workoutDuration: json['workoutDuration'],
      goal: json['goal'],
      dietaryRestrictions: json['dietaryRestrictions'],
      preferredDiet: json['preferredDiet'],
      medicalConditions: json['medicalConditions'],
    );
  }
}
