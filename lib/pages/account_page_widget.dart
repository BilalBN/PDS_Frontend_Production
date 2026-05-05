import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/account/bloc/cubit/get_account_cubit.dart';
import 'package:pds_2/features/account/presentation/bloc_builders/account_bloc_builder_widget.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({super.key});

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAccountCubit>(context).getAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: [AccountBlocBuilderWidget()]),
        ),
      ),
    );
  }
}
