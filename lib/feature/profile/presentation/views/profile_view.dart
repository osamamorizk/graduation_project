import 'package:flutter/material.dart';

import 'package:graduation_project/feature/profile/presentation/views/widgets/profie_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 45,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 5),
        //     child: IconButton(
        //         onPressed: () {
        //           showCommingSoonDialog(context);
        //         },
        //         icon: const Icon(
        //           Icons.settings,
        //           color: ColorsManger.darkBlue,
        //         )),
        //   )
        // ],
      ),
      body: const ProfileBody(),
    );
  }
}
