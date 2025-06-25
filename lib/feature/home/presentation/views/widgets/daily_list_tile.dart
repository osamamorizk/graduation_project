import 'package:flutter/material.dart';

class DayTaskTile extends StatefulWidget {
  final String dayTitle;
  final String? content;

  const DayTaskTile({
    super.key,
    required this.dayTitle,
    this.content,
  });

  @override
  State<DayTaskTile> createState() => _DayTaskTileState();
}

class _DayTaskTileState extends State<DayTaskTile> {
  bool isExpanded = false;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        collapsedShape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: .2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        initiallyExpanded: false,
        title: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                if (value == true) {
                  isCompleted = !isCompleted;
                }

                setState(() {});
              },
            ),
            Expanded(
                child: Text(
              widget.dayTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ],
        ),
        children: [
          // const Divider(
          //   thickness: .5,
          //   endIndent: 20,
          //   indent: 20,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 16),
            child: Row(
              children: [
                Text(
                  ' widget.content',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
