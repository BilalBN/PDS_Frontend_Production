abstract class ListenBatchesService {
  Stream onBatchCreated();

  Stream<int> onBatchDeleted();
}
