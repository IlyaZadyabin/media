import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/gen/assets.gen.dart';
import 'package:qyre/home/view/components/production_tale.dart';

class ProductionsList extends StatelessWidget {
  const ProductionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today’s productions', style: context.textTheme.headline3),
        const SizedBox(height: 10),
        ProductionTale(
          title: 'Production Name That is Long',
          location: 'Sweden',
          startDate: DateTime(2022, 1, 14),
          endDate: DateTime(2023, 2, 23),
          imagePath: Assets.images.prod1.path,
        ),
        const SizedBox(height: 10),
        ProductionTale(
          title: 'What has been seen very very long te',
          location: 'Sweden',
          startDate: DateTime(2022, 1, 14),
          endDate: DateTime(2023, 2, 23),
          imagePath: Assets.images.prod2.path,
        ),
      ],
    );
  }
}
