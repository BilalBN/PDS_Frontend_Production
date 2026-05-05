import 'package:flutter/material.dart';

class PrimaryTextWidget extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;

  const PrimaryTextWidget(
    this.text, {
    super.key,
    this.maxLines,
    this.overflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: style == null
          ? TextStyle(color: Theme.of(context).colorScheme.primary)
          : style?.copyWith(color: Theme.of(context).colorScheme.primary),
    );
  }
}
