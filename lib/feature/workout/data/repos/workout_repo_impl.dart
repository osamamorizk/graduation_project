import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/core/networking/end_points.dart';
import 'package:graduation_project/feature/workout/data/models/exercise_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/workout_plan_model.dart';
import 'package:graduation_project/feature/workout/data/models/workout_model/exercise.dart';
import 'package:graduation_project/feature/workout/data/repos/workout_repo.dart';

class WorkoutRepoImpl implements WorkoutRepo {
  final ApiService apiService;
  List<WorkoutPlanModel> workoutPlansList = [];
  WorkoutRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<WorkoutPlanModel>>> getAllWorkoutPlans(
      {required int id}) async {
    try {
      var result = await apiService
          .get(endPoints: specializationEndPoints, queryParams: {'id': id});

      for (var workout in result['plan']['DailyPlans']) {
        workoutPlansList.add(WorkoutPlanModel.fromJson(workout));
      }
      return right(workoutPlansList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<WorkoutExerciseModel>>> getWorkoutByDay(
      {required String day}) async {
    try {
      List<WorkoutExerciseModel> exerciseList = filterWorkoutByDay(day: day);
      return right(exerciseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  filterWorkoutByDay({required String day}) {
    return workoutPlansList
        .firstWhere(
          (exercise) => exercise.day == day,
        )
        .exercises;
  }

  @override
  Future<Either<Failure, List<ExerciseModel>>> getExerciseList(
      {required int id}) async {
    try {
      var result =
          await apiService.get(endPoints: 'endPoints', queryParams: {'id': id});

      List<ExerciseModel> exerciseList =
          result.map((exercise) => ExerciseModel.fromJson(exercise)).toList();
      return right(exerciseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}

String jsonData = '''{
  "plan": {
    "Duration": "Repeat weekly for desired duration",
    "Goal": "Gaining Muscle",
    "DailyPlans": [
      {
        "Day": "Day 1 (Monday)",
        "Focus": "Upper Body Strength",
        "Exercises": [
          {
            "Name": "Bench Press",
            "MuscleGroup": "Chest",
            "Sets": 4,
            "Reps": "8-10",
            "RestBetweenSets": "60-90 seconds",
            "Intensity": "Moderate",
            "Notes": [
              "Focus on proper form and full range of motion"
            ]
          },
          {
            "Name": "Bent-Over Rows",
            "MuscleGroup": "Back",
            "Sets": 4,
            "Reps": "8-10",
            "RestBetweenSets": "60-90 seconds",
            "Intensity": "Moderate",
            "Notes": [
              "Engage your back muscles and avoid swinging"
            ]
          }
        ]
      },
      {
        "Day": "Day 2 (Tuesday)",
        "Focus": "Cardio",
        "Exercises": [
          {
            "Name": "Running",
            "MuscleGroup": "Cardio",
            "Sets": 1,
            "Reps": "20 min",
            "RestBetweenSets": "N/A",
            "Intensity": "Moderate",
            "Notes": [
              "Maintain a steady pace and focus on breathing"
            ]
          }
        ]
      },
      {
        "Day": "Day 3 (Wednesday)",
        "Focus": "Lower Body Strength",
        "Exercises": [
          {
            "Name": "Squats",
            "MuscleGroup": "Legs",
            "Sets": 4,
            "Reps": "8-10",
            "RestBetweenSets": "60-90 seconds",
            "Intensity": "Moderate",
            "Notes": [
              "Keep your back straight and knees aligned with toes"
            ]
          }
        ]
      },
      {
        "Day": "Day 4 (Thursday)",
        "Focus": "Flexibility",
        "Exercises": [
          {
            "Name": "Yoga",
            "MuscleGroup": "Full Body",
            "Sets": 1,
            "Reps": "30 min",
            "RestBetweenSets": "N/A",
            "Intensity": "Light",
            "Notes": [
              "Focus on stretching and breathing"
            ]
          }
        ]
      },
      {
        "Day": "Day 5 (Friday)",
        "Focus": "Full Body Strength",
        "Exercises": [
          {
            "Name": "Deadlifts",
            "MuscleGroup": "Full Body",
            "Sets": 4,
            "Reps": "8-10",
            "RestBetweenSets": "60-90 seconds",
            "Intensity": "Moderate",
            "Notes": [
              "Engage your core and lift with proper form"
            ]
          }
        ]
      }
    ],
    "RestDays": [
      "Sunday"
    ],
    "Notes": [
      "Warm up for 5-10 minutes before each workout",
      "Cool down and stretch after each session",
      "Track progress weekly and adjust weights/intensity as needed",
      "Stay consistent and prioritize recovery"
    ]
  }
}
    ''';
