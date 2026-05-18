import 'package:fpdart/fpdart.dart';
import 'package:pds_2/features/batch/data/sources/remote/get_batches_by_status_service.dart';
import 'package:pds_2/features/batch/models/batch_model.dart';
import 'package:pds_2/shared/models/response_model.dart';

class BatchRepository {
  final GetBatchesByStatusService _getBatchesByStatusService;

  BatchRepository(this._getBatchesByStatusService);

  Future<Either<String, List<BatchModel>>> getBatchesByStatus(
    String status,
  ) async {
    final result = await _getBatchesByStatusService.get(status);

    return result.fold((error) => Left(error), (response) {
      try {
        final responseType = ResponseModel.fromJson(response);
        if (responseType.success ?? false) {
          final List<BatchModel> batches =
              (responseType.data['batches'] as List<dynamic>)
                  .map((batch) => BatchModel.fromJson(batch))
                  .toList();

          return Right(batches);
        }
        return Left(responseType.message.toString());
      } catch (error) {
        return Left(error.toString());
      }
    });
  }
}
