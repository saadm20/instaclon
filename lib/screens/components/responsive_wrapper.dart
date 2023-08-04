import 'package:flutter/material.dart';
import 'package:instaclon/utils/responsive.dart';

//Makes the scaffold Responsive
class ResponsiveWrapper extends StatelessWidget {
  const ResponsiveWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Responsive(
            isMobile: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                child: child),
            isDesktop: const Text("Not Available Yet")),
      ),
    );
  }
}
