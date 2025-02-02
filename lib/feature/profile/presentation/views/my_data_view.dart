import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/feature/profile/data/models/user_model.dart';
import 'package:graduation_project/feature/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/user_data_item.dart';

class MyDataView extends StatelessWidget {
  const MyDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          'My Data',
          style: TextStyles.font16BlueBold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManger.darkBlue),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccess) {
            return MyDataViewBody(userModel: state.userModel);
          } else if (state is ProfileFailure) {
            return Text(state.errorMessage);
          } else {
            return const CustomCircleProgressIndicator();
          }
        },
      ),
    );
  }
}

class MyDataViewBody extends StatelessWidget {
  const MyDataViewBody({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesProfieIcon),
              userDataItem('Name', userModel.userName,
                  trailingIcon: Icons.check),
              userDataItem('User goal', goals[userModel.goal]),
              userDataItem(
                  'Preferred Diet', dietOptions[userModel.preferredDiet]),
              userDataItem('Weight', userModel.weight.toString(),
                  trailingUnite: 'Kg'),
              userDataItem('Tall', userModel.height.toString(),
                  trailingUnite: 'cm'),
              userDataItem('Gender', userModel.gender == 0 ? 'Male' : 'Female'),
              userDataItem('Age', userModel.age.toString()),
            ],
          ),
        ));
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
