import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class GlassAppBar extends StatefulWidget {
  const GlassAppBar({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final AnimationController controller;

  @override
  State<GlassAppBar> createState() => _GlassAppBarState();
}

class _GlassAppBarState extends State<GlassAppBar> {
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 1),
  ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.linear));

  bool isDatesVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addStatusListener((status) {
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

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Visibility(
            visible: isDatesVisible,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 40, width: 40, color: Colors.black),
                    const SizedBox(width: 20),
                    Container(height: 40, width: 40, color: Colors.black),
                    const SizedBox(width: 20),
                    Container(height: 40, width: 40, color: Colors.black),
                  ],
                ),
              ),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: FlexibleSpaceBar(
                title: Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
            title: 'My availability',
            controller: _controller,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 100, width: 100, color: Colors.black),
                const SizedBox(width: 20),
                Container(height: 100, width: 100, color: Colors.black),
                const SizedBox(width: 20),
                Container(height: 100, width: 100, color: Colors.black),
              ],
            ),
          ),
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
