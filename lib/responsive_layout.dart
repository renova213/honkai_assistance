import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 450;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 450 &&
      MediaQuery.of(context).size.width <= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 450 && size.width <= 1024) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
