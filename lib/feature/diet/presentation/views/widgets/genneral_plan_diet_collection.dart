import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';
import 'package:graduation_project/feature/diet/data/models/diet_gp_model.dart';

class GenneralPlanDietColllection extends StatelessWidget {
  const GenneralPlanDietColllection({
    super.key,
    required this.dietGpModel,
  });

  final DietGpModel dietGpModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: MediaQuery.sizeOf(context).width * .9,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: dietGpModel.imageUrl ??
                'https://images.unsplash.com/photo-1498837167922-ddd27525d352',
            fit: BoxFit.cover,
            placeholder: (context, url) => const ShimmerLoadingWidget(
              itemCount: 1,
              hight: 140,
            ),
            errorWidget: (context, url, error) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://images.unsplash.com/photo-1498837167922-ddd27525d352'),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dietGpModel.name ?? 'Diet Plan',
                  style: TextStyles.font16whiteBold,
                ),
                Text(
                  "Category : ${dietGpModel.category}",
                  style: TextStyles.font14WhiteBold.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
