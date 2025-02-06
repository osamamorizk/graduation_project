import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_data_form_body.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({super.key, this.category = 'all'});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) async {
        if (state is PostUserDataSuccess) {
          await CasheHlper.saveInt(
              key: 'userId', value: state.userDataFormModel.id);

          showSuccessToast('Registration process completed successfully');
          // ignore: use_build_context_synchronously
          context.pushNamedAndRemoveUntil(
            predicate: (route) => false,
            Routes.bottomBar,
          );
        } else if (state is PutDietPlanSuccess) {
          showSuccessToast('Diet plan updated successfully');
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottomBar,
              predicate: (route) => false);
        } else if (state is PutWorkoutPlanSuccess) {
          showSuccessToast('Workout plan updated successfully');
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.bottomBar,
              predicate: (route) => false);
        } else if (state is PutUserSuccess) {
          context.pop();
          showSuccessToast('User data and plans updated successfully');

          context.pushNamedAndRemoveUntil(Routes.bottomBar,
              predicate: (route) => false);
        } else if (state is PutUserFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is PostUserDataFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is PutDietPlanFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is PutWorkoutPlanFailure) {
          context.pop();
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else if (state is PostUserDataLoading ||
            state is PutDietPlanLoading ||
            state is PutUserLoading ||
            state is PutWorkoutPlanLoading) {
          showLoadingDialog(
            context,
            loadingMessage: 'This may take a while,\nplease wait.',
            textAlign: TextAlign.center,
          );
        }
      },
      child: UserDataFormBody(category: category),
    );
  }
}

// List<Widget> getScreensBasedOnCategory(String category) {
//   if (category == 'diet') {
//     return dietScreens;
//   } else if (category == 'workout') {
//     return workoutScreens;
//   } else {
//     return formScreens;
//   }
// }
