import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pds_2/features/batch/presentation/widgets/list_views/batch_steps_list_view_widget.dart';
import 'package:pds_2/pages/batch_main_steps_page_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Batch main steps page widget test', () {
    testWidgets('Batch main steps page widget large screen test', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(largeScreenSize);
      await tester.pumpWidget(
        const MaterialApp(home: BatchMainStepsPageWidget()),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(BatchStepsListViewWidget), findsOneWidget);
    });

    testWidgets('Batch main steps page widget small screen test', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(smallScreenSize);
      await tester.pumpWidget(
        const MaterialApp(home: BatchMainStepsPageWidget()),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(BatchStepsListViewWidget), findsOneWidget);
    });
  });
}
