import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/gender_toggle_buttons.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/tall_unit_toggle.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/wieght_unite_toggle.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AboutUser extends StatefulWidget {
  const AboutUser({super.key});

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  int age = 30;
  double height = 170;
  double weight = 54;

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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: .4)),
                    height: 40,
                    width: 130,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(
                      '$age',
                      style: TextStyles.font16BlackRegular,
                    ),
                  ),
                  Positioned(
                      top: -10,
                      left: 10,
                      child: Text(
                        'How old are you?',
                        style: TextStyles.font14BlackBold,
                      ))
                ],
              ),
              Slider(
                allowedInteraction: SliderInteraction.tapAndSlide,
                activeColor: Colors.grey.shade400,
                inactiveColor: ColorsManger.darkBlue,
                thumbColor: Colors.white,
                value: age.toDouble(),
                min: 10,
                max: 100,
                divisions: 90,
                label: age.round().toString(),
                onChanged: (value) {
                  setState(() {
                    age = value.toInt();
                    BlocProvider.of<UserDataCubit>(context).age = age;
                  });
                },
              ),
              verticalSpace(30.h),
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
              SfSlider(
                activeColor: Colors.grey.shade400,
                inactiveColor: ColorsManger.darkBlue,
                min: 70,
                max: 200.0,
                value: height,
                interval: 15,
                showTicks: true,
                showLabels: true,
                enableTooltip: true,
                onChanged: (dynamic value) {
                  setState(() {
                    height = value;
                    BlocProvider.of<UserDataCubit>(context).tall = height;
                  });
                },
              ),
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
              SfSlider(
                min: 40,
                max: 200.0,
                value: weight,
                interval: 20,
                showTicks: true,
                showDividers: true,
                minorTickShape: const SfTickShape(),
                showLabels: true,
                enableTooltip: true,
                activeColor: ColorsManger.darkBlue,
                minorTicksPerInterval: 4,
                onChanged: (dynamic value) {
                  setState(() {
                    weight = value;
                    BlocProvider.of<UserDataCubit>(context).weight = weight;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
