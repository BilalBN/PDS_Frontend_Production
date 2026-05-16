part of 'listen_delete_batches_bloc.dart';

sealed class ListenDeleteBatchesEvent extends Equatable {
  const ListenDeleteBatchesEvent();

  @override
  List<Object> get props => [];
}

class StartListenDeleteBatch extends ListenDeleteBatchesEvent {}
