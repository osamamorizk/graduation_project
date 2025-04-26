import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/cashe_helper.dart';
import 'package:meta/meta.dart';

part 'theme_cubit_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);
  final String themeKey = 'theme_mode';

  void loadTheme() {
    final themeMode = CasheHlper.getData(key: themeKey);
    if (themeMode != null) {
      emit(themeMode == 'light' ? ThemeMode.light : ThemeMode.dark);
    }
  }

  void toggleTheme() async {
    final newTheme =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    await CasheHlper.saveData(
      key: themeKey,
      value: newTheme == ThemeMode.light ? 'light' : 'dark',
    );
  }
}
