import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pds_2/features/steps/data/repository/steps_repository.dart';
import 'package:pds_2/features/steps/models/main_steps_model.dart';

part 'get_main_steps_state.dart';

class GetMainStepsCubit extends Cubit<GetMainStepsState> {
  final StepsRepository _stepsRepository;

  GetMainStepsCubit(this._stepsRepository) : super(GetMainStepsInitial());

  Future<void> getMainSteps(int productId) async {
    _safeEmit(GetMainStepsInProgress());

    final result = await _stepsRepository.getMainSteps(productId);

    result.fold(
      (exception) => _safeEmit(GetMainStepsException(exception: exception)),
      (mainSteps) => _safeEmit(GetMainStepsSuccess(mainSteps: mainSteps)),
    );
  }

  void _safeEmit(GetMainStepsState state) {
    if (isClosed) return;
    emit(state);
  }
}
