import 'package:flutter/material.dart';

import 'job_offer.dart';

class MyJobOffers extends StatelessWidget {
  const MyJobOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My job offers',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 10),
        JobOffer(
          title: 'Boom operator',
          offerDate: DateTime(2021, 6, 12),
          companyName: 'Masterchef',
          startDate: DateTime(2022, 1, 14),
          endDate: DateTime(2022, 2, 23),
        ),
        const SizedBox(height: 10),
        JobOffer(
          title: 'Boom operator',
          offerDate: DateTime(2021, 6, 12),
          companyName: 'Masterchef',
          startDate: DateTime(2022, 1, 14),
          endDate: DateTime(2022, 2, 23),
        ),
      ],
    );
  }
}
