import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/scan_food/presentation/manger/cubit/scan_food_cubit.dart';

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
              fixedSize: WidgetStatePropertyAll(Size(135, 40)),
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
          style: const ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(145, 40)),
              backgroundColor: WidgetStatePropertyAll(ColorsManger.darkBlue)),
          onPressed: () {
            context.read<ScanFoodCubit>().scanFood(
                  imagePath: imagePath,
                );
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
