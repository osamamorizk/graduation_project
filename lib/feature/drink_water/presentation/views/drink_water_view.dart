import 'package:flutter/material.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/drink_water_records.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/percent_indicator_widget.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  double dailyTarget = 2440;

  double currentIntake = 1000;

  final List<Map<String, String>> records = [
    {'time': '10:00 AM', 'amount': '400 ml'},
    {'time': '9:00 AM', 'amount': '400 ml'},
    {'time': '8:00 AM', 'amount': '400 ml'},
  ];

  @override
  Widget build(BuildContext context) {
    double percent = currentIntake / dailyTarget;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Drinking water tracker",
              style: TextStyles.font18BlackBold,
            ),
            Text(
              "It is your reminder to drink water",
              style: TextStyle(color: ColorsManger.darkerGrey),
            ),
            verticalSpace(24),
            PercentIndicatorWidget(
              onTap: () {
                setState(() {
                  if (currentIntake < dailyTarget) {
                    if ((dailyTarget - currentIntake) < 400) {
                      currentIntake += (dailyTarget - currentIntake);
                    } else {
                      currentIntake += 400;
                    }
                  } else {
                    showCustomSnackBar(context,
                        text: 'Already reach the target !');
                  }
                });
              },
              percent: percent,
              currentIntake: currentIntake,
              dailyTarget: dailyTarget,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: .2,
                      color: ColorsManger.grey,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 12),
                        child: Text(
                          "Today's records",
                          style: TextStyles.font16BlackBold,
                        ),
                      ),
                      DrinkWaterRecordsItem(records: records),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
