import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/logout_dialog.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/feature/profile/presentation/views/my_data_view.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profile_option_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:share_plus/share_plus.dart';

class ProfileOptionList extends StatelessWidget {
  const ProfileOptionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionItem(
          image: Assets.svgsProfileMyProgress,
          text: 'My Progress',
          onTap: () => showCommingSoonDialog(context),
        ),
        verticalSpace(32),
        ProfileOptionItem(
          image: Assets.svgsProfileMyData,
          text: 'My Data',
          onTap: () {
            PersistentNavBarNavigator.pushNewScreen(
              context,
              screen: const MyDataView(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
        ),
        verticalSpace(32),
        ProfileOptionItem(
          image: Assets.svgsProfileShare,
          text: 'Share',
          onTap: () {
            Share.share('check out my website https://www.google.com/');
          },
        ),
        verticalSpace(32),
        const ProfileOptionItem(
          image: Assets.svgsProfileContactUs,
          text: 'Contact us',
        ),
        verticalSpace(32),
        ProfileOptionItem(
          image: Assets.svgsProfileLogOut,
          text: 'Log out',
          onTap: () {
            logoutDialog(context);
          },
        ),
      ],
    );
  }
}
