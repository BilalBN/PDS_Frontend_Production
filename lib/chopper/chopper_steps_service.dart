import 'package:chopper/chopper.dart';

part 'chopper_steps_service.chopper.dart';

@ChopperApi(baseUrl: '/steps')
abstract class ChopperStepsService extends ChopperService {
  static ChopperStepsService create([ChopperClient? client]) =>
      _$ChopperStepsService(client);

  @GET(path: '/main/{productId}')
  Future<Response> getMainSteps(@Path() String productId);
}
