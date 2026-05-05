import 'package:flutter/material.dart';

class NullableTextWidget extends StatelessWidget {
  final String? text;
  final int? maxLines;
  final String onNull;
  final TextOverflow? overflow;
  final TextStyle? style;

  const NullableTextWidget(
    this.text, {
    super.key,
    this.maxLines,
    this.overflow,
    this.onNull = 'N/A',
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final String displayText = (text == null || text!.toLowerCase() == 'null')
        ? onNull
        : text!;

    return Text(
      displayText,
      maxLines: maxLines,
      overflow: overflow,
      style: style,
    );
  }
}
