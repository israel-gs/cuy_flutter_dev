import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:cuy_flutter_dev/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class PostAuthUseCase {
  final AuthRepository _authRepository;

  PostAuthUseCase(this._authRepository);

  Future<Either<Failure, AuthEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.auth(
      email: email,
      password: password,
    );
  }
}
