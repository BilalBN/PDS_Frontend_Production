import 'package:fpdart/fpdart.dart';

abstract class LoginService {
  Future<Either<String, dynamic>> login(Map<String, dynamic> data);
}
