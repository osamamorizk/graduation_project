import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';
import 'package:graduation_project/feature/user_data_form/presentation/views/widgets/check_list_item.dart';

class UserMotivationsView extends StatefulWidget {
  const UserMotivationsView({super.key});

  @override
  State<UserMotivationsView> createState() => _UserMotivationsViewState();
}

List<String> motivationsList = [
  "Setting and achieving goals",
  "Tracking progress",
  "Competing with others",
  "Enjoyment of the activity",
  "Social accountability"
];
bool isSelected = false;

class _UserMotivationsViewState extends State<UserMotivationsView> {
  bool checkboxValue = false;
  List<String> selectedMotivations = [];
  @override
  Widget build(BuildContext context) {
    selectedMotivations = context.read<UserDataCubit>().userMotivation;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(35.h),
          Text(
            'What motivates you to stay healthy?',
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(40.h),
          ListView.builder(
              shrinkWrap: true,
              itemCount: motivationsList.length,
              itemBuilder: (context, index) {
                final motivation = motivationsList[index];
                bool isMotivateed = selectedMotivations.contains(motivation);
                return CheckListItem(
                  isSelected: isMotivateed,
                  text: motivationsList[index],
                  onChanged: (value) {
                    setState(() {
                      if (isMotivateed) {
                        selectedMotivations.remove(motivation);
                      } else {
                        selectedMotivations.add(motivation);
                      }
                      BlocProvider.of<UserDataCubit>(context).userMotivation =
                          selectedMotivations;
                    });
                  },
                );
              }),
        ],
      ),
    );
  }
}
