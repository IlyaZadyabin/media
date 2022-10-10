import 'package:flutter/material.dart';
import 'package:qyre/gen/assets.gen.dart';
import 'package:qyre/home/view/components/page_tale.dart';

class PageTaleList extends StatelessWidget {
  const PageTaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: PageTale(
              title: 'My network',
              description: 'Connect and grow your network',
              imagePath: Assets.icons.people.path,
              colors: const [
                Color(0xFF3465C3),
                Color(0xFF5785DE),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: PageTale(
              title: 'Quick hire',
              description: 'Hire someone quickly today',
              imagePath: Assets.icons.qyre.path,
              colors: const [
                Color(0xFFEC4E27),
                Color(0xFFF47E61),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: PageTale(
              title: 'My CV',
              description: 'Keep your CV updated to get the best offers',
              imagePath: Assets.icons.document.path,
              colors: const [
                Color(0xFF6B34C3),
                Color(0xFF8E5EDB),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
