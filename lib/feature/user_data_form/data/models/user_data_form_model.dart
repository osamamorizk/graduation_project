class UserDataFormModel {
  final String id;
  final String userName;
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

  UserDataFormModel({
    required this.id,
    required this.userName,
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
      id: json['id'] ?? '',
      userName: json['userName'],
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

  Map<String, dynamic> uerFormToJson() {
    return {
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
      'fitnessLevel': fitnessLevel,
      'weeklyWorkoutDays': weeklyWorkoutDays,
      'workoutDuration': workoutDuration,
      'goal': goal,
      'preferredDiet': preferredDiet,
      'dietaryRestrictions': dietaryRestrictions,
      'medicalConditions': medicalConditions,
    };
  }
}
