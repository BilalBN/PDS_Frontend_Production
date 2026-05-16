import 'package:flutter/foundation.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';

class BatchesProvider with ChangeNotifier {
  final List<BatchModel> _activeBatches = [];
  List<BatchModel> get activeBatches => List.unmodifiable(_activeBatches);

  void addBatch(BatchModel batch) {
    _activeBatches.add(batch);
    notifyListeners();
  }

  void removeBatch(int batchId) {
    if(_activeBatches.isEmpty) return;
    _activeBatches.removeWhere((batch) => batch.id == batchId);
    notifyListeners();
  }
}
