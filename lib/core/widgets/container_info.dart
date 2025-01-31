import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class ContainerIformation extends StatelessWidget {
  const ContainerIformation({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .8, color: ColorsManger.darkGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 70.w,
        child: Center(
          child: Text(
            data,
            style: TextStyles.font14BlackRegular,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
