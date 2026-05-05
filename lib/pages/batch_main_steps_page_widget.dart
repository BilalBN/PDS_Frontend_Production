import 'package:flutter/material.dart';
import 'package:pds_2/features/batch/presentation/widgets/list_views/batch_steps_list_view_widget.dart';

class BatchMainStepsPageWidget extends StatefulWidget {
  const BatchMainStepsPageWidget({super.key});

  @override
  State<BatchMainStepsPageWidget> createState() =>
      _BatchMainStepsPageWidgetState();
}

class _BatchMainStepsPageWidgetState extends State<BatchMainStepsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: BatchStepsListViewWidget()),
    );
  }
}
