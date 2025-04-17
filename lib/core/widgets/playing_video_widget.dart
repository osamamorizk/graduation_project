import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class PlayingVideoWidget extends StatelessWidget {
  const PlayingVideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 125.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsManger.darkGrey,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
                child: Text(
              'Watch Video',
              style: TextStyles.font14BlackBold,
            )),
          ),
          Positioned(
            left: -50,
            bottom: -8,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: ColorsManger.darkBlue,
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
