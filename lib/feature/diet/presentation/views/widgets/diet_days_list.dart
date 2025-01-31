import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/day_container.dart';

class DietDaysList extends StatefulWidget {
  const DietDaysList({
    super.key,
  });
  @override
  State<DietDaysList> createState() => _DietDaysListState();
}

class _DietDaysListState extends State<DietDaysList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: DayContainer(
              isSelected: currentIndex == index,
              day: 'day',
            ),
          );
        },
      ),
    );
  }
}
