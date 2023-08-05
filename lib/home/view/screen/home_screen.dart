import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media/core/core_styles.dart';
import 'package:media/home/view/screen/bottom_navigation.dart';
import 'package:media/home/view/screen/glass_frost_app_bar.dart';
import 'package:media/home/view/screen/horizontal_dates.dart';
import 'package:media/home/view/screen/my_job_offers.dart';
import 'package:media/home/view/screen/page_tale_list.dart';
import 'package:media/home/view/screen/productions_list.dart';
import 'package:media/home/view/screen/starred_posts.dart';
import 'package:media/home/view/screen/tasks.dart';

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
        title: Text('My Availability', style: context.textTheme.displaySmall),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Stack(
        children: [
          SingleChildScrollView(
            key: const Key('home_screen_scroll_view'),
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top +
                      AppBar().preferredSize.height,
                ),
                const SizedBox(height: 16),
                const HorizontalDates(),
                const SizedBox(height: 20),
                const Tasks(),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ProductionsList(),
                      SizedBox(height: 20),
                      PageTaleList(),
                      SizedBox(height: 20),
                      MyJobOffers(),
                      SizedBox(height: 20),
                      StarredPosts(),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
          GlassFrostAppBar(mainScrollController: _scrollController),
        ],
      ),
    );
  }
}
