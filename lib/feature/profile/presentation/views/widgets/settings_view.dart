import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/drink_water/presentation/manger/notification_cubit/notification_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/theme_selection_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 45,
        titleSpacing: 0,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            verticalSpace(16),
            const ThemeSelectionWidget(),
            verticalSpace(24),
            BlocBuilder<NotificationCubit, bool>(
              builder: (context, isEnabled) {
                return SwitchListTile(
                  shape: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: ColorsManger.lighterGrey,
                      width: .05,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(
                    'Enable Notifications',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  value: isEnabled,
                  onChanged: (value) {
                    context.read<NotificationCubit>().toggleNotification(value);
                  },
                );
              },
            ),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
