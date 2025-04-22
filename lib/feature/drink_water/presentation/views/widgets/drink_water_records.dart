import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class DrinkWaterRecordsItem extends StatelessWidget {
  const DrinkWaterRecordsItem({super.key, required this.records});
  final List records;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Image.asset(
                Assets.imagesBottel,
                height: 50,
                width: 40,
              ),
              title: Text(
                record['time']!,
                style: TextStyles.font14BlackRegular,
              ),
              subtitle: Text(
                index == 0 ? "Next time" : "",
                style: TextStyles.font14BlackRegular
                    .copyWith(color: ColorsManger.grey),
              ),
              trailing: Text(
                record['amount'],
                style: TextStyles.font14BlackRegular,
              ),
            ),
          );
        },
      ),
    );
  }
}
