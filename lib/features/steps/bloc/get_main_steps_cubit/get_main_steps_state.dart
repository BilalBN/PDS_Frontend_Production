part of 'get_main_steps_cubit.dart';

@immutable
sealed class GetMainStepsState extends Equatable {
  const GetMainStepsState();

  @override
  List<Object> get props => [];
}

final class GetMainStepsInitial extends GetMainStepsState {}

final class GetMainStepsInProgress extends GetMainStepsState {}

final class GetMainStepsSuccess extends GetMainStepsState {
  final List<MainStepsModel> mainSteps;

  const GetMainStepsSuccess({required this.mainSteps});

  @override
  List<Object> get props => [mainSteps];
}

final class GetMainStepsException extends GetMainStepsState {
  final String exception;

  const GetMainStepsException({required this.exception});

  @override
  List<Object> get props => [exception];
}
