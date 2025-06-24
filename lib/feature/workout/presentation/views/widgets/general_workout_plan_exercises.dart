// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:graduation_project/core/helpers/app_assets.dart';
// import 'package:graduation_project/core/helpers/extensions.dart';
// import 'package:graduation_project/core/routes/routes.dart';
// import 'package:graduation_project/core/themes/colors_manger.dart';
// import 'package:graduation_project/core/widgets/calories_and_time.dart';
// import 'package:graduation_project/core/widgets/image_and_title_widget.dart';
// import 'package:graduation_project/feature/workout/data/models/general_workout_plan_models/general_plan_details_model/general_plan_details_model.dart';

// class GeneralWorkoutPlanExercises extends StatelessWidget {
//   const GeneralWorkoutPlanExercises(
//       {super.key, required this.generalPlanDetailsModel});
//   final GeneralWorkoutPlanDetailsModel generalPlanDetailsModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const ImageAndTitleWidget(
//               name: '',
//               imageUrl: '',
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Positioned(
//                     top: -25,
//                     left: MediaQuery.of(context).size.width / 20,
//                     child: CalorisAndTimeWidget(
//                       widget: Row(
//                         children: [
//                           const SizedBox(
//                             height: 12,
//                             child: VerticalDivider(
//                               thickness: 1.5,
//                               width: 15,
//                               color: ColorsManger.grey,
//                             ),
//                           ),
//                           Text(
//                             generalPlanDetailsModel.difficulty ?? 'Easy',
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20),
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: 5,
//                       separatorBuilder: (context, index) => const Divider(
//                         color: ColorsManger.lighterGrey,
//                       ),
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             context.pushNamed(Routes.workoutExerciseDetails);
//                           },
//                           child: const TitleAndTimeWidget(
//                             title: 'Exercise 1',
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
