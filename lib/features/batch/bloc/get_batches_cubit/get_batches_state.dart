part of 'get_batches_cubit.dart';

@immutable
sealed class GetBatchesState extends Equatable {
  const GetBatchesState();

  @override
  List<Object> get props => [];
}

final class GetBatchesInitial extends GetBatchesState {}

final class GetBatchesInProgress extends GetBatchesState {}

final class GetBatchesSuccess extends GetBatchesState {
  final List<BatchModel> batches;

  const GetBatchesSuccess({required this.batches});

  @override
  List<Object> get props => [batches];
}

final class GetBatchesException extends GetBatchesState {
  final String exception;

  const GetBatchesException({required this.exception});

  @override
  List<Object> get props => [exception];
}
