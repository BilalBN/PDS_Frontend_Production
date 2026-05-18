import 'package:fpdart/fpdart.dart';
import 'package:pds_2/chopper/chopper_steps_service.dart';

class GetMainStepsService {
  final ChopperStepsService _chopperStepsService;

  GetMainStepsService(this._chopperStepsService);

  Future<Either<String, dynamic>> getMainSteps(int productId) async {
    try {
      final response = await _chopperStepsService.getMainSteps(
        productId.toString(),
      );

      if (response.statusCode != 200) {
        final error = response.error as Map<String, dynamic>;
        return Left(error['message']);
      }
      return Right(response.body);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
