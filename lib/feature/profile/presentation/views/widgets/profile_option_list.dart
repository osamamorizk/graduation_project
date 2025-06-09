import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/logout_dialog.dart';
import 'package:graduation_project/core/functions/show_comming_soon_dialog.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/extensions.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profile_option_item.dart';
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
          image: Assets.svgsProfileMyData,
          text: 'My Data',
          onTap: () {
            context.pushNamed(Routes.myDataView);
          },
        ),
        verticalSpace(32),
        ProfileOptionItem(
          image: Assets.svgsSettingIconUIA,
          text: 'Settings',
          onTap: () {
            context.pushNamed(Routes.settingsView);
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
        ProfileOptionItem(
          image: Assets.svgsProfileContactUs,
          text: 'Contact us',
          onTap: () => showCommingSoonDialog(context),
        ),
        verticalSpace(32),
        ProfileOptionItem(
          image: Assets.svgsProfileLogOut,
          text: 'Log out',
          onTap: () {
            logoutDialog(
              context,
              onPressed: () {
                context.pop();
                showCommingSoonDialog(context);
              },
            );
          },
        ),
      ],
    );
  }
}
