part of 'listen_active_batches_bloc.dart';

sealed class ListenActiveBatchesEvent extends Equatable {
  const ListenActiveBatchesEvent();

  @override
  List<Object> get props => [];
}

class StartListenActiveBatches extends ListenActiveBatchesEvent {}
