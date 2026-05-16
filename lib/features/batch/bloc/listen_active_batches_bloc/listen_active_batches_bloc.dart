import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/batch/data/repository/batch_realtime_repository.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';

part 'listen_active_batches_event.dart';
part 'listen_active_batches_state.dart';

class ListenActiveBatchesBloc
    extends Bloc<ListenActiveBatchesEvent, ListenActiveBatchesState> {
  final BatchRealtimeRepository _batchRealtimeRepository;

  ListenActiveBatchesBloc(this._batchRealtimeRepository)
    : super(ListenActiveBatchesInitial()) {
    on<StartListenActiveBatches>((_, emit) async {
      emit(ListenActiveBatchesInProgress());

      await emit.forEach(
        _batchRealtimeRepository.onBatchCreated,
        onData: (batch) => ActiveBatchReturned(batch: batch),
        onError: (error, _) => ListenActiveBatchesException(),
      );
    });
  }
}
