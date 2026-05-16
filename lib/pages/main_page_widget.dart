import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pds_2/features/account/presentation/buttons/go_to_account_page_button_widget.dart';
import 'package:pds_2/features/batch/bloc/listen_active_batches_bloc/listen_active_batches_bloc.dart';
import 'package:pds_2/features/batch/bloc/listen_delete_batches_bloc/listen_delete_batches_bloc.dart';
import 'package:pds_2/features/batch/presentation/providers/batches_provider.dart';
import 'package:pds_2/features/batch/presentation/widgets/buttons/filter_batches_button_widget.dart';
import 'package:pds_2/features/batch/presentation/widgets/grid_views/batches_grid_view_widget.dart';
import 'package:pds_2/features/batch/presentation/widgets/text_form_fields/search_batch_text_form_field_widget.dart';
import 'package:provider/provider.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Tab> _tabs;

  @override
  void initState() {
    super.initState();
    const tabs = ['Active', 'Supervised', 'Completed'];
    _tabs = tabs.map((tab) => Tab(text: tab)).toList();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _listenRealtimeActiveBatches();
  }

  void _listenRealtimeActiveBatches() {
    BlocProvider.of<ListenActiveBatchesBloc>(
      context,
    ).add(StartListenActiveBatches());
    BlocProvider.of<ListenDeleteBatchesBloc>(
      context,
    ).add(StartListenDeleteBatch());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ListenActiveBatchesBloc, ListenActiveBatchesState>(
          listener: (context, state) {
            if (state is ActiveBatchReturned) {
              Provider.of<BatchesProvider>(
                context,
                listen: false,
              ).addBatch(state.batch);
            }
          },
        ),
        BlocListener<ListenDeleteBatchesBloc, ListenDeleteBatchesState>(
          listener: (context, state) {
            if (state is DeletedBatchReturned) {
              Provider.of<BatchesProvider>(
                context,
                listen: false,
              ).removeBatch(state.batchId);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [GoToAccountPageButtonWidget()],
          bottom: TabBar(
            controller: _tabController,
            dividerColor: Colors.grey[100],
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            splashBorderRadius: BorderRadius.circular(10.0),
            tabs: _tabs,
            unselectedLabelStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          title: const Text(
            'Batches',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            spacing: 10.0,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Row(
                  spacing: 10.0,
                  children: [
                    Expanded(child: SearchBatchTextFormFieldWidget()),
                    FilterBatchesButtonWidget(),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Consumer<BatchesProvider>(
                      builder: (context, value, _) {
                        if (value.activeBatches.isEmpty) {
                          return const Center(child: Text('No Batches found!'));
                        }
                        return BatchesGridViewWidget(
                          batches: value.activeBatches,
                        );
                      },
                    ),
                    const BatchesGridViewWidget(batches: []),
                    const BatchesGridViewWidget(batches: []),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
