import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesProfieIcon),
              userDataItem('Name', 'Osama Mohamed', trailingIcon: Icons.check),
              userDataItem('Email address', 'osamarizk@gmail.com'),
              userDataItem('Weight', '70', trailingUnite: 'Kg'),
              userDataItem('Tall', '175', trailingUnite: 'cm'),
              userDataItem('Gender', 'Male'),
              userDataItem('Age', '21'),
            ],
          ),
        ),
      ),
    );
  }
}
