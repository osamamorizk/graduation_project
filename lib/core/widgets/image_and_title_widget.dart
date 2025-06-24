import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

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
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            imageUrl: imageUrl),
        Container(
          width: double.infinity,
          height: 250,
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
