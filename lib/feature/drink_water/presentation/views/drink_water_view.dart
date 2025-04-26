import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/functions/custom_snack_bar.dart';
import 'package:graduation_project/core/helpers/const.dart';
import 'package:graduation_project/core/helpers/spacing.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:graduation_project/feature/drink_water/presentation/manger/cubit/water_record_cubit.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/percent_indicator_widget.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/record_details_body.dart';
import 'package:hive/hive.dart';

class WaterTrackerScreen extends StatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  State<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends State<WaterTrackerScreen> {
  int dailyTarget = 2440;
  int currentIntake = 0;
  final drinkedWater = Hive.box(kDrinkedWater);
  final now = DateTime.now();

  @override
  void initState() {
    currentIntake = drinkedWater.get('currentIntake') ?? 0;
    final today = DateTime.now();
    final lastOpenDate = drinkedWater.get(kLastOpenDate) as DateTime?;

    if (lastOpenDate == null ||
        lastOpenDate.day != today.day ||
        lastOpenDate.month != today.month ||
        lastOpenDate.year != today.year) {
      currentIntake = 0;
      drinkedWater.put('currentIntake', currentIntake);
      Hive.box<WaterRecordModel>(kWaterRimenderBox).clear();
      drinkedWater.put(kLastOpenDate, today);
    } else {
      currentIntake = drinkedWater.get('currentIntake') ?? 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double percent = currentIntake / dailyTarget;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
                        context
                            .read<WaterRecordCubit>()
                            .addRecord((dailyTarget - currentIntake));
                        currentIntake += (dailyTarget - currentIntake);
                      } else {
                        currentIntake += 400;
                        context.read<WaterRecordCubit>().addRecord(400);
                      }
                    } else {
                      showCustomSnackBar(context,
                          text: 'Already reach the target !');
                    }
                    drinkedWater.put('currentIntake', currentIntake);
                    drinkedWater.put('lastOpenDate', now);
                  });
                },
                percent: percent,
                currentIntake: currentIntake,
                dailyTarget: dailyTarget,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: .2,
                    color: ColorsManger.grey,
                  ),
                ),
                child: const RecordsDetailsWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
