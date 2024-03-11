import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/data/repository/auth_repository_impl.dart';
import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late AuthRepositoryImpl authRepositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    authRepositoryImpl = AuthRepositoryImpl(mockRemoteDataSource);
  });

  const testAuthModel = AuthModel(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    oauthToken: "sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko",
  );

  const testAuthEntity = AuthEntity(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    oauthToken: "sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko",
  );

  const testEmail = 'test@gmail.com';
  const testPassword = '123';

  test(
    'should return auth when data source is successfull',
    () async {
      when(
        mockRemoteDataSource.auth(any),
      ).thenAnswer(
        (_) async => HttpResponse<AuthModel>(
          testAuthModel,
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
          ),
        ),
      );

      final result = await authRepositoryImpl.auth(
        email: testEmail,
        password: testPassword,
      );

      expect(result, equals(const Right(testAuthEntity)));
    },
  );

  test(
    'should return server failure when data source is unsuccessfull',
    () async {
      when(
        mockRemoteDataSource.auth(any),
      ).thenThrow('');

      final result = await authRepositoryImpl.auth(
        email: testEmail,
        password: testPassword,
      );

      expect(
        result,
        equals(const Left<ServerFailure, AuthEntity>(ServerFailure(''))),
      );
    },
  );
}
