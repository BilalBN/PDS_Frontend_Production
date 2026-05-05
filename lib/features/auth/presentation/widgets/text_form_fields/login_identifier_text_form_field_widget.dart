import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pds_2/features/auth/presentation/providers/auth_controllers_provider.dart';
import 'package:provider/provider.dart';

class LoginIdentifierTextFormFieldWidget extends StatelessWidget {
  const LoginIdentifierTextFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Provider.of<AuthControllersProvider>(
        context,
        listen: false,
      ).identifierController,
      decoration: const InputDecoration(
        hintText: 'Enter username',
        prefixIcon: Icon(Ionicons.person),
      ),
      maxLines: 1,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter username!';
        }
        return null;
      },
    );
  }
}
