import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class PlayingVideoWidget extends StatelessWidget {
  const PlayingVideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
              color: !isDarkMode ? Colors.white : ColorsManger.darkCard,
              boxShadow: [
                BoxShadow(
                  color:
                      !isDarkMode ? ColorsManger.darkGrey : Colors.transparent,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
                child: Text(
              'Watch Video',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                  ),
            )),
          ),
          const Positioned(
            left: -49,
            bottom: -6,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: ColorsManger.darkBlue,
              child: Icon(
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
