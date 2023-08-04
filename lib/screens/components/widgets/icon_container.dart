import 'package:flutter/material.dart';
import 'package:instaclon/screens/constants/size.dart';
import 'package:instaclon/utils/theme.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    this.padding = const EdgeInsets.all(Sizes.defaultContentPadding / 2),
    this.borderRadius =
        const BorderRadius.all(Radius.circular(Sizes.defaultBorderRadius * 2)),
    this.color = Colors.white,
    this.margin = EdgeInsets.zero,
    this.boxShadow,
    required this.child,
  });
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color? color;
  final EdgeInsets margin;
  final List<BoxShadow>? boxShadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: AppColors.backGroundGreyColor!,
                blurRadius: 20,
              )
            ],
      ),
      child: child,
    );
  }
}
