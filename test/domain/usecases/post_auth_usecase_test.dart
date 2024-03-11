import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_auth_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late PostAuthUseCase postAuthUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    postAuthUseCase = PostAuthUseCase(mockAuthRepository);
  });

  const testEmail = 'test@gmail.com';
  const testPassword = '123';

  const testAuthEntity = AuthEntity(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    oauthToken: "sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko",
  );

  test('should get auth response from the repository', () async {
    when(
      mockAuthRepository.auth(
        email: testEmail,
        password: testPassword,
      ),
    ).thenAnswer(
      (_) async => const Right(testAuthEntity),
    );

    final result = await postAuthUseCase(
      email: testEmail,
      password: testPassword,
    );

    expect(result, const Right(testAuthEntity));
  });
}
