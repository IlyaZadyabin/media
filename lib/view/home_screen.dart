import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';
import 'package:qyre/view/components/date_bar.dart';
import 'package:qyre/view/components/glass_app_bar.dart';

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
          SliverPadding(padding: EdgeInsets.all(10)),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List<int>.generate(10, (i) => i).map((int index) {
                    Color? circleColor;
                    if (index == 0 || index == 3) {
                      circleColor = CoreStyles.red;
                    }
                    if (index == 1) {
                      circleColor = CoreStyles.blue;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DateBar(
                        date: DateTime.now().add(Duration(days: index)),
                        circleColor: circleColor,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(10)),
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
