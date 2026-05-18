import 'package:fpdart/fpdart.dart';
import 'package:pds_2/features/steps/data/sources/remote/get_main_steps_service.dart';
import 'package:pds_2/features/steps/models/main_steps_model.dart';
import 'package:pds_2/shared/models/response_model.dart';

class StepsRepository {
  final GetMainStepsService _getMainStepsService;

  StepsRepository(this._getMainStepsService);

  Future<Either<String, List<MainStepsModel>>> getMainSteps(
    int productId,
  ) async {
    final result = await _getMainStepsService.getMainSteps(productId);
    return result.fold((error) => Left(error), (response) {
      try {
        final responseType = ResponseModel.fromJson(response);
        if (responseType.success ?? false) {
          final List<MainStepsModel> mainSteps =
              (response['data'] as List<dynamic>)
                  .map((step) => MainStepsModel.fromJson(step))
                  .toList();

          return Right(mainSteps);
        }
        return Left(responseType.message.toString());
      } catch (_) {
        return const Left('Response model exception!');
      }
    });
  }
}
