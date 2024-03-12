import 'package:bloc_test/bloc_test.dart';
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

  const testEmail = 'test@gmail.com';
  const testPassword = '123456';

  test('initial state should be LoginInitial', () {
    expect(loginBloc.state, equals(LoginInitial()));
  });

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
