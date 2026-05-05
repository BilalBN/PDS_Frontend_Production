import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const PrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      padding: padding ?? const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      textColor: Theme.of(context).colorScheme.onPrimary,
      onPressed: onPressed,
      child: child,
    );
  }
}
