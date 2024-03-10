import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:cuy_flutter_dev/domain/repository/plans_repository.dart';
import 'package:dartz/dartz.dart';

class GetActivePlansUseCase {
  final PlansRepository _plansRepository;

  GetActivePlansUseCase(this._plansRepository);

  Future<Either<Failure, PlansEntity>> call() async {
    return await _plansRepository.getActivePlans();
  }
}
