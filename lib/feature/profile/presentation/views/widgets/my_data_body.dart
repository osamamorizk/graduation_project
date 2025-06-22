import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/cache_helper.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/user_data_item.dart';

class MyDataViewBody extends StatelessWidget {
  const MyDataViewBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesProfieIcon),
            userDataItem('Name', CacheHelper.getData(key: 'name') ?? 'user',
                trailingIcon: Icons.check),
            userDataItem('User goal', goals[userModel.goal]),
            userDataItem(
                'Preferred Diet', dietOptions[userModel.preferredDiet]),
            userDataItem('Weight', userModel.weight.toString(),
                trailingUnite: 'Kg'),
            userDataItem('Tall', userModel.height.toString(),
                trailingUnite: 'm'),
            userDataItem('Gender', userModel.gender == 0 ? 'Male' : 'Female'),
            userDataItem('Age', userModel.age.toString()),
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
