import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String emailOrPhone,
    required String password,
  });
}
