import 'package:flutter/material.dart';

class PrimaryIconWidget extends StatelessWidget {
  final IconData icon;
  const PrimaryIconWidget(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Theme.of(context).colorScheme.primary);
  }
}
