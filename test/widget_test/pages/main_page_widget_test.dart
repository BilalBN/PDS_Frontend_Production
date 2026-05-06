import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pds_2/features/batch/presentation/widgets/buttons/filter_batches_button_widget.dart';
import 'package:pds_2/features/batch/presentation/widgets/grid_views/batches_grid_view_widget.dart';
import 'package:pds_2/features/batch/presentation/widgets/text_form_fields/search_batch_text_form_field_widget.dart';
import 'package:pds_2/pages/main_page_widget.dart';

import '../../helpers/test_helpers.dart';

void main() {
  group('Main page widget test', () {
    testWidgets('Main page widget large screen test', (tester) async {
      await tester.binding.setSurfaceSize(largeScreenSize);
      await tester.pumpWidget(const MaterialApp(home: MainPageWidget()));

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(FilterBatchesButtonWidget), findsOneWidget);
      expect(find.byType(BatchesGridViewWidget), findsOneWidget);
      expect(find.byType(SearchBatchTextFormFieldWidget), findsOneWidget);

      // Find texts
      const texts = ['Active', 'Supervised', 'Completed'];
      for (var text in texts) {
        expect(find.text(text), findsOneWidget);
      }
    });

    testWidgets('Main page widget small screen test', (tester) async {
      await tester.binding.setSurfaceSize(smallScreenSize);
      await tester.pumpWidget(const MaterialApp(home: MainPageWidget()));

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);
      expect(find.byType(FilterBatchesButtonWidget), findsOneWidget);
      expect(find.byType(BatchesGridViewWidget), findsOneWidget);
      expect(find.byType(SearchBatchTextFormFieldWidget), findsOneWidget);

      // Find texts
      const texts = ['Active', 'Supervised', 'Completed'];
      for (var text in texts) {
        expect(find.text(text), findsOneWidget);
      }
    });
  });
}
