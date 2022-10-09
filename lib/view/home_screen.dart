import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/view/components/collapsed_horizontal_dates.dart';
import 'package:qyre/view/components/expanded_horizontal_dates.dart';
import 'package:qyre/view/components/task_plate.dart';

import 'components/page_tale.dart';
import 'components/productions_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final ScrollController _scrollController;
  late AnimationController _expandController;
  late Animation<double> animation;

  @override
  void dispose() {
    _expandController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 150) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'My Availability',
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: CoreStyles.black,
              ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: CoreStyles.veryBlack,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/house.svg'),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SvgPicture.asset('assets/icons/bars.svg'),
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
                    child: SvgPicture.asset('assets/icons/bell.svg'),
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
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
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
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 110),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ExpandedHorizontalDates(),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        TaskPlate(
                          title:
                              'Complete your profile to optimize your exposure in job searches.',
                          action: 'Complete profile',
                          progress: 0.8,
                        ),
                        SizedBox(width: 10),
                        TaskPlate(
                          title:
                              'Connect with people you might know and extend your network.',
                          action: 'Connect',
                          progress: null,
                        ),
                        SizedBox(width: 10),
                        TaskPlate(
                          title: 'Get verified as an industry professional.',
                          action: 'Get verified',
                          progress: null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const ProductionsList(),
                  const SizedBox(height: 20),
                  SizedBox(
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
                            description:
                                'Keep your CV updated to get the best offers',
                            imagePath: 'assets/icons/document.svg',
                            colors: [
                              Color(0xFF6B34C3),
                              Color(0xFF8E5EDB),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  for (var i = 0; i < 10; i++)
                    Container(
                      color: i.isOdd ? Colors.white : Colors.black12,
                      height: 100,
                      child: Center(
                        child: Text('$i', textScaleFactor: 5),
                      ),
                    ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(height: 110),
                    SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: animation,
                      child: const CollapsedHorizontalDates(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
