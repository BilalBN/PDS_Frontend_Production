import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/auth/bloc/user_login_cubit/user_login_cubit.dart';
import 'package:pds_2/features/auth/presentation/widgets/buttons/login_button_widget.dart';
import 'package:pds_2/shared/widgets/primary_circular_progress_indicator_widget.dart';

class LoginButtonBlocBuilderWidget extends StatelessWidget {
  const LoginButtonBlocBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLoginCubit, UserLoginState>(
      builder: (context, state) {
        if (state is UserLoginInProgress) {
          return const PrimaryCircularProgressIndicatorWidget();
        }
        return const LoginButtonWidget();
      },
    );
  }
}
