import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/models/login_model.dart';
import 'package:cuy_flutter_dev/data/repository/login_repository_impl.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    loginRepositoryImpl = LoginRepositoryImpl(mockRemoteDataSource);
  });

  const testLoginModel = LoginModel(
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

  const authorization =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';
  const testEmail = 'test@gmail.com';
  const testPassword = '123';

  test(
    'should return login when data source is successfull',
    () async {
      when(
        mockRemoteDataSource.login(any, any),
      ).thenAnswer(
        (_) async => HttpResponse<LoginModel>(
          testLoginModel,
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
          ),
        ),
      );

      final result = await loginRepositoryImpl.login(
        authorization: authorization,
        emailOrPhone: testEmail,
        password: testPassword,
      );

      expect(
          result, equals(const Right<Failure, LoginEntity>(testLoginEntity)));
    },
  );

  test(
    'should return server failure when data source is unsuccessfull',
    () async {
      when(
        mockRemoteDataSource.login(any, any),
      ).thenThrow('');

      final result = await loginRepositoryImpl.login(
        authorization: authorization,
        emailOrPhone: testEmail,
        password: testPassword,
      );

      expect(
        result,
        equals(const Left<ServerFailure, LoginEntity>(ServerFailure(''))),
      );
    },
  );
}
