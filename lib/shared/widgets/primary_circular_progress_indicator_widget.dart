import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryCircularProgressIndicatorWidget extends StatelessWidget {
  const PrimaryCircularProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
