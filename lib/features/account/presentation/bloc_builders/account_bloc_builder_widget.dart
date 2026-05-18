import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
import 'package:pds_2/shared/widgets/primary_circular_progress_indicator_widget.dart';
import 'package:pds_2/shared/widgets/texts/nullable_text_widget.dart';

class AccountBlocBuilderWidget extends StatelessWidget {
  const AccountBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAccountCubit, GetAccountState>(
      builder: (context, state) {
        switch (state) {
          case GetAccountInitial():
          case GetAccountInProgress():
            return const Center(
              child: PrimaryCircularProgressIndicatorWidget(),
            );
          case GetAccountSuccess():
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    const Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(state.account.id.toString()),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    NullableTextWidget(state.account.email),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    const Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    NullableTextWidget(state.account.phone),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.0,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(state.account.userName.toString()),
                  ],
                ),
              ],
            );
          case GetAccountException():
            return Center(child: Text(state.exception));
        }
      },
    );
  }
}
