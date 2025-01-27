// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/feature/bottom_nav_bar/presentation/manger/cubit/bottom_bar_cubit.dart';
// import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/widgets/bottom_bar_consts.dart';

// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});

//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       controller: BlocProvider.of<BottomBarCubit>(context).controller,
//       screens: buildScreens(),
//       items: navBarsItems(),
//       handleAndroidBackButtonPress: true,
//       resizeToAvoidBottomInset: true,
//       stateManagement: true,
//       hideNavigationBarWhenKeyboardAppears: true,
//       backgroundColor: Colors.white,
//       decoration: const NavBarDecoration(
//           colorBehindNavBar: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               offset: Offset(0, -1),
//               blurRadius: 15,
//               spreadRadius: 0,
//             ),
//           ],
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//       isVisible: true,
//       animationSettings: const NavBarAnimationSettings(
//         navBarItemAnimation: ItemAnimationSettings(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.linear,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimationSettings(
//           animateTabTransition: true,
//           duration: Duration(milliseconds: 200),
//           screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
//         ),
//       ),
//       confineToSafeArea: true,
//       navBarHeight: 60,
//       navBarStyle: NavBarStyle.style8,
//     );
//   }
// }
