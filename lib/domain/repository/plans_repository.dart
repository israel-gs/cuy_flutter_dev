import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PlansRepository {
  Future<Either<Failure, PlansEntity>> getActivePlans();
}
