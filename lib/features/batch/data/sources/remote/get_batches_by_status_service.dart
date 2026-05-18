import 'package:fpdart/fpdart.dart';
import 'package:pds_2/chopper/chopper_batch_service.dart';

class GetBatchesByStatusService {
  final ChopperBatchService _chopperBatchService;

  GetBatchesByStatusService(this._chopperBatchService);

  Future<Either<String, dynamic>> get(String status) async {
    try {
      final response = await _chopperBatchService.getBatchesByStatus(status);

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
