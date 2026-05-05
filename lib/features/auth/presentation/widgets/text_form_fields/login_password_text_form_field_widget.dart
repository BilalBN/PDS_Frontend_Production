import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pds_2/features/auth/presentation/providers/auth_controllers_provider.dart';
import 'package:provider/provider.dart';

class LoginPasswordTextFormFieldWidget extends StatelessWidget {
  const LoginPasswordTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Provider.of<AuthControllersProvider>(
        context,
        listen: false,
      ).passwordController,
      decoration: const InputDecoration(
        hintText: 'Enter password',
        prefixIcon: Icon(Ionicons.lock_closed),
      ),
      maxLines: 1,
      obscureText: true,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter password!';
        } else if (value.length < 8) {
          return 'Password must greater than 8 characters!';
        }
        return null;
      },
    );
  }
}
