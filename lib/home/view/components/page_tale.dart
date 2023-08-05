import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:media/core/core_styles.dart';

class PageTale extends StatelessWidget {
  const PageTale({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.colors,
  });

  final String title;
  final String description;
  final String imagePath;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(top: 17, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(imagePath),
          const SizedBox(height: 12),
          Text(
            title,
            style: context.textTheme.headlineSmall?.copyWith(
              color: CoreStyles.white,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            description,
            style: context.textTheme.titleSmall?.copyWith(
              color: CoreStyles.white,
            ),
          ),
        ],
      ),
    );
  }
}
