import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qyre/core/core_styles.dart';

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
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: CoreStyles.black),
              ),
              Text(
                DateFormat('MMM dd, yyyy').format(offerDate),
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: CoreStyles.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          const Divider(color: CoreStyles.white, thickness: 1),
          Text(
            companyName,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: CoreStyles.veryBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DateFormat('MMM dd, yyyy').format(startDate)} - '
                '${DateFormat('MMM dd, yyyy').format(endDate)}',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: CoreStyles.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              Text(
                amountOfDays == 1 ? '$amountOfDays day' : '$amountOfDays days',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: CoreStyles.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
