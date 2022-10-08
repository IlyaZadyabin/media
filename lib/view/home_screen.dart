import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/core_styles.dart';
import 'components/collapsed_horizontal_dates.dart';
import 'components/expanded_horizontal_dates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final ScrollController _scrollController;

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
      if (_scrollController.offset > 150) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        setState(() {
          isDatesVisible = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isDatesVisible = false;
        });
      }
    });
  }

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1.2),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  bool isDatesVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 110),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ExpandedHorizontalDates(),
                ),
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
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 110),
                  Visibility(
                      visible: isDatesVisible,
                      child: const CollapsedHorizontalDates()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
