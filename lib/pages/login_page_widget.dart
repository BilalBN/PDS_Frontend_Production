import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pds_2/features/auth/bloc/user_login_cubit/user_login_cubit.dart';
import 'package:pds_2/features/auth/presentation/widgets/forms/login_form_widget.dart';
import 'package:pds_2/shared/constants/nav_routes.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<UserLoginCubit, UserLoginState>(
            listener: (context, state) {
              if (state is UserLoginSuccess) {
                GoRouter.of(context).go(NavRoutes.mainPage);
              } else if (state is UserLoginException) {}
            },
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: LayoutBuilder(
              builder: (context, cons) {
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10.0,
                      children: [
                        Text(
                          'PDS Operator Login',
                          style: TextStyle(
                            fontSize: cons.maxWidth / 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Login to access manufacturing workflow'),
                        LoginFormWidget(maxWidth: cons.maxWidth),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
