import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/user_data_form/presentation/manger/cubit/user_data_cubit.dart';

class GenderToggleButtons extends StatefulWidget {
  const GenderToggleButtons({super.key});

  @override
  GenderToggleButtonsState createState() => GenderToggleButtonsState();
}

int selectedIndex = 0;

class GenderToggleButtonsState extends State<GenderToggleButtons> {
  List<bool> selected = [true, false];
  @override
  void initState() {
    selectedIndex = BlocProvider.of<UserDataCubit>(context).gender;
    setState(() {
      for (int i = 0; i < selected.length; i++) {
        selected[i] = i == selectedIndex;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: selected,
      onPressed: (int index) {
        if (index == 0) {
          setState(() {
            selectedIndex = index;
            BlocProvider.of<UserDataCubit>(context).gender = index;
          });
        } else if (index == 1) {
          setState(() {
            selectedIndex = index;
            BlocProvider.of<UserDataCubit>(context).gender = index;
          });
        }
        setState(() {
          for (int i = 0; i < selected.length; i++) {
            selected[i] = i == selectedIndex;
          }
        });
      },
      borderRadius: BorderRadius.circular(10),
      selectedColor: Colors.white,
      color: ColorsManger.darkBlue,
      fillColor: ColorsManger.darkBlue,
      borderColor: ColorsManger.darkBlue,
      selectedBorderColor: ColorsManger.darkBlue,
      textStyle: const TextStyle(fontSize: 14),
      constraints: BoxConstraints(
        minHeight: 50,
        minWidth: MediaQuery.of(context).size.width / 2.25,
      ),
      children: const [
        Text('Male'),
        Text('Female'),
      ],
    );
  }
}
