import 'package:pds_2/features/batch/data/sources/remote/listen_batches_service.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';

class BatchRealtimeRepository {
  final ListenBatchesService _listenBatchesService;

  BatchRealtimeRepository(this._listenBatchesService);

  Stream<BatchModel> get onBatchCreated => _listenBatchesService.onBatchCreated;

  Stream<int> get onBatchDeleted => _listenBatchesService.onBatchDeleted;
}
