import 'package:flutter/material.dart';
import 'package:instaclon/utils/theme.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final EdgeInsets padding;

  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontSize = 12,
      this.fontWeight = FontWeight.normal,
      this.fontFamily = defaultFontFamily,
      this.overflow = TextOverflow.visible,
      this.textAlign = TextAlign.start,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
        overflow: overflow,
        textAlign: textAlign,
      ),
    );
  }
}
