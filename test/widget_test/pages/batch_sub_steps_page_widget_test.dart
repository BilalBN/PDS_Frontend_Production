import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pds_2/features/batch/presentation/widgets/expansions/batch_steps_expansion_list_widget.dart';
import 'package:pds_2/pages/batch_sub_steps_page_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Batch sub steps page widget test', () {
    testWidgets('Batch sub steps page widget large screen test', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(largeScreenSize);
      await tester.pumpWidget(
        const MaterialApp(home: BatchSubStepsPageWidget()),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(BatchStepsExpansionListWidget), findsOneWidget);
    });

    testWidgets('Batch sub steps page widget small screen test', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(smallScreenSize);
      await tester.pumpWidget(
        const MaterialApp(home: BatchSubStepsPageWidget()),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(BatchStepsExpansionListWidget), findsOneWidget);
    });
  });
}
