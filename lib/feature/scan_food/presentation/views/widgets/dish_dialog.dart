import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/dish_nutration_info.dart';

void showDishDialog(BuildContext context, ScanFoodModel foodModel,
    {String? imagePath}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(foodModel.item, style: TextStyles.font22BlueBold),
              verticalSpace(16),
              AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.contain,
                  height: 150,
                  width: 170,
                ),
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NutrientInfo(
                      icon: Icons.local_fire_department,
                      value: "${foodModel.calories} cal",
                      label: "Calories",
                      color: Colors.orange),
                  NutrientInfo(
                      icon: Icons.egg_alt_outlined,
                      value: "${foodModel.protein} gm",
                      label: "Protein",
                      color: Colors.purple),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NutrientInfo(
                      icon: Icons.water_drop,
                      value: "${foodModel.fats} gm",
                      label: "Fat",
                      color: Colors.blue),
                  NutrientInfo(
                      icon: Icons.grain,
                      value: "${foodModel.carbs} gm",
                      label: "Carbs",
                      color: Colors.brown),
                ],
              ),
              verticalSpace(16),
              Center(
                child: NutrientInfo(
                    icon: Icons.cake,
                    value: "${foodModel.sugar} gm",
                    label: "Sugar",
                    color: Colors.red),
              ),
            ],
          ),
        ),
      );
    },
  );
}
