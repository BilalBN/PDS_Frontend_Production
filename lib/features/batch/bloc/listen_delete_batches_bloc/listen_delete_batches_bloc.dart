import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/batch/data/repository/batch_realtime_repository.dart';

part 'listen_delete_batches_event.dart';
part 'listen_delete_batches_state.dart';

class ListenDeleteBatchesBloc
    extends Bloc<ListenDeleteBatchesEvent, ListenDeleteBatchesState> {
  final BatchRealtimeRepository _batchRealtimeRepository;

  ListenDeleteBatchesBloc(this._batchRealtimeRepository)
    : super(ListenDeleteBatchesInitial()) {
    on<StartListenDeleteBatch>((event, emit) async {
      emit(ListenDeleteBatchesInProgress());

      await emit.forEach(
        _batchRealtimeRepository.onBatchDeleted,
        onData: (batchId) => DeletedBatchReturned(batchId: batchId),
        onError: (error, stackTrace) => ListenDeleteBatchesException(),
      );
    });
  }
}
