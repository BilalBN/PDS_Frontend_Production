import 'package:chopper/chopper.dart';

part 'chopper_batch_service.chopper.dart';

@ChopperApi(baseUrl: '/batch')
abstract class ChopperBatchService extends ChopperService {
  static ChopperBatchService create([ChopperClient? client]) =>
      _$ChopperBatchService(client);

  @GET(path: '/{status}')
  Future<Response> getBatchesByStatus(
    @Path() String status, {
    @Query() int limit = 20,
    @Query() int page = 1,
  });

  @GET(path: '/supervised')
  Future<Response> getSupervised({
    @Query() int limit = 20,
    @Query() int page = 1,
  });
}
