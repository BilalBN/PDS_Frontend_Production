// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'chopper_steps_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ChopperStepsService extends ChopperStepsService {
  _$ChopperStepsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ChopperStepsService;

  @override
  Future<Response<dynamic>> getMainSteps(String productId) {
    final Uri $url = Uri.parse('/steps/main/${productId}');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
