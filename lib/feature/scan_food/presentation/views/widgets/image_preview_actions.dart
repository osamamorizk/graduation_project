import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/data/models/scan_food_model.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/widgets/dish_dialog.dart';

class ImagePreviewActions extends StatelessWidget {
  const ImagePreviewActions({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.lightBlue)),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
          label: Text(
            'Retake',
            style: TextStyles.font14WhiteBold
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorsManger.darkBlue)),
          onPressed: () {
            // context
            //     .read<ScanFoodCubit>()
            //     .scanFood(imagePath: imagePath);

            Map<String, dynamic> sampleJson = {
              "Item": "Salad",
              "Calories per 100 gms": "200",
              "Protein per 100 gms": "16",
              "Carbs per 100 gms": "20",
              "Fats per 100 gms": "10",
              "Sugar per 100 gms": "5",
            };

            ScanFoodModel foodItem = ScanFoodModel.fromJson(sampleJson);
            showDishDialog(context, foodItem, imagePath: imagePath);
          },
          icon: const Icon(
            Icons.compare,
            color: Colors.white,
          ),
          label: Text(
            'Scan Food',
            style: TextStyles.font14WhiteBold
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
