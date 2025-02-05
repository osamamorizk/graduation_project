class UserDataFormModel {
  final int id;
  final int gender;
  final int age;
  final int height;
  final int weight;
  final int fitnessLevel;
  final int weeklyWorkoutDays;
  final int preferredDiet;
  final int goal;
  final String dietaryRestrictions;
  final String workoutDuration;

  final String medicalConditions;

  UserDataFormModel({
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

  factory UserDataFormModel.fromJson(Map<String, dynamic> json) {
    return UserDataFormModel(
      id: json['id'],
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
