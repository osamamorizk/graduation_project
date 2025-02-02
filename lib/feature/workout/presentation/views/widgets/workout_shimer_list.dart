import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/container_info.dart';
import 'package:shimmer/shimmer.dart';

class Workoutshimerlist extends StatelessWidget {
  const Workoutshimerlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: ColorsManger.darkerGrey, width: .6),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Exercise',
                        style: TextStyles.font14BlackBold,
                      ),
                      const Spacer(),
                      const ContainerIformation(data: 'Chest')
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: .5,
                    endIndent: 5,
                    indent: 5,
                  ),
                  verticalSpace(100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
