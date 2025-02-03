import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/custom_circle_progress_indicator.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/feature/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/my_data_body.dart';

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
            return Center(
              child: ErrorView(
                errorMessage: state.errorMessage,
              ),
            );
          } else {
            return const CustomCircleProgressIndicator();
          }
        },
      ),
    );
  }
}
