import 'dart:convert';

import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/data/models/auth_request_model.dart';
import 'package:cuy_flutter_dev/data/models/login_model.dart';
import 'package:cuy_flutter_dev/data/models/login_request_model.dart';
import 'package:cuy_flutter_dev/data/models/plans_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/read_json.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(
    dio: dio,
    printLogs: true,
    matcher: const UrlRequestMatcher(),
  );
  late RemoteDataSource remoteDataSource;

  dio.httpClientAdapter = dioAdapter;

  setUp(() {
    remoteDataSource = RemoteDataSource(dio);
  });

  group('post auth', () {
    const testData = <String, dynamic>{
      'email': 'test@gmail.com',
      'password': '123456',
    };

    final testResponse = json.decode(
      readJson('utils/dummy_json/auth.json'),
    );

    test(
      'should return HttpResponse<AuthModel> with the data when response code is 200',
      () async {
        dioAdapter.onPost(
          '/auth',
          (request) => request.reply(200, testResponse),
          data: testData,
        );

        final result = await remoteDataSource.auth(
          const AuthRequestModel(
            email: 'test@gmail.com',
            password: '123456',
          ),
        );
        expect(result, isA<HttpResponse<AuthModel>>());
      },
    );

    test(
      'should return DioException when the response code is not 200',
      () async {
        dioAdapter.onPost(
          '/auth',
          (request) => request.reply(404, testResponse),
          data: testData,
        );

        expect(() async {
          return await remoteDataSource.auth(
            const AuthRequestModel(
              email: 'test@gmail.com',
              password: '123456',
            ),
          );
        }, throwsA(isA<DioException>()));
      },
    );
  });

  group('post login', () {
    const testData = <String, dynamic>{
      'emailOrPhone': 'test@gmail.com',
      'password': '123456',
    };

    final testResponse = json.decode(
      readJson('utils/dummy_json/login.json'),
    );

    const authorization = 'some_token';

    test(
      'should return HttpResponse<LoginModel> with the data when response code is 200',
      () async {
        dioAdapter.onPost(
          '/user/login',
          (request) => request.reply(200, testResponse),
          headers: {
            'Authorization': authorization,
          },
          data: testData,
        );

        final result = await remoteDataSource.login(
          authorization,
          const LoginRequestModel(
            emailOrPhone: 'test@gmail.com',
            password: '123456',
          ),
        );
        expect(result, isA<HttpResponse<LoginModel>>());
      },
    );

    test(
      'should return DioException when the response code is not 200',
      () async {
        dioAdapter.onPost(
          '/user/login',
          (request) => request.reply(404, testResponse),
          headers: {
            'Authorization': authorization,
          },
          data: testData,
        );

        expect(() async {
          return await remoteDataSource.login(
            authorization,
            const LoginRequestModel(
              emailOrPhone: 'test@gmail.com',
              password: '123456',
            ),
          );
        }, throwsA(isA<DioException>()));
      },
    );
  });

  group('get active plans', () {
    final testResponse = json.decode(
      readJson('utils/dummy_json/plans.json'),
    );

    const authorization = 'some_token';

    const sort = 'asc';

    const isActive = true;

    test(
      'should return HttpResponse<PlansModel> with the data when response code is 200',
      () async {
        dioAdapter.onGet(
          '/service-package',
          (request) => request.reply(200, testResponse),
          headers: {
            'Authorization': authorization,
          },
          queryParameters: {
            'sort': sort,
            'isActive': isActive,
          },
        );
        final result = await remoteDataSource.getActivePlans(
          authorization: authorization,
          sort: sort,
          isActive: isActive,
        );
        expect(result, isA<HttpResponse<PlansModel>>());
      },
    );

    test(
      'should return DioException when the response code is not 200',
      () async {
        dioAdapter.onGet(
          '/service-package',
          (request) => request.reply(404, testResponse),
          headers: {
            'Authorization': authorization,
          },
          queryParameters: {
            'sort': sort,
            'isActive': isActive,
          },
        );

        expect(() async {
          return await remoteDataSource.getActivePlans(
            authorization: authorization,
            sort: sort,
            isActive: isActive,
          );
        }, throwsA(isA<DioException>()));
      },
    );
  });
}
