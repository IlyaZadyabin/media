import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/utils/date_utils.dart';

class JobOffer extends StatelessWidget {
  const JobOffer({
    super.key,
    required this.title,
    required this.offerDate,
    required this.companyName,
    required this.startDate,
    required this.endDate,
  });

  final String title;
  final DateTime offerDate;
  final String companyName;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final amountOfDays = endDate.difference(startDate).inDays;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: CoreStyles.lightGrey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: context.textTheme.bodyText1),
              Text(
                offerDate.shortString(),
                style: context.textTheme.caption
                    ?.copyWith(color: CoreStyles.darkGrey),
              ),
            ],
          ),
          const Divider(color: CoreStyles.white, thickness: 1),
          Text(
            companyName,
            style: context.textTheme.bodyText2
                ?.copyWith(color: CoreStyles.veryBlack),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${startDate.shortString()} - ${endDate.shortString()}',
                style: context.textTheme.caption
                    ?.copyWith(color: CoreStyles.darkGrey),
              ),
              Text(
                amountOfDays == 1 ? '$amountOfDays day' : '$amountOfDays days',
                style: context.textTheme.caption
                    ?.copyWith(color: CoreStyles.darkGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
