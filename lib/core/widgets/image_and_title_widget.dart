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
            height: 300,
            imageUrl: imageUrl),
        Positioned(
          top: 50,
          left: 10,
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 20,
          child: Text(
            name,
            style: TextStyles.font16whiteBold.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
