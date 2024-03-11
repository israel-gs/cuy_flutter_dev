import 'dart:io';

import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/data/models/auth_request_model.dart';
import 'package:cuy_flutter_dev/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthModel>> auth({
    required String email,
    required String password,
  }) async {
    try {
      AuthRequestModel authRequestModel = AuthRequestModel(
        email: email,
        password: password,
      );
      final response = await _remoteDataSource.auth(authRequestModel);

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
