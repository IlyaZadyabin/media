import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/utils/date_utils.dart';

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
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CoreStyles.grey,
                    ),
              ),
            ),
          Text(
            date.shortWeekString(),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: CoreStyles.white),
          ),
          const SizedBox(height: 2),
          Text(
            date.shortMonthString(),
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: CoreStyles.white),
          ),
          const SizedBox(height: 2),
          Text(
            date.day.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: CoreStyles.white),
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
