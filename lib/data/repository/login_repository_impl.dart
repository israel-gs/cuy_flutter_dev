import 'dart:io';

import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/data/models/login_request_model.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:cuy_flutter_dev/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class LoginRepositoryImpl implements LoginRepository {
  final RemoteDataSource _remoteDataSource;

  LoginRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String authorization,
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel(
        emailOrPhone: emailOrPhone,
        password: password,
      );
      final response =
          await _remoteDataSource.login(authorization, loginRequestModel);

      if (response.response.statusCode == HttpStatus.ok) {
        return Right(response.data);
      } else {
        return Left(
          ServerFailure(
            response.response.statusMessage ?? 'Something went wrong',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.statusMessage ?? 'Something went wrong',
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
