import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/batch/data/repository/batch_repository.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';

part 'get_batches_state.dart';

class GetBatchesCubit extends Cubit<GetBatchesState> {
  final BatchRepository _batchRepository;

  GetBatchesCubit(this._batchRepository) : super(GetBatchesInitial());

  Future<void> getBatches(String status) async {
    _safeEmit(GetBatchesInProgress());

    final result = await _batchRepository.getBatchesByStatus(status);

    result.fold(
      (exception) => _safeEmit(GetBatchesException(exception: exception)),
      (batches) => _safeEmit(GetBatchesSuccess(batches: batches)),
    );
  }

  void _safeEmit(GetBatchesState state) {
    if (isClosed) return;
    emit(state);
  }
}
