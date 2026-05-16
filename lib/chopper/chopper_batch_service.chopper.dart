// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'chopper_batch_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ChopperBatchService extends ChopperBatchService {
  _$ChopperBatchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ChopperBatchService;

  @override
  Future<Response<dynamic>> getBatchesByStatus(
    String status, {
    int limit = 20,
    int page = 1,
  }) {
    final Uri $url = Uri.parse('/batch/${status}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getSupervised({int limit = 20, int page = 1}) {
    final Uri $url = Uri.parse('/batch/supervised');
    final Map<String, dynamic> $params = <String, dynamic>{
      'limit': limit,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
