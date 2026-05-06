import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
import 'package:pds_2/features/account/models/account_model.dart';
import 'package:pds_2/pages/account_page_widget.dart';
import 'package:provider/provider.dart';

import '../../helpers/test_helpers.dart';

class _MockGetAccountCubit extends MockCubit<GetAccountState>
    implements GetAccountCubit {}

void main() {
  late GetAccountCubit getAccountCubit;

  setUpAll(() {
    getAccountCubit = _MockGetAccountCubit();
    when(() => getAccountCubit.getAccount()).thenAnswer((_) async => {});
    when(() => getAccountCubit.state).thenReturn(
      GetAccountSuccess(
        account: AccountModel.fromJson({
          'id': 1,
          'email': 'test@example.com',
          'phone': '7410258963',
          'role': 'operator',
          'user_name': 'test_user',
        }),
      ),
    );
  });

  group('Account page widget test', () {
    testWidgets('Account page widget large screen test', (tester) async {
      await tester.binding.setSurfaceSize(largeScreenSize);
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [BlocProvider(create: (context) => getAccountCubit)],
            child: const AccountPageWidget(),
          ),
        ),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);

      // Find texts
      const texts = ['test@example.com', '7410258963'];
      for (var text in texts) {
        expect(find.text(text), findsOneWidget);
      }
    });

    testWidgets('Account page widget small screen test', (tester) async {
      await tester.binding.setSurfaceSize(smallScreenSize);
      await tester.pumpWidget(
        MaterialApp(
          home: MultiProvider(
            providers: [BlocProvider(create: (context) => getAccountCubit)],
            child: const AccountPageWidget(),
          ),
        ),
      );

      // Find widgets
      expect(find.byType(OverflowBar), findsNothing);
      expect(find.byType(OverflowBox), findsNothing);

      // Find texts
      const texts = ['test@example.com', '7410258963'];
      for (var text in texts) {
        expect(find.text(text), findsOneWidget);
      }
    });
  });
}
