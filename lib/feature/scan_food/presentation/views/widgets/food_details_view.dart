import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/scan_food_card.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage(
      {super.key, required this.imagePath, required this.scanedFoodList});
  final String imagePath;
  final List<ScanFoodModel> scanedFoodList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Food Details",
          style: TextStyles.font20BlueRegular,
        ),
      ),
      body: Column(
        children: [
          verticalSpace(16),
          Text(
            'Your dish details(per 100 gms): ',
            style: TextStyles.font16BlackBold,
          ),
          verticalSpace(10),
          AspectRatio(
            aspectRatio: 1,
            child: Image.file(
              height: 300,
              File(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          verticalSpace(10),
          AspectRatio(
            aspectRatio: 1,
            child: Image.file(
              File(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: scanedFoodList.length,
              itemBuilder: (context, index) {
                return FoodElementCardItem(
                  scanFoodModel: scanedFoodList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
