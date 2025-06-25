import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';

class ImageAndTitleWidget extends StatelessWidget {
  const ImageAndTitleWidget({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          placeholder: (context, url) => const Center(
            child: CustomCircleProgressIndicator(),
          ),
          errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGV4ZXJjaXNlfGVufDB8fDB8fHww'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          imageUrl: imageUrl,
        ),
        Container(
          width: double.infinity,
          height: 220,
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: TextStyles.font16whiteBold.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
