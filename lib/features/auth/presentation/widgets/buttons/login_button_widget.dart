import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/core/globals/form_keys.dart';
import 'package:pds_2/features/auth/bloc/user_login_cubit/user_login_cubit.dart';
import 'package:pds_2/features/auth/models/login_model.dart';
import 'package:pds_2/features/auth/presentation/providers/auth_controllers_provider.dart';
import 'package:pds_2/shared/widgets/buttons/primary_button_widget.dart';
import 'package:provider/provider.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButtonWidget(
      onPressed: () {
        final isLoginFormValid = loginFormKey.currentState!.validate();
        if (!isLoginFormValid) return;

        final authControllers = Provider.of<AuthControllersProvider>(
          context,
          listen: false,
        );
        final password = authControllers.password;
        final username = authControllers.identifier;
        final loginModel = LoginModel(password: password, username: username);
        BlocProvider.of<UserLoginCubit>(context).login(loginModel);
      },
      child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
