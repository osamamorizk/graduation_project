import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                foodModel.item,
                style: TextStyles.font28DarkBlueBold,
              ),
              verticalSpace(10),
              AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.fill,
                ),
              ),
              verticalSpace(16),
              Text(
                'Your dish details(per 100 gms): ',
                style: TextStyles.font16BlackBold,
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NutrientInfo(
                      icon: Icons.water_drop_outlined,
                      value: "${foodModel.fats} gm",
                      label: "Fat",
                      color: Colors.black),
                  NutrientInfo(
                      icon: FontAwesomeIcons.cookieBite,
                      value: "${foodModel.carbs} gm",
                      label: "Carbs",
                      color: Colors.green),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NutrientInfo(
                      icon: FontAwesomeIcons.apple,
                      value: "${foodModel.sugar} gm",
                      label: "Sugar",
                      color: Colors.red),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
