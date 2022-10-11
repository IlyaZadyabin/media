import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qyre/home/view/screen/horizontal_dates.dart';

class GlassFrostAppBar extends StatefulWidget {
  const GlassFrostAppBar({super.key, required this.mainScrollController});

  final ScrollController mainScrollController;

  @override
  State<GlassFrostAppBar> createState() => _GlassFrostAppBarState();
}

class _GlassFrostAppBarState extends State<GlassFrostAppBar>
    with TickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> animation;

  @override
  void dispose() {
    _expandController.dispose();
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

    widget.mainScrollController.addListener(() {
      if (widget.mainScrollController.offset > 150) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: HorizontalDates(isCollapsed: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
