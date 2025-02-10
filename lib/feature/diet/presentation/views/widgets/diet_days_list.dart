import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/day_container.dart';
import 'package:graduation_project/core/widgets/days_list_shimmer.dart';
import 'package:graduation_project/feature/diet/presentation/manger/cubit/diet_cubit.dart';

class DietDaysList extends StatefulWidget {
  const DietDaysList({
    super.key,
  });
  @override
  State<DietDaysList> createState() => _DietDaysListState();
}

class _DietDaysListState extends State<DietDaysList>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 30,
      child: BlocBuilder<DietCubit, DietCubitState>(
        buildWhen: (previous, current) =>
            current is GetAllDietLoading ||
            current is GetAllDietSuccess ||
            current is GetAllDietFailure,
        builder: (context, state) {
          if (state is GetAllDietSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.allDietList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      context.read<DietCubit>().getMealsByDay(
                          day: state.allDietList[index].day ?? 'day');
                    });
                  },
                  child: DayContainer(
                    isSelected: currentIndex == index,
                    day: state.allDietList[index].day ?? 'day',
                  ),
                );
              },
            );
          } else if (state is GetAllDietFailure) {
            return const SizedBox.shrink();
          } else {
            return const DaysListShimmer();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
