import 'package:cuy_flutter_dev/core/error/failure.dart';
import 'package:cuy_flutter_dev/data/models/plans_model.dart';
import 'package:cuy_flutter_dev/data/repository/plans_repository_impl.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late PlansRepositoryImpl plansRepositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    plansRepositoryImpl = PlansRepositoryImpl(mockRemoteDataSource);
  });

  const testPlansModel = PlansModel(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    list: [
      ListElementEntity(
        id: 1,
        bundleId: "12226",
        name: "1 GB",
        description: "Pkg_Data_1_30",
        quantity: 1,
        quantityReal: null,
        price: 1,
        duration: 30,
        isSelected: false,
        isUnlimited: false,
        pricePlanId: "110011",
        isPopular: false,
        isRecommended: false,
        repurchase: false,
        isRollover: false,
        name2: "",
        name3: "",
        hasFreeApps: false,
        hasFacebookFull: false,
        hasInstagramFull: false,
        hasFacebookPhoto: false,
        hasInstagramPhoto: false,
        facebookFullDesc: "",
        groupName: "",
        nameByte: "",
        nameSecond: "",
        nameSms: "",
        isUnlimitedByte: false,
        isUnlimitedSecond: false,
        isUnlimitedSms: false,
        quantityByte: 0,
        quantitySecond: 0,
        quantitySms: 0,
        bundleIds: "",
        mediumSpeed: "",
        mediumSpeedDescription: "",
        whiteBrand: 1,
        freeApps: [],
        migrations: [],
      )
    ],
    appListFree: [],
  );

  const testPlansEntity = PlansEntity(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    list: [
      ListElementEntity(
        id: 1,
        bundleId: "12226",
        name: "1 GB",
        description: "Pkg_Data_1_30",
        quantity: 1,
        quantityReal: null,
        price: 1,
        duration: 30,
        isSelected: false,
        isUnlimited: false,
        pricePlanId: "110011",
        isPopular: false,
        isRecommended: false,
        repurchase: false,
        isRollover: false,
        name2: "",
        name3: "",
        hasFreeApps: false,
        hasFacebookFull: false,
        hasInstagramFull: false,
        hasFacebookPhoto: false,
        hasInstagramPhoto: false,
        facebookFullDesc: "",
        groupName: "",
        nameByte: "",
        nameSecond: "",
        nameSms: "",
        isUnlimitedByte: false,
        isUnlimitedSecond: false,
        isUnlimitedSms: false,
        quantityByte: 0,
        quantitySecond: 0,
        quantitySms: 0,
        bundleIds: "",
        mediumSpeed: "",
        mediumSpeedDescription: "",
        whiteBrand: 1,
        freeApps: [],
        migrations: [],
      )
    ],
    appListFree: [],
  );

  const authorization =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';

  test(
    'should return plans when data source is successfull',
    () async {
      when(
        mockRemoteDataSource.getActivePlans(
          authorization: anyNamed('authorization'),
          isActive: anyNamed('isActive'),
          sort: anyNamed('sort'),
        ),
      ).thenAnswer(
        (_) async => HttpResponse<PlansModel>(
          testPlansModel,
          Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 200,
          ),
        ),
      );

      final result = await plansRepositoryImpl.getActivePlans(
        authorization: authorization,
      );

      expect(
        result,
        equals(const Right<Failure, PlansEntity>(testPlansEntity)),
      );
    },
  );

  test(
    'should return server failure when data source is unsuccessfull',
    () async {
      when(
        mockRemoteDataSource.getActivePlans(
          authorization: anyNamed('authorization'),
          isActive: anyNamed('isActive'),
          sort: anyNamed('sort'),
        ),
      ).thenThrow('');

      final result = await plansRepositoryImpl.getActivePlans(
        authorization: authorization,
      );

      expect(
        result,
        equals(const Left<ServerFailure, PlansEntity>(ServerFailure(''))),
      );
    },
  );
}
