import 'package:flutter/material.dart';
import 'package:qyre/view/components/page_tale.dart';

class PageTaleList extends StatelessWidget {
  const PageTaleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: const [
          Expanded(
            child: PageTale(
              title: 'My network',
              description: 'Connect and grow your network',
              imagePath: 'assets/icons/people.svg',
              colors: [
                Color(0xFF3465C3),
                Color(0xFF5785DE),
              ],
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: PageTale(
              title: 'Quick hire',
              description: 'Hire someone quickly today',
              imagePath: 'assets/icons/qyre.svg',
              colors: [
                Color(0xFFEC4E27),
                Color(0xFFF47E61),
              ],
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: PageTale(
              title: 'My CV',
              description: 'Keep your CV updated to get the best offers',
              imagePath: 'assets/icons/document.svg',
              colors: [
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
