import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget isMobile;
  final Widget? isTablet;
  final Widget isDesktop;
  const Responsive({
    super.key,
    required this.isMobile,
    this.isTablet,
    required this.isDesktop,
  });

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).height <= 600;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).height > 600 &&
      MediaQuery.sizeOf(context).height < 1100;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.sizeOf(context).height > 1100;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth <= 600) {
      return isMobile;
    } else if (screenWidth > 600 && screenWidth < 1100 && isTablet != null) {
      return isTablet!;
    } else {
      return isDesktop;
    }
  }
}
