import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/day_container.dart';

class DaysList extends StatefulWidget {
  const DaysList({
    super.key,
  });

  @override
  State<DaysList> createState() => _DaysListState();
}

class _DaysListState extends State<DaysList> {
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
              day: 'Day 1',
              isSelected: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}
