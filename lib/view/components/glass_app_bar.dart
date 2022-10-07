import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qyre/core/core_styles.dart';

import 'collapsed_horizontal_dates.dart';

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
                child: const CollapsedHorizontalDates(),
              ),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 16, bottom: 20),
                title: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: CoreStyles.black,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
