import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/theme_cubit_cubit.dart';
import 'package:graduation_project/feature/profile/presentation/views/widgets/theme_selection_item.dart';

class ThemeSelectionWidget extends StatelessWidget {
  const ThemeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentThemeMode = context.watch<ThemeCubit>().state;
    return ExpansionTile(
      initiallyExpanded: true,
      minTileHeight: 60,
      title: const Text('Theme'),
      shape: tileShape(borderColor: Colors.grey),
      collapsedShape: tileShape(),
      children: [
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.system,
            icon: Icons.mobile_friendly,
            title: 'System',
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.system)),
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.light,
            icon: Icons.light_mode,
            title: 'Light',
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.light)),
        ThemeSelctionItem(
            selected: currentThemeMode == ThemeMode.dark,
            icon: Icons.dark_mode,
            title: 'Dark',
            onTap: () => context.read<ThemeCubit>().setTheme(ThemeMode.dark)),
      ],
    );
  }

  OutlineInputBorder tileShape({Color? borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: .05, color: borderColor ?? Colors.grey),
    );
  }
}
