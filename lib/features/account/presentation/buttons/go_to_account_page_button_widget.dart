import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';

class GoToAccountPageButtonWidget extends StatelessWidget {
  const GoToAccountPageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => GoRouter.of(context).push(NavRoutes.accountPage),
      icon: const Icon(Ionicons.person),
    );
  }
}
