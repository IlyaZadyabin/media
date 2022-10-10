import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/view/components/expanded_horizontal_dates.dart';
import 'package:qyre/view/components/glass_frost_app_bar.dart';
import 'package:qyre/view/components/productions_list.dart';
import 'package:qyre/view/components/task_plate.dart';

import 'components/my_job_offers.dart';
import 'components/page_tale_list.dart';
import 'components/starred_posts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
                  const PageTaleList(),
                  const SizedBox(height: 20),
                  const MyJobOffers(),
                  const SizedBox(height: 20),
                  const StarredPosts(),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
          GlassFrostAppBar(mainScrollController: _scrollController),
        ],
      ),
    );
  }
}
