import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/shimmer_loading.dart';

class GpMealItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int calories;
  final int time;

  const GpMealItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.calories,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 155.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const ShimmerLoadingWidget(
                itemCount: 1,
                hight: 140,
              ),

              // Container(
              //   color: Colors.grey.shade300,
              //   child: const Center(child: CustomCircleProgressIndicator()),
              // ),
              errorWidget: (context, url, error) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    'https://images.unsplash.com/photo-1525351484163-7529414344d8',
              ),
            ),
          ),
          Text(name, style: TextStyles.font14Regular),
          Row(
            spacing: 8,
            children: [
              SvgPicture.asset(Assets.svgsCalories),
              Text(
                '$calories kcal',
                style: TextStyles.font14BlueRegular.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 12,
                child: VerticalDivider(
                  thickness: 1.5,
                  width: 4,
                  color: ColorsManger.grey,
                ),
              ),
              SvgPicture.asset(Assets.svgsClock),
              Text(
                '$time min',
                style: TextStyles.font14BlueRegular.copyWith(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
