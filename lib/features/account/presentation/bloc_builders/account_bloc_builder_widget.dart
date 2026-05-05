import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
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
            return const Center(child: CupertinoActivityIndicator());
          case GetAccountSuccess():
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.account.id.toString()),
                NullableTextWidget(state.account.email),
                NullableTextWidget(state.account.phone),
                Text(state.account.userName.toString()),
              ],
            );
          case GetAccountException():
            return Center(child: Text(state.exception));
        }
      },
    );
  }
}
