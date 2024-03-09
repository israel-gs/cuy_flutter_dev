import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> auth({
    required String email,
    required String password,
  });
}
