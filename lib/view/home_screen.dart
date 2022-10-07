import 'package:flutter/material.dart';
import 'package:qyre/view/components/glass_app_bar.dart';

import 'components/expanded_horizontal_dates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final ScrollController _scrollController;
  bool visible = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 80),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          GlassAppBar(
            title: 'My Availability',
            controller: _controller,
          ),
          const SliverPadding(padding: EdgeInsets.all(10)),
          const SliverToBoxAdapter(child: ExpandedHorizontalDates()),
          const SliverPadding(padding: EdgeInsets.all(10)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
