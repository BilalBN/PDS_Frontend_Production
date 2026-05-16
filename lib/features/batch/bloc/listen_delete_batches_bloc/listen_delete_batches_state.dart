part of 'listen_delete_batches_bloc.dart';

@immutable
sealed class ListenDeleteBatchesState extends Equatable {
  const ListenDeleteBatchesState();

  @override
  List<Object> get props => [];
}

final class ListenDeleteBatchesInitial extends ListenDeleteBatchesState {}

final class ListenDeleteBatchesInProgress extends ListenDeleteBatchesState {}

final class DeletedBatchReturned extends ListenDeleteBatchesState {
  final int batchId;

  const DeletedBatchReturned({required this.batchId});

  @override
  List<Object> get props => [batchId];
}

final class ListenDeleteBatchesException extends ListenDeleteBatchesState {}
