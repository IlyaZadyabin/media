import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/home/view/components/date_bar_collapsed.dart';

class CollapsedHorizontalDates extends StatelessWidget {
  const CollapsedHorizontalDates({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: List<int>.generate(10, (i) => i).map((int index) {
            Color? circleColor;
            if (index == 0 || index == 3) {
              circleColor = CoreStyles.red;
            }
            if (index == 1) {
              circleColor = CoreStyles.blue;
            }
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DateBarCollapsed(
                date: DateTime.now().add(Duration(days: index)),
                circleColor: circleColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
