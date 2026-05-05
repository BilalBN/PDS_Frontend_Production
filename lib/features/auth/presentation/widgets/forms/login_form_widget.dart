import 'package:flutter/material.dart';
import 'package:pds_2/core/globals/form_keys.dart';
import 'package:pds_2/features/auth/presentation/widgets/bloc_builders/login_button_bloc_builder_widget.dart';
import 'package:pds_2/features/auth/presentation/widgets/text_form_fields/login_identifier_text_form_field_widget.dart';
import 'package:pds_2/features/auth/presentation/widgets/text_form_fields/login_password_text_form_field_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final double maxWidth;
  const LoginFormWidget({super.key, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          const LoginIdentifierTextFormFieldWidget(),
          const LoginPasswordTextFormFieldWidget(),
          SizedBox(
            width: maxWidth,
            child: const LoginButtonBlocBuilderWidget(),
          ),
        ],
      ),
    );
  }
}
