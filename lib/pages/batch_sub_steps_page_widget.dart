import 'package:flutter/material.dart';
import 'package:pds_2/features/batch/presentation/widgets/expansions/batch_steps_expansion_list_widget.dart';

class BatchSubStepsPageWidget extends StatefulWidget {
  const BatchSubStepsPageWidget({super.key});

  @override
  State<BatchSubStepsPageWidget> createState() =>
      _BatchSubStepsPageWidgetState();
}

class _BatchSubStepsPageWidgetState extends State<BatchSubStepsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [Flexible(child: BatchStepsExpansionListWidget())],
          ),
        ),
      ),
    );
  }
}
