import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/steps/bloc/get_main_steps_cubit/get_main_steps_cubit.dart';
import 'package:pds_2/features/steps/presentation/widgets/list_views/batch_steps_list_view_widget.dart';
import 'package:pds_2/shared/widgets/primary_circular_progress_indicator_widget.dart';

class BatchMainStepsPageWidget extends StatefulWidget {
  final int productId;
  const BatchMainStepsPageWidget({super.key, required this.productId});

  @override
  State<BatchMainStepsPageWidget> createState() =>
      _BatchMainStepsPageWidgetState();
}

class _BatchMainStepsPageWidgetState extends State<BatchMainStepsPageWidget> {
  @override
  void initState() {
    super.initState();
    _getMainSteps();
  }

  void _getMainSteps() {
    BlocProvider.of<GetMainStepsCubit>(context).getMainSteps(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Steps',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<GetMainStepsCubit, GetMainStepsState>(
          builder: (context, state) {
            switch (state) {
              case GetMainStepsSuccess():
                return BatchStepsListViewWidget(mainSteps: state.mainSteps);
              case GetMainStepsException():
                return Center(child: Text(state.exception));
              default:
                return const Center(
                  child: PrimaryCircularProgressIndicatorWidget(),
                );
            }
          },
        ),
      ),
    );
  }
}
