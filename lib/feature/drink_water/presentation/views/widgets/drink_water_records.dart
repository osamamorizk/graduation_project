import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/feature/drink_water/data/models/water_record_model.dart';
import 'package:intl/intl.dart';

class DrinkWaterRecordsItem extends StatelessWidget {
  const DrinkWaterRecordsItem({super.key, required this.waterRecordModel});
  final List<WaterRecordModel> waterRecordModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: waterRecordModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            tileColor: Colors.transparent,
            leading: Image.asset(
              Assets.imagesBottel,
              height: 50,
              width: 40,
            ),
            title: Text(
              DateFormat('hh:mm a').format(waterRecordModel[index].time),
              style: TextStyles.font14Regular,
            ),
            trailing: Text(
              "${waterRecordModel[index].amount.toString()} ml",
              style: TextStyles.font14Regular,
            ),
          ),
        );
      },
    );
  }
}
