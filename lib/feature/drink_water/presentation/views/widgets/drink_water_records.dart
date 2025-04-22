import 'package:flutter/material.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/text_styles.dart';

class DrinkWaterRecordsItem extends StatelessWidget {
  const DrinkWaterRecordsItem({super.key, required this.records});
  final List records;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
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
            trailing: Text(
              record['amount'],
              style: TextStyles.font14BlackRegular,
            ),
          ),
        );
      },
    );
  }
}
