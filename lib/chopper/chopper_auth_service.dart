import 'package:chopper/chopper.dart';

part 'chopper_auth_service.chopper.dart';

@ChopperApi(baseUrl: '/auth')
abstract class ChopperAuthService extends ChopperService {
  static ChopperAuthService create([ChopperClient? client]) =>
      _$ChopperAuthService(client);

  @POST(path: '/login')
  Future<Response> login(@Body() Map<String, dynamic> body);
}
