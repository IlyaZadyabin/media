import 'package:flutter/material.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/home/view/components/starred_post.dart';

class StarredPosts extends StatelessWidget {
  const StarredPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Starred posts', style: context.textTheme.displaySmall),
        const SizedBox(height: 10),
        StarredPost(
          title: 'Media US Production',
          starredWhen: DateTime.now().subtract(const Duration(days: 1)),
          descriptionTitle: 'Updated privileges for current',
          description:
              'I changed your admin roles to posters. With that you can’t '
              'send out offers. Just use the communication tool to get all '
              'the features!',
        ),
      ],
    );
  }
}
