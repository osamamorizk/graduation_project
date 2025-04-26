import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/core/themes/text_styles.dart';
import 'package:graduation_project/core/widgets/error_view.dart';
import 'package:graduation_project/feature/drink_water/presentation/manger/cubit/water_record_cubit.dart';
import 'package:graduation_project/feature/drink_water/presentation/views/widgets/drink_water_records.dart';
import 'package:intl/intl.dart';

class RecordsDetailsWidget extends StatelessWidget {
  const RecordsDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterRecordCubit, WaterRecordState>(
      builder: (context, state) {
        if (state is WaterRecordSuccess) {
          return state.waterRecordModel.isEmpty
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'There is no water records today',
                    style: TextStyles.font16BlackRegular,
                  ),
                ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 12),
                      child: Text(
                        "Today's records",
                        style: TextStyles.font16BlackBold,
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(6),
                        child: SvgPicture.asset(
                          Assets.svgsClock,
                          height: 25,
                        ),
                      ),
                      title: Text(
                        DateFormat('hh:mm a')
                            .format(state.waterRecordModel[0].nextTime),
                        style: TextStyles.font14BlackRegular,
                      ),
                      subtitle: Text(
                        'Next time',
                        style: TextStyles.font14BlackRegular
                            .copyWith(color: ColorsManger.grey),
                      ),
                      trailing: Text(
                        '400 ml',
                        style: TextStyles.font14BlackRegular,
                      ),
                    ),
                    DrinkWaterRecordsItem(
                        waterRecordModel: state.waterRecordModel),
                  ],
                );
        } else {
          return const ErrorView(errorMessage: 'there was an error');
        }
      },
    );
  }
}
