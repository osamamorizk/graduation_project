import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:graduation_project/core/functions/show_warrning_dailog.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/routes/routes.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              warningDialog(context, () {
                context.pushNamed(Routes.dataForm, arguments: 'all');
              }, 'Do you want to update your data and create new plans?');
            },
            icon: Icon(
              FontAwesomeIcons.rotate,
              color: ColorsManger.darkBlue,
              size: 20,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: ColorsManger.darkBlue,
        color: Colors.white,
        onRefresh: () async {
          int userId = CasheHlper.getData(key: 'userId') ?? 4;
          return context.read<ProfileCubit>().getProfile(id: userId);
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return MyDataViewBody(userModel: state.userModel);
            } else if (state is ProfileFailure) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: ErrorView(
                    errorMessage: state.errorMessage,
                  ),
                ),
              );
            } else {
              return const CustomCircleProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
