import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pds_2/core/extensions/build_context_extensions.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';
import 'package:pds_2/shared/widgets/icons/primary_icon_widget.dart';
import 'package:pds_2/shared/widgets/texts/primary_text_widget.dart';

class BatchesGridViewWidget extends StatelessWidget {
  const BatchesGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: context.isTablet ? 2 : 1,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(NavRoutes.batchMainStepsPage);
          },
          splashColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey[200]!),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10.0,
              children: [
                // Batch ID
                const Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      Flexible(
                        child: Text(
                          'Batch ID:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        child: PrimaryTextWidget(
                          '1001',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                // Product
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    const PrimaryIconWidget(Icons.science),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        spacing: 5.0,
                        children: [
                          const Text(
                            'Senna 20 % UV',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Started ${DateTime.now()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Progress
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      const Flexible(
                        child: Text(
                          'Progress',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[300]!,
                          borderRadius: BorderRadius.circular(10.0),
                          minHeight: 5.0,
                          value: 0.5,
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          '3/9 Steps',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 15,
    );
  }
}
