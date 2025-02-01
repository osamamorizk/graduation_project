import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profie_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 45,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: .4,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Profile',
          style: TextStyles.font16BlackRegular.copyWith(fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
                onPressed: () {
                  showCommingSoonDialog(context);
                },
                icon: Icon(
                  Icons.settings,
                  color: ColorsManger.darkBlue,
                )),
          )
        ],
      ),
      body: const ProfileBody(),
    );
  }
}
