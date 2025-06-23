import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/user_data_item.dart';

class MyDataViewBody extends StatelessWidget {
  const MyDataViewBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesProfieIcon,
              color: isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
            ),
            // UserDataItem(
            //     label: 'Name',
            //     value: CacheHelper.getData(key: 'name') ?? 'user',
            //     trailingIcon: Icons.check),
            UserDataItem(label: 'User goal', value: goals[userModel.goal]),
            UserDataItem(
                label: 'Preferred Diet',
                value: dietOptions[userModel.preferredDiet]),
            UserDataItem(
                label: 'Weight',
                value: userModel.weight.toString(),
                trailingUnite: 'Kg'),
            UserDataItem(
                label: 'Tall',
                value: userModel.height.toString(),
                trailingUnite: 'm'),
            UserDataItem(
                label: 'Gender',
                value: userModel.gender == 0 ? 'Male' : 'Female'),
            UserDataItem(label: 'Age', value: userModel.age.toString()),
            verticalSpace(16)
          ],
        ),
      ),
    );
  }
}

List<String> dietOptions = [
  "Balanced",
  "Mediterranean",
  "Keto",
  "Dash",
  "Low carb"
];

final List<String> goals = [
  'Build Strength',
  'Lose Weight',

  // 'Gain Weight',
  'Reduce Stress',
  'Improve Health',
];
