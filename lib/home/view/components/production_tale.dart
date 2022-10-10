import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/gen/assets.gen.dart';
import 'package:qyre/utils/date_utils.dart';

class ProductionTale extends StatelessWidget {
  const ProductionTale({
    super.key,
    required this.title,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
  });

  final String title;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CoreStyles.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image(
              image: AssetImage(imagePath),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: CoreStyles.veryBlack,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        '$location   ${startDate.shortString()} - '
                        '${endDate.shortString()}',
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: CoreStyles.darkGrey,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  Assets.icons.smallArrowRight.path,
                  width: 10,
                  height: 10,
                  color: CoreStyles.veryBlack,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
