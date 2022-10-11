import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/home/view/components/date_bar/date_bar.dart';
import 'package:qyre/home/view/components/date_bar/date_bar_collapsed.dart';

class HorizontalDates extends StatelessWidget {
  const HorizontalDates({super.key, this.isCollapsed = false});

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (i) => i).map((index) {
          Color? circleColor;
          if (index == 0 || index == 3) {
            circleColor = CoreStyles.red;
          }
          if (index == 1) {
            circleColor = CoreStyles.blue;
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: isCollapsed
                ? DateBarCollapsed(
                    date: DateTime.now().add(Duration(days: index)),
                    circleColor: circleColor,
                  )
                : DateBar(
                    date: DateTime.now().add(Duration(days: index)),
                    circleColor: circleColor,
                  ),
          );
        }).toList(),
      ),
    );
  }
}
