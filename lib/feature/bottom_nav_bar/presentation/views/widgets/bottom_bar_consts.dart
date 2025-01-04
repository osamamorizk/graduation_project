import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_view.dart';
import 'package:graduation_project/feature/home/presentation/views/home_view.dart';
import 'package:graduation_project/feature/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/scan_food_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/workout_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.svgsBottomBarActiveHome,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveHome,
      ),
      activeColorPrimary: ColorsManger.darkBlue,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.svgsBottomBarActiveDiet,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveDiet,
      ),
      activeColorPrimary: ColorsManger.darkBlue,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.svgsBottomBarActiveScan,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveScan,
      ),
      activeColorPrimary: ColorsManger.darkBlue,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.svgsBottomBarActiveWorkouts,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveWorkouts,
      ),
      activeColorPrimary: ColorsManger.darkBlue,
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        Assets.svgsBottomBarActiveProfile,
      ),
      inactiveIcon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveProfile,
      ),
      activeColorPrimary: ColorsManger.darkBlue,
    ),
  ];
}

List<Widget> buildScreens() {
  return [
    const HomeView(),
    const DietView(),
    const ScanFoodView(),
    const WorkoutView(),
    const ProfileView(),
  ];
}
