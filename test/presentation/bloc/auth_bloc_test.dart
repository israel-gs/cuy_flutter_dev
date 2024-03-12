import 'package:bloc_test/bloc_test.dart';
import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:cuy_flutter_dev/presentation/bloc/auth/auth_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockPostAuthUseCase mockPostAuthUseCase;
  late MockSaveTokenUseCase mockSaveTokenUseCase;
  late AuthBloc authBloc;

  setUp(() {
    mockPostAuthUseCase = MockPostAuthUseCase();
    mockSaveTokenUseCase = MockSaveTokenUseCase();
    authBloc = AuthBloc(mockPostAuthUseCase, mockSaveTokenUseCase);
  });

  const testEmail = 'test@gmail.com';
  const testPassword = '123456';
  const testAuthEntity = AuthEntity(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    oauthToken: "sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko",
  );

  test('initial state should be AuthInitial', () {
    expect(authBloc.state, equals(AuthInitial()));
  });

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoading, AuthSuccess] when data is gotten successfully',
    build: () {
      when(mockPostAuthUseCase.call(
        email: testEmail,
        password: testPassword,
      )).thenAnswer((_) async => const Right(testAuthEntity));
      when(mockSaveTokenUseCase.call(
        token: testAuthEntity.oauthToken,
      )).thenAnswer(
        (_) {
          return Future.value();
        },
      );
      return authBloc;
    },
    act: (bloc) async => bloc.add(
      const AuthStarted(email: testEmail, password: testPassword),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [AuthLoading(), AuthSuccess(testAuthEntity.oauthToken)],
  );

  blocTest<AuthBloc, AuthState>(
    'should emit [AuthLoading, AuthFailure] when data is gotten unsuccessfully',
    build: () {
      when(mockPostAuthUseCase.call(
        email: testEmail,
        password: testPassword,
      )).thenAnswer(
        (_) async => const Left(ServerFailure('Server Failure')),
      );
      return authBloc;
    },
    act: (bloc) async => bloc.add(
      const AuthStarted(email: testEmail, password: testPassword),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [AuthLoading(), const AuthFailure('Server Failure')],
  );
}
