import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/error_dialog.dart';
import 'package:graduation_project/core/functions/upload_data_dialog.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/user_data_form_body.dart';

class UserDataForm extends StatelessWidget {
  const UserDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UserDataState>(
      listener: (context, state) {
        if (state is PostUserDataSuccess) {
          CasheHlper.saveData(key: 'id', value: state.userDataFormModel.id);

          context.pushNamed(Routes.bottomBar);
        } else if (state is PostUserDataFailure) {
          showErrorDialog(context, errorMessage: state.errorMessage);
        } else {
          showLoadingDialog(context,
              loadingMessage:
                  'Uploading your data...\nGenerating your diet and workout plan.\nPlease wait, this process may take some time.');
        }
      },
      child: const UserDataFormBody(category: 'all'),
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