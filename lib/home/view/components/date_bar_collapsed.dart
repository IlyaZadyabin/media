import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qyre/core/core_styles.dart';

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
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 10,
                          color: CoreStyles.grey,
                        ),
                  ),
                ),
              Text(
                DateFormat('EEEE').format(date).substring(0, 3),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: CoreStyles.white, fontSize: 10),
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
                  '${date.day} '
                  '${DateFormat('MMMM').format(date).substring(0, 3)}.',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: CoreStyles.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
