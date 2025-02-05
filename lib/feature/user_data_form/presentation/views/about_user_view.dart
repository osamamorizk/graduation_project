import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/gender_toggle_buttons.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/how_old_container.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/tall_unit_toggle.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/wieght_unite_toggle.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AboutUser extends StatefulWidget {
  const AboutUser({super.key});

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  late double age;
  late double height;
  late double weight;
  @override
  void initState() {
    age = BlocProvider.of<UserDataCubit>(context).age;
    height = BlocProvider.of<UserDataCubit>(context).tall;
    weight = BlocProvider.of<UserDataCubit>(context).weight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(35.h),
              Text(
                'First, tell us a little about yourself',
                style: TextStyles.font18BlackBold,
              ),
              verticalSpace(40.h),
              Text(
                'Your Gender',
                style: TextStyles.font14BlackBold,
              ),
              verticalSpace(16.h),
              const Center(child: GenderToggleButtons()),
              verticalSpace(30.h),
              HowOldContainer(age: age.toInt()),
              oldSlider(context),
              verticalSpace(20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'How tall are you?',
                    style: TextStyles.font14BlackBold,
                  ),
                  const TallUniteToggle(),
                ],
              ),
              tallSlider(context),
              verticalSpace(40.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'What is your current weight?',
                    style: TextStyles.font14BlackBold,
                  ),
                  const WeightUniteToggle(),
                ],
              ),
              weightSlider(context),
            ],
          ),
        ),
      ),
    );
  }

  SfSlider weightSlider(BuildContext context) {
    return SfSlider(
      showDividers: false,
      activeColor: Colors.grey.shade400,
      inactiveColor: ColorsManger.darkBlue,
      edgeLabelPlacement: EdgeLabelPlacement.auto,
      min: 40,
      max: 180,
      value: weight,
      interval: 20,
      stepSize: 1,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 4,
      onChanged: (dynamic value) {
        setState(() {
          weight = value;
          BlocProvider.of<UserDataCubit>(context).weight = weight;
        });
      },
    );
  }

  SfSlider tallSlider(BuildContext context) {
    return SfSlider(
      activeColor: Colors.grey.shade400,
      inactiveColor: ColorsManger.darkBlue,
      showDividers: false,
      min: 60,
      max: 200,
      value: height,
      interval: 20,
      stepSize: 1,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      edgeLabelPlacement: EdgeLabelPlacement.auto,
      onChanged: (dynamic value) {
        setState(() {
          height = value;
          BlocProvider.of<UserDataCubit>(context).tall = height;
        });
      },
    );
  }

  SfSlider oldSlider(BuildContext context) {
    return SfSlider(
      activeColor: Colors.grey.shade400,
      inactiveColor: ColorsManger.darkBlue,
      showDividers: false,
      min: 10,
      max: 80,
      value: age,
      stepSize: 1,
      interval: 90,
      showTicks: false,
      showLabels: false,
      enableTooltip: true,
      onChanged: (dynamic value) {
        setState(() {
          age = value;
          BlocProvider.of<UserDataCubit>(context).age = age;
        });
      },
    );
  }
}
