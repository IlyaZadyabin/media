// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// class GlassAppBar extends StatefulWidget {
//   const GlassAppBar({
//     super.key,
//     required this.title,
//     required this.controller,
//   });
//
//   final String title;
//   final AnimationController controller;
//
//   @override
//   State<GlassAppBar> createState() => _GlassAppBarState();
// }
//
// class _GlassAppBarState extends State<GlassAppBar> {
//   late final Animation<Offset> _offsetAnimation = Tween<Offset>(
//     begin: Offset.zero,
//     end: const Offset(0, 1),
//   ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.linear));
//
//   bool isDatesVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addStatusListener((status) {
//       if (status == AnimationStatus.forward) {
//         setState(() {
//           isDatesVisible = true;
//         });
//       }
//       if (status == AnimationStatus.dismissed) {
//         setState(() {
//           isDatesVisible = false;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {}
// }
