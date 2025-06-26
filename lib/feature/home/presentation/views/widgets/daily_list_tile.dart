import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/home/data/models/level_model/day.dart';
import 'package:graduation_project/feature/home/presentation/manger/cubit/challenge_cubit.dart';

class DayTaskTile extends StatefulWidget {
  const DayTaskTile({
    super.key,
    required this.day,
    this.onTap,
  });
  final Day day;
  final void Function(bool?)? onTap;
  @override
  State<DayTaskTile> createState() => _DayTaskTileState();
}

class _DayTaskTileState extends State<DayTaskTile> {
  bool isExpanded = false;
  late bool isCompleted;

  @override
  void initState() {
    isCompleted = widget.day.isCompleted ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.only(
          bottom: 16,
          left: 20,
          right: 16,
          top: 0,
        ),
        backgroundColor: isDark ? ColorsManger.darkCard : Colors.white,
        collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorsManger.grey,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorsManger.grey,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        initiallyExpanded: !isCompleted,
        title: Row(
          children: [
            Checkbox(
              activeColor:
                  isDark ? ColorsManger.neonPurple : ColorsManger.darkBlue,
              value: isCompleted,
              onChanged: (value) {
                if (value == true) {
                  isCompleted = !isCompleted;
                  context
                      .read<ChallengeCubit>()
                      .markDayCompleted(day: widget.day.dayNumber ?? 1);

                  setState(() {});
                }
              },
            ),
            Text(
              widget.day.title ?? '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        children: [
          Row(
            children: [
              Text(
                widget.day.description ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Tips: ${widget.day.tip}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.normal, fontSize: 14),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
