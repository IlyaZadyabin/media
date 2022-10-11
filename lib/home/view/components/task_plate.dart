import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/gen/assets.gen.dart';

class TaskPlate extends StatelessWidget {
  const TaskPlate({
    super.key,
    required this.title,
    required this.action,
    required this.progress,
  });

  final String title;
  final String action;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CoreStyles.lightGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      width: 310,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme.headline4
                ?.copyWith(color: CoreStyles.veryBlack),
          ),
          const SizedBox(height: 18),
          if (progress != null)
            LinearProgressIndicator(
              backgroundColor: CoreStyles.white,
              color: CoreStyles.blue,
              minHeight: 8,
              value: progress,
            )
          else
            const SizedBox(height: 8),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  action,
                  style: context.textTheme.bodyText2?.copyWith(
                    color: CoreStyles.veryBlack,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              SvgPicture.asset(
                Assets.icons.smallArrowRight.path,
                color: CoreStyles.veryBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
