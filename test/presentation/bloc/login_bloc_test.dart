import 'package:bloc_test/bloc_test.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:cuy_flutter_dev/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockPostLoginUseCase mockPostLoginUseCase;
  late MockGetTokenUseCase mockGetTokenUseCase;
  late LoginBloc loginBloc;

  setUp(() {
    mockPostLoginUseCase = MockPostLoginUseCase();
    mockGetTokenUseCase = MockGetTokenUseCase();
    loginBloc = LoginBloc(mockPostLoginUseCase, mockGetTokenUseCase);
  });

  const authorization =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';
  const testEmail = 'test@gmail.com';
  const testPassword = '123456';

  const testLoginEntity = LoginEntity(
    code: "success",
    status: "success",
    message: "Has iniciado sesión correctamente",
    oauthToken:
        "user_sk_test_brand1-3u2pNiBpOAvqAytfG9OSK5lgBp3Z8lfarYDZjGND2M1TUAP",
    oauthTokenExpiresAt: 1710965944620,
    data: DataEntity(
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
    ),
  );

  test('initial state should be LoginInitial', () {
    expect(loginBloc.state, equals(LoginInitial()));
  });

/*   blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginSuccess] when data is gotten successfully',
    setUp: () {
      when(mockPostLoginUseCase.call(
        authorization: authorization,
        emailOrPhone: anyNamed('emailOrPhone'),
        password: anyNamed('password'),
      )).thenAnswer((_) => Future.value(const Right(testLoginEntity)));
      when(mockGetTokenUseCase()).thenAnswer(
        (_) async {
          return Future.value(authorization);
        },
      );
    },
    build: () {
      return loginBloc;
    },
    act: (bloc) async => bloc.add(
      const LoginStarted(emailOrPhone: testEmail, password: testPassword),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [LoginLoading(), const LoginSuccess(testLoginEntity)],
  );
 */
  blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginFailure] when token is null',
    build: () {
      when(mockGetTokenUseCase()).thenAnswer(
        (_) async {
          return Future.value(null);
        },
      );
      return loginBloc;
    },
    act: (bloc) => bloc.add(
      const LoginStarted(emailOrPhone: testEmail, password: testPassword),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [LoginLoading(), const LoginFailure('Token not found')],
  );
}
