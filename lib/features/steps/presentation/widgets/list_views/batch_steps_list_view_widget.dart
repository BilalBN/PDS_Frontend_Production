import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pds_2/features/steps/models/main_steps_model.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';
import 'package:pds_2/shared/widgets/icons/primary_icon_widget.dart';

class BatchStepsListViewWidget extends StatelessWidget {
  final List<MainStepsModel> mainSteps;
  const BatchStepsListViewWidget({super.key, required this.mainSteps});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = mainSteps[index];
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(NavRoutes.batchSubStepsPage);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              spacing: 10.0,
              children: [
                Flexible(
                  child: Row(
                    spacing: 10.0,
                    children: [
                      const PrimaryIconWidget(Ionicons.checkmark_circle),
                      Flexible(
                        child: Text(
                          'Step ${index + 1}: ${item.name}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const PrimaryIconWidget(Ionicons.chevron_forward),
              ],
            ),
          ),
        );
      },
      itemCount: mainSteps.length,
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 15.0,
        top: 15.0,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10.0),
    );
  }
}
