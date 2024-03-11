import 'dart:io';

import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:cuy_flutter_dev/domain/repository/plans_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PlansRepositoryImpl implements PlansRepository {
  final RemoteDataSource _remoteDataSource;

  PlansRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PlansEntity>> getActivePlans({
    required String authorization,
  }) async {
    try {
      final response = await _remoteDataSource.getActivePlans(
        authorization: authorization,
        sort: 'ASC',
        isActive: true,
      );

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
