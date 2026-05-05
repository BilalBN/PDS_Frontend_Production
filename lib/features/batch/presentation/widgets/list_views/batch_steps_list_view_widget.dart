import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';
import 'package:pds_2/shared/widgets/icons/primary_icon_widget.dart';

class BatchStepsListViewWidget extends StatefulWidget {
  const BatchStepsListViewWidget({super.key});

  @override
  State<BatchStepsListViewWidget> createState() =>
      _BatchStepsListViewWidgetState();
}

class _BatchStepsListViewWidgetState extends State<BatchStepsListViewWidget> {
  late List<Map<String, dynamic>> _steps;

  @override
  void initState() {
    super.initState();
    _steps = List.generate(
      9,
      (index) => {'id': index + 1, 'step': 'Manufacturing Check'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = _steps[index];
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
                          'Step ${item['id']}: ${item['step']}',
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
      itemCount: _steps.length,
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
