import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
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
        backgroundColor: Colors.white,
        titleSpacing: 0,
        scrolledUnderElevation: .5,
        iconTheme: IconThemeData(color: ColorsManger.darkBlue, size: 22),
        elevation: 0,
        title: Text(
          "Food Details",
          style: TextStyles.font20BlueRegular,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(10),
              AspectRatio(
                aspectRatio: 1.52,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpace(16),
              scanedFoodList.isNotEmpty
                  ? Text(
                      'Your dish details(per 100 gms): ',
                      style: TextStyles.font16BlackBold,
                      textAlign: TextAlign.start,
                    )
                  : const SizedBox.shrink(),
              verticalSpace(10),
              scanedFoodList.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          const ErrorView(
                            errorMessage: "Can't detect food !",
                          ),
                          verticalSpace(30)
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: scanedFoodList.length,
                      itemBuilder: (context, index) {
                        return FoodElementCardItem(
                          scanFoodModel: scanedFoodList[index],
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
