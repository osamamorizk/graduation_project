import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class PlayingVideoWidget extends StatelessWidget {
  const PlayingVideoWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 160.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: !isDarkMode ? Colors.white : ColorsManger.darkCard,
            boxShadow: [
              BoxShadow(
                color: !isDarkMode ? ColorsManger.darkGrey : Colors.transparent,
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            spacing: 8,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: ColorsManger.darkBlue,
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              Center(
                  child: Text(
                'Watch Video',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 16,
                    ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
