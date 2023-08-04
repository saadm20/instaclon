import 'package:flutter/material.dart';
import 'package:instaclon/screens/constants/size.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;

  const CustomElevatedButton(
      {super.key,
      this.backgroundColor,
      required this.onPressed,
      this.foregroundColor,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: Sizes.defaultContentPadding),
      this.padding = EdgeInsets.zero,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: contentPadding,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Sizes.defaultBorderRadius))),
        child: child,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;

  const CustomTextButton(
      {super.key,
      this.backgroundColor,
      required this.onPressed,
      this.foregroundColor,
      this.contentPadding = EdgeInsets.zero,
      this.padding = EdgeInsets.zero,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: contentPadding,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Sizes.defaultBorderRadius))),
        child: child,
      ),
    );
  }
}
