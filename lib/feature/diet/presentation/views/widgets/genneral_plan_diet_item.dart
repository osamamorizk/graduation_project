// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/helpers/spacing.dart';
// import 'package:graduation_project/core/themes/text_styles.dart';
// import 'package:graduation_project/feature/workout/data/models/general_plan_model.dart';

// class GenneralPlanDietItem extends StatelessWidget {
//   const GenneralPlanDietItem({
//     super.key,
//     required this.generalPLanModel,
//   });
//   final GeneralPLanModel generalPLanModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 120.h,
//       width: MediaQuery.sizeOf(context).width * .9,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         image: DecorationImage(
//           fit: BoxFit.fill,
//           image: AssetImage(generalPLanModel.image),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               generalPLanModel.name,
//               style: TextStyles.font16whiteBold,
//             ),
//             verticalSpace(16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("${generalPLanModel.exercises} Exercise",
//                     style: TextStyles.font16whiteRegular),
//                 horizontalSpace(20),
//                 Text(generalPLanModel.level,
//                     style: TextStyles.font16whiteRegular),
//                 horizontalSpace(20),
//                 Text(generalPLanModel.duration,
//                     style: TextStyles.font16whiteRegular),
//                 horizontalSpace(20),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
