import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/gen/assets.gen.dart';
import 'package:media/utils/date_utils.dart';

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
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: CoreStyles.veryBlack,
                        ),
                      ),
                      Text(
                        '$location   ${startDate.shortString()} - '
                        '${endDate.shortString()}',
                        style: context.textTheme.titleSmall?.copyWith(
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
                  colorFilter: const ColorFilter.mode(
                    CoreStyles.veryBlack,
                    BlendMode.srcIn,
                  ),
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
