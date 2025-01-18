import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';

class TallUniteToggle extends StatelessWidget {
  const TallUniteToggle({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserDataCubit>(context).heightUnit = 'CM';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorsManger.darkBlue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text('CM', style: TextStyles.font14WhiteBold),
    );
  }
}
