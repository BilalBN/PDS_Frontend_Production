import 'package:pds_2/features/batch/models/batch_model.dart';

abstract class ListenBatchesService {
  Stream<BatchModel> get onBatchCreated;

  Stream<int> get onBatchDeleted;

  void close();
}
