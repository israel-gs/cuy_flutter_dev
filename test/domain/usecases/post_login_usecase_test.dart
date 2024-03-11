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

  const testDataEntity = DataEntity(
    id: 3,
    name: "Demo",
    lastNameFather: "Demo",
    lastNameMother: "Demo",
    lastName: "Demo Demo",
    fullName: "Demo Demo Demo",
    email: "demo@cuy.pe",
    dni: "11111111",
    userIdentificationType: 1,
    businessName: "",
    address: "aaaaa",
    birthday: "",
    referralCode: "aaaaaaaaaa",
    referralUrl: "https://secure.cuy.pe?referralCode=aaaaaaaaaa",
    zohoId: "3292970000012610247",
    photo: "",
    hasPhoto: false,
    loggedWithPhone: "",
    loggedWithDni: "",
    region: "",
    isTourist: false,
    whiteBrand: 1,
  );

  const testLoginEntity = LoginEntity(
    code: "success",
    status: "success",
    message: "Has iniciado sesión correctamente",
    oauthToken:
        "user_sk_test_brand1-3u2pNiBpOAvqAytfG9OSK5lgBp3Z8lfarYDZjGND2M1TUAP",
    oauthTokenExpiresAt: 1710965944620,
    data: testDataEntity,
  );

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
