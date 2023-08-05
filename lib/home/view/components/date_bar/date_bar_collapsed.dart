import 'package:flutter/material.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/utils/date_utils.dart';

class DateBarCollapsed extends StatelessWidget {
  const DateBarCollapsed({super.key, required this.date, this.circleColor});

  final DateTime date;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CoreStyles.veryBlack,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (date.day == DateTime.now().day)
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text(
                    'TODAY',
                    style: context.textTheme.titleMedium
                        ?.copyWith(color: CoreStyles.grey),
                  ),
                ),
              Text(
                date.shortWeekString(),
                style: context.textTheme.titleMedium
                    ?.copyWith(color: CoreStyles.white),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              if (circleColor != null)
                Container(
                  margin: const EdgeInsets.only(right: 2),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  '${date.day} ${date.shortMonthString()}.',
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: CoreStyles.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
