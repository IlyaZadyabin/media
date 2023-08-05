import 'package:flutter/material.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/utils/date_utils.dart';

class DateBar extends StatelessWidget {
  const DateBar({super.key, required this.date, this.circleColor});

  final DateTime date;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CoreStyles.veryBlack,
        borderRadius: BorderRadius.circular(4),
      ),
      width: 62,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (date.day == DateTime.now().day)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'TODAY',
                style: context.textTheme.titleMedium?.copyWith(
                  color: CoreStyles.grey,
                ),
              ),
            ),
          Text(
            date.shortWeekString(),
            style:
                context.textTheme.titleLarge?.copyWith(color: CoreStyles.white),
          ),
          const SizedBox(height: 2),
          Text(
            date.shortMonthString(),
            style:
                context.textTheme.titleSmall?.copyWith(color: CoreStyles.white),
          ),
          const SizedBox(height: 2),
          Text(
            date.day.toString(),
            style:
                context.textTheme.bodyLarge?.copyWith(color: CoreStyles.white),
          ),
          if (circleColor != null)
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
