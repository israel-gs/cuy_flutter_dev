import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:cuy_flutter_dev/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class PostLoginUseCase {
  final LoginRepository _loginRepository;

  PostLoginUseCase(this._loginRepository);

  Future<Either<Failure, LoginEntity>> call({
    required String emailOrPhone,
    required String password,
  }) async {
    return await _loginRepository.login(
      emailOrPhone: emailOrPhone,
      password: password,
    );
  }
}
