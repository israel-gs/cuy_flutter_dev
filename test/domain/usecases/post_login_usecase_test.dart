import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late PostLoginUseCase postLoginUseCase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    postLoginUseCase = PostLoginUseCase(mockLoginRepository);
  });

  const authorization =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';
  const testEmail = 'test@gmail.com';
  const testPassword = '123';
  const testLoginEntity = LoginEntity();

  test('should get login response from the repository', () async {
    when(
      mockLoginRepository.login(
        authorization: authorization,
        emailOrPhone: testEmail,
        password: testPassword,
      ),
    ).thenAnswer((_) async => const Right(testLoginEntity));

    final result = await postLoginUseCase(
      authorization: authorization,
      emailOrPhone: testEmail,
      password: testPassword,
    );

    expect(result, const Right(testLoginEntity));
  });
}
