import 'package:flutter/material.dart';
import 'package:pds_2/core/globals/keys.dart';

class FlutterHelpers {
  static void showSnackBar(
    Color backgroundColor,
    Widget content, {
    Duration duration = const Duration(seconds: 1),
    VoidCallback? onSnackbarClosed,
  }) {
    final currentState = scaffoldState.currentState!;
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: content,
      duration: duration,
    );
    final controller = currentState.showSnackBar(snackBar);
    controller.closed.then((_) {
      if (onSnackbarClosed != null) onSnackbarClosed();
    });
  }
}
