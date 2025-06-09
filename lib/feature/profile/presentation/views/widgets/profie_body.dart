import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/drink_water/presentation/manger/cubit/notification_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/profile_option_list.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(16),
            Image.asset(Assets.imagesProfieIcon),
            verticalSpace(16),
            Text(
              CasheHlper.getData(key: 'name') ?? 'user',
              style: TextStyles.font16BlackBold,
            ),
            verticalSpace(32),
            const ProfileOptionList(),
            BlocBuilder<NotificationCubit, bool>(
              builder: (context, isEnabled) {
                return SwitchListTile(
                  title: Text(
                    'Enable Notifications',
                    style: TextStyles.font14BlackRegular,
                  ),
                  value: isEnabled,
                  onChanged: (value) {
                    context.read<NotificationCubit>().toggleNotification(value);
                  },
                );
              },
            ),
            IconButton(
                onPressed: () async {
                  await context.read<NotificationCubit>().scheduleNotification(
                        'title',
                        'body',
                        DateTime.now().add(const Duration(seconds: 10)),
                        payload: Routes.drinkWaterRoute,
                      );
                },
                icon: const Icon(
                  size: 100,
                  Icons.dangerous,
                )),
          ],
        ),
      ),
    );
  }
}
