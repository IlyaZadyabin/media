import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/gen/assets.gen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: CoreStyles.veryBlack,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SvgPicture.asset(Assets.icons.house.path),
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SvgPicture.asset(Assets.icons.bars.path),
          ),
          label: 'info',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 30,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SvgPicture.asset(Assets.icons.bell.path),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: CoreStyles.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '2',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: CoreStyles.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          label: 'notifications',
        ),
      ],
    );
  }
}
