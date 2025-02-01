import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/helpers/errors.dart';
import 'package:graduation_project/core/networking/api_service.dart';
import 'package:graduation_project/feature/diet/data/models/diet/daily_plan.model.dart';
import 'package:graduation_project/feature/diet/data/models/diet/meal.model.dart';
import 'package:graduation_project/feature/diet/data/repos/diet_repo.dart';

class DietRepoImpl implements DietRepo {
  final ApiService apiService;

  DietRepoImpl(this.apiService);
  List<DailyPlan> daysDietList = [];
  @override
  Future<Either<Failure, List<DailyPlan>>> getAllDiet({required int id}) async {
    try {
      var result =
          await apiService.get(endPoints: 'endPoints', queryParams: {'id': id});
      for (var dietDay in json.decode(jsonData)['WeeklyPlans'][0]
          ['DailyPlans']) {
        daysDietList.add(DailyPlan.fromJson(dietDay));
      }
      return right(daysDietList);
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
  Future<Either<Failure, List<Meal>>> getMealsByDay(
      {required String day}) async {
    try {
      List<Meal> mealsList = filterMealsByDay(day: day);

      return right(mealsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  filterMealsByDay({required String day}) {
    return daysDietList
        .firstWhere(
          (dayMeals) => dayMeals.day == day,
        )
        .meals;
  }
}

String jsonData = '''{
  "Duration": "1 week",
  "DailyCalories": 2500,
  "MacronutrientDistribution": "40% carbs, 30% protein, 30% fat",
  "WeeklyPlans": [
    {
      "WeekNumber": 1,
      "DailyPlans": [
        {
          "Day": "Monday",
          "Meals": [
            {
              "Name": "Breakfast",
              "Items": [
                {
                  "Name": "Fava Beans (Ful Medames)",
                  "PortionSize": "1 cup",
                  "Calories": 300,
                  "Macronutrients": {
                    "Carbs": "20g",
                    "Protein": "15g",
                    "Fat": "10g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Chickpea Salad",
                      "PortionSize": "1 serving",
                      "Calories": 250,
                      "Macronutrients": {
                        "Carbs": "18g",
                        "Protein": "12g",
                        "Fat": "8g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Eggs with Whole Wheat Toast",
                      "PortionSize": "2 eggs, 2 slices of toast",
                      "Calories": 350,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "20g",
                        "Fat": "12g"
                      },
                      "Alternatives": []
                    }
                  ]
                },
                {
                  "Name": "Apple",
                  "PortionSize": "1 medium",
                  "Calories": 80,
                  "Macronutrients": {
                    "Carbs": "20g",
                    "Protein": "1g",
                    "Fat": "0g"
                  },
                  "Alternatives": []
                }
              ]
            },
            {
              "Name": "Snack",
              "Items": [
                {
                  "Name": "Greek Yogurt with Berries",
                  "PortionSize": "1 cup yogurt, 1/2 cup berries",
                  "Calories": 200,
                  "Macronutrients": {
                    "Carbs": "15g",
                    "Protein": "10g",
                    "Fat": "8g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Cottage Cheese with Pineapple",
                      "PortionSize": "1/2 cup cottage cheese, 1/2 cup pineapple",
                      "Calories": 180,
                      "Macronutrients": {
                        "Carbs": "10g",
                        "Protein": "12g",
                        "Fat": "7g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Mixed Nuts",
                      "PortionSize": "1/4 cup",
                      "Calories": 200,
                      "Macronutrients": {
                        "Carbs": "8g",
                        "Protein": "6g",
                        "Fat": "15g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Tuesday",
          "Meals": [
            {
              "Name": "Lunch",
              "Items": [
                {
                  "Name": "Grilled Chicken Breast with Quinoa and Salad",
                  "PortionSize": "4 oz chicken, 1/2 cup quinoa, mixed salad",
                  "Calories": 400,
                  "Macronutrients": {
                    "Carbs": "30g",
                    "Protein": "25g",
                    "Fat": "15g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Lentil Soup with Brown Rice",
                      "PortionSize": "1 cup soup, 1/2 cup rice",
                      "Calories": 350,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "20g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Tuna Salad Wrap",
                      "PortionSize": "1 wrap",
                      "Calories": 300,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "18g",
                        "Fat": "12g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Dinner",
              "Items": [
                {
                  "Name": "Baked Salmon with Sweet Potato and Steamed Vegetables",
                  "PortionSize": "4 oz salmon, 1 medium sweet potato, mixed veggies",
                  "Calories": 450,
                  "Macronutrients": {
                    "Carbs": "35g",
                    "Protein": "30g",
                    "Fat": "20g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Vegetable Stir-Fry with Tofu",
                      "PortionSize": "1 cup stir-fry",
                      "Calories": 400,
                      "Macronutrients": {
                        "Carbs": "30g",
                        "Protein": "25g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Grilled Beef with Quinoa Salad",
                      "PortionSize": "4 oz beef, 1/2 cup quinoa salad",
                      "Calories": 450,
                      "Macronutrients": {
                        "Carbs": "35g",
                        "Protein": "30g",
                        "Fat": "20g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Wednesday",
          "Meals": [
            {
              "Name": "Breakfast",
              "Items": [
                {
                  "Name": "Oatmeal with Almond Butter and Banana",
                  "PortionSize": "1 cup oatmeal, 1 tbsp almond butter, 1 medium banana",
                  "Calories": 350,
                  "Macronutrients": {
                    "Carbs": "25g",
                    "Protein": "10g",
                    "Fat": "15g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Avocado Toast",
                      "PortionSize": "2 slices of whole wheat toast, 1/2 avocado",
                      "Calories": 300,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "8g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Greek Yogurt Parfait",
                      "PortionSize": "1 cup yogurt, granola, berries",
                      "Calories": 300,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "12g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Snack",
              "Items": [
                {
                  "Name": "Boiled Eggs with Carrot Sticks",
                  "PortionSize": "2 eggs, 1 cup carrot sticks",
                  "Calories": 200,
                  "Macronutrients": {
                    "Carbs": "10g",
                    "Protein": "14g",
                    "Fat": "12g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Protein Shake with Almond Milk",
                      "PortionSize": "1 scoop protein powder, 1 cup almond milk",
                      "Calories": 250,
                      "Macronutrients": {
                        "Carbs": "15g",
                        "Protein": "20g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Turkey Slices with Whole Grain Crackers",
                      "PortionSize": "4 slices turkey, 6 crackers",
                      "Calories": 180,
                      "Macronutrients": {
                        "Carbs": "15g",
                        "Protein": "12g",
                        "Fat": "8g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Thursday",
          "Meals": [
            {
              "Name": "Lunch",
              "Items": [
                {
                  "Name": "Vegetable Quinoa Bowl with Chickpeas",
                  "PortionSize": "1 cup quinoa, mixed veggies, 1/2 cup chickpeas",
                  "Calories": 400,
                  "Macronutrients": {
                    "Carbs": "30g",
                    "Protein": "20g",
                    "Fat": "15g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Mediterranean Salad",
                      "PortionSize": "Mixed greens, cucumber, olives, feta, dressing",
                      "Calories": 350,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "15g",
                        "Fat": "20g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Grilled Shrimp with Brown Rice",
                      "PortionSize": "1 cup rice, 5 shrimp",
                      "Calories": 400,
                      "Macronutrients": {
                        "Carbs": "30g",
                        "Protein": "25g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Dinner",
              "Items": [
                {
                  "Name": "Stuffed Bell Peppers with Quinoa and Lean Beef",
                  "PortionSize": "2 peppers, quinoa, ground beef",
                  "Calories": 450,
                  "Macronutrients": {
                    "Carbs": "35g",
                    "Protein": "30g",
                    "Fat": "20g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Mushroom Risotto",
                      "PortionSize": "1 cup risotto",
                      "Calories": 400,
                      "Macronutrients": {
                        "Carbs": "30g",
                        "Protein": "15g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Grilled Chicken Skewers with Zucchini Noodles",
                      "PortionSize": "2 skewers, zoodles",
                      "Calories": 450,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "30g",
                        "Fat": "22g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Friday",
          "Meals": [
            {
              "Name": "Breakfast",
              "Items": [
                {
                  "Name": "Whole Wheat Pancakes with Berries",
                  "PortionSize": "2 pancakes, 1/2 cup berries",
                  "Calories": 350,
                  "Macronutrients": {
                    "Carbs": "30g",
                    "Protein": "10g",
                    "Fat": "12g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Smoothie Bowl",
                      "PortionSize": "Blended fruit, granola, nuts",
                      "Calories": 300,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "8g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Egg White Omelette with Spinach",
                      "PortionSize": "3 egg whites, spinach",
                      "Calories": 300,
                      "Macronutrients": {
                        "Carbs": "15g",
                        "Protein": "18g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Snack",
              "Items": [
                {
                  "Name": "Trail Mix",
                  "PortionSize": "1/4 cup",
                  "Calories": 200,
                  "Macronutrients": {
                    "Carbs": "15g",
                    "Protein": "8g",
                    "Fat": "12g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Cucumber Slices with Hummus",
                      "PortionSize": "1 cup cucumbers, 2 tbsp hummus",
                      "Calories": 150,
                      "Macronutrients": {
                        "Carbs": "10g",
                        "Protein": "6g",
                        "Fat": "8g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Rice Cakes with Peanut Butter",
                      "PortionSize": "2 cakes, 1 tbsp peanut butter",
                      "Calories": 200,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "6g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Saturday",
          "Meals": [
            {
              "Name": "Lunch",
              "Items": [
                {
                  "Name": "Turkey and Avocado Wrap with Sweet Potato Fries",
                  "PortionSize": "1 wrap, 1 cup fries",
                  "Calories": 400,
                  "Macronutrients": {
                    "Carbs": "30g",
                    "Protein": "20g",
                    "Fat": "15g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Quinoa Salad with Walnuts and Veggies",
                      "PortionSize": "1 cup salad",
                      "Calories": 350,
                      "Macronutrients": {
                        "Carbs": "25g",
                        "Protein": "15g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Grilled Salmon with Asparagus",
                      "PortionSize": "4 oz salmon, 1 cup asparagus",
                      "Calories": 400,
                      "Macronutrients": {
                        "Carbs": "30g",
                        "Protein": "25g",
                        "Fat": "20g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Dinner",
              "Items": [
                {
                  "Name": "Beef Stir-Fry with Brown Rice",
                  "PortionSize": "4 oz beef, 1 cup rice, mixed veggies",
                  "Calories": 450,
                  "Macronutrients": {
                    "Carbs": "35g",
                    "Protein": "30g",
                    "Fat": "20g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Vegetarian Chili",
                      "PortionSize": "1 cup chili",
                      "Calories": 400,
                      "Macronutrients": {
                        "Carbs": "30g",
                        "Protein": "20g",
                        "Fat": "15g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Grilled Chicken Salad",
                      "PortionSize": "Mixed greens, grilled chicken, dressing",
                      "Calories": 450,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "30g",
                        "Fat": "25g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "Day": "Sunday",
          "Meals": [
            {
              "Name": "Breakfast",
              "Items": [
                {
                  "Name": "Greek Yogurt Smoothie with Almond Butter",
                  "PortionSize": "1 cup yogurt, 1 tbsp almond butter",
                  "Calories": 300,
                  "Macronutrients": {
                    "Carbs": "20g",
                    "Protein": "15g",
                    "Fat": "12g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Chia Seed Pudding with Mixed Berries",
                      "PortionSize": "1 cup pudding, 1/2 cup berries",
                      "Calories": 250,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "10g",
                        "Fat": "10g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Veggie Omelette",
                      "PortionSize": "3 eggs, mixed veggies",
                      "Calories": 350,
                      "Macronutrients": {
                        "Carbs": "15g",
                        "Protein": "20g",
                        "Fat": "18g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            },
            {
              "Name": "Snack",
              "Items": [
                {
                  "Name": "Protein Bar",
                  "PortionSize": "1 bar",
                  "Calories": 200,
                  "Macronutrients": {
                    "Carbs": "15g",
                    "Protein": "20g",
                    "Fat": "10g"
                  },
                  "Alternatives": [
                    {
                      "Name": "Rice Crackers with Cottage Cheese",
                      "PortionSize": "6 crackers, 1/2 cup cheese",
                      "Calories": 180,
                      "Macronutrients": {
                        "Carbs": "15g",
                        "Protein": "10g",
                        "Fat": "8g"
                      },
                      "Alternatives": []
                    },
                    {
                      "Name": "Mixed Berries",
                      "PortionSize": "1 cup",
                      "Calories": 80,
                      "Macronutrients": {
                        "Carbs": "20g",
                        "Protein": "1g",
                        "Fat": "0g"
                      },
                      "Alternatives": []
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "ShoppingList": [
    {
      "Item": "Fava Beans (Ful Medames) or Chickpea Salad or Eggs with Whole Wheat Toast",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Apple",
      "Quantity": "7 medium"
    },
    {
      "Item": "Greek Yogurt",
      "Quantity": "7 cups"
    },
    {
      "Item": "Berries",
      "Quantity": "2 1/2 cups"
    },
    {
      "Item": "Cottage Cheese or Mixed Nuts",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Grilled Chicken Breast",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Quinoa",
      "Quantity": "3 cups"
    },
    {
      "Item": "Mixed Salad Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Baked Salmon",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Sweet Potatoes",
      "Quantity": "4 medium"
    },
    {
      "Item": "Vegetables for Stir-Fry",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Tofu",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Beef for Grilling",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Oatmeal",
      "Quantity": "7 cups"
    },
    {
      "Item": "Almond Butter",
      "Quantity": "7 tbsp"
    },
    {
      "Item": "Bananas",
      "Quantity": "7 medium"
    },
    {
      "Item": "Boiled Eggs",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Carrot Sticks",
      "Quantity": "4 cups"
    },
    {
      "Item": "Protein Powder",
      "Quantity": "7 scoops"
    },
    {
      "Item": "Almond Milk",
      "Quantity": "7 cups"
    },
    {
      "Item": "Turkey Slices",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Whole Grain Crackers",
      "Quantity": "24 crackers"
    },
    {
      "Item": "Vegetables for Quinoa Bowl",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Chickpeas",
      "Quantity": "2 cups"
    },
    {
      "Item": "Bell Peppers",
      "Quantity": "4"
    },
    {
      "Item": "Ground Beef",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Mushrooms for Risotto",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Chicken Skewers Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Zucchini",
      "Quantity": "4 medium"
    },
    {
      "Item": "Whole Wheat Pancake Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Egg Whites",
      "Quantity": "14"
    },
    {
      "Item": "Spinach",
      "Quantity": "4 cups"
    },
    {
      "Item": "Trail Mix",
      "Quantity": "1 cup"
    },
    {
      "Item": "Cucumbers",
      "Quantity": "4 cups"
    },
    {
      "Item": "Hummus",
      "Quantity": "8 tbsp"
    },
    {
      "Item": "Rice Cakes",
      "Quantity": "8 cakes"
    },
    {
      "Item": "Turkey for Wraps",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Avocado",
      "Quantity": "4 medium"
    },
    {
      "Item": "Quinoa Salad Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Walnuts",
      "Quantity": "4 oz"
    },
    {
      "Item": "Salmon for Grilling",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Asparagus",
      "Quantity": "4 cups"
    },
    {
      "Item": "Vegetables for Stir-Fry with Beef",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Vegetarian Chili Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Grilled Chicken Salad Ingredients",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Greek Yogurt for Smoothie",
      "Quantity": "7 cups"
    },
    {
      "Item": "Chia Seeds",
      "Quantity": "7 tbsp"
    },
    {
      "Item": "Berries for Pudding",
      "Quantity": "3 1/2 cups"
    },
    {
      "Item": "Mixed Veggies for Omelette",
      "Quantity": "enough for 4 servings"
    },
    {
      "Item": "Protein Bars",
      "Quantity": "7 bars"
    },
    {
      "Item": "Rice Crackers",
      "Quantity": "42 crackers"
    },
    {
      "Item": "Cottage Cheese",
      "Quantity": "3 1/2 cups"
    }
  ],
  "HydrationPlan": [
    {
      "Time": "Morning",
      "Instruction": "Drink a glass of water with breakfast."
    },
    {
      "Time": "Afternoon",
      "Instruction": "Stay hydrated with herbal tea or infused water."
    },
    {
      "Time": "Evening",
      "Instruction": "Enjoy a glass of water before bed."
    }
  ],
  "ProgressTracking": [
    {
      "Instruction": "Take body measurements every week."
    },
    {
      "Instruction": "Track protein intake for muscle growth."
    }
  ],
  "Notes": [
    "Remember to adjust portion sizes based on personal activity levels and hunger cues.",
    "Replace any allergenic ingredients with suitable alternatives."
  ]
} 
''';
