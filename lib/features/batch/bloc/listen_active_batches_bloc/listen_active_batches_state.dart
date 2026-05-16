part of 'listen_active_batches_bloc.dart';

@immutable
sealed class ListenActiveBatchesState extends Equatable {
  const ListenActiveBatchesState();

  @override
  List<Object> get props => [];
}

final class ListenActiveBatchesInitial extends ListenActiveBatchesState {}

final class ListenActiveBatchesInProgress extends ListenActiveBatchesState {}

final class ActiveBatchReturned extends ListenActiveBatchesState {
  final BatchModel batch;

  const ActiveBatchReturned({required this.batch});

  @override
  List<Object> get props => [batch];
}

final class ListenActiveBatchesException extends ListenActiveBatchesState {}
