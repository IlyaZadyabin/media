import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/core/core_styles.dart';

class StarredPost extends StatelessWidget {
  const StarredPost({
    super.key,
    required this.title,
    required this.starredWhen,
    required this.descriptionTitle,
    required this.description,
  });

  final String title;
  final DateTime starredWhen;
  final String descriptionTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    final daysAgo = DateTime.now().difference(starredWhen).inDays;

    return Container(
      decoration: BoxDecoration(
        color: CoreStyles.lightGrey,
        borderRadius: BorderRadius.circular(4),
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
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: CoreStyles.black,
                    ),
              ),
              Text(
                daysAgo == 1 ? '$daysAgo day ago' : '$daysAgo days ago',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: CoreStyles.darkGrey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          const Divider(color: CoreStyles.white, thickness: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                descriptionTitle,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: CoreStyles.veryBlack,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/list.svg'),
              const SizedBox(width: 6),
              SvgPicture.asset('assets/icons/image.svg'),
              const SizedBox(width: 6),
              SvgPicture.asset('assets/icons/pin.svg'),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: CoreStyles.darkGrey, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
