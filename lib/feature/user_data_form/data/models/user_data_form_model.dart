class UserDataFormModel {
  final int gender;
  final int age;
  final int height;
  final int weight;
  final int fitnessLevel;
  final int weeklyWorkoutDays;
  final String workoutDuration;
  final String goal;
  final String dietaryRestrictions;
  final int preferredDiet;
  final String medicalConditions;

  UserDataFormModel(
      {required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.fitnessLevel,
      required this.weeklyWorkoutDays,
      required this.workoutDuration,
      required this.goal,
      required this.dietaryRestrictions,
      required this.preferredDiet,
      required this.medicalConditions});
}
