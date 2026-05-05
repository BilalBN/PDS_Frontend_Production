import 'package:flutter/material.dart';

class BatchStepsExpansionListWidget extends StatefulWidget {
  const BatchStepsExpansionListWidget({super.key});

  @override
  State<BatchStepsExpansionListWidget> createState() =>
      _BatchStepsExpansionListWidgetState();
}

class _BatchStepsExpansionListWidgetState
    extends State<BatchStepsExpansionListWidget> {
  late List<Map<String, dynamic>> _steps;

  @override
  void initState() {
    super.initState();
    _steps = List.generate(9, (index) => {'id': index + 1, 'step': 'ABC'});
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          animationDuration: const Duration(milliseconds: 300),
          dividerColor: Colors.grey[200],
          elevation: 0.0,
          expandIconColor: Theme.of(context).colorScheme.primary,
          materialGapSize: 0.0,
          children: _steps
              .map(
                (item) => ExpansionPanelRadio(
                  backgroundColor: Colors.white,
                  canTapOnHeader: true,
                  value: item['id'],
                  headerBuilder: (context, isExpanded) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Step ${item['id']}: ${item['step']}'),
                  ),
                  body: const Text('data'),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
