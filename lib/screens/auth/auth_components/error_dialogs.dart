import 'package:flutter/material.dart';
import 'package:instaclon/screens/components/widgets/buttons.dart';
import 'package:instaclon/screens/components/widgets/text_widgets.dart';
import 'package:instaclon/utils/theme.dart';

class ErrorSnackBar {
  final String errorMessage;
  final int duration;

  const ErrorSnackBar({
    required this.errorMessage,
    this.duration = 2,
  });

  static show(
    BuildContext context,
    String message, [
    int duration = 2,
  ]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: duration),
        action: SnackBarAction(
          label: 'Cancel',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

class ErrorMaterialBanner {
  final String errorMessage;
  final int duration;

  const ErrorMaterialBanner({
    required this.errorMessage,
    this.duration = 2,
  });

  static show(
    BuildContext context,
    String message, [
    int duration = 2,
  ]) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        elevation: 0.0,
        content: CustomText(
          text: message,
          fontFamily: titleFontFamily,
          color: Theme.of(context).colorScheme.error,
        ),
        onVisible: () {
          Future.delayed(Duration(seconds: duration),
              () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner());
        },
        actions: [
          CustomTextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text(
                "Cancel",
              ))
        ],
      ),
    );
  }
}
