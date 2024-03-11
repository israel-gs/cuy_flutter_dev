import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_active_plans_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late GetActivePlansUseCase getActivePlansUseCase;
  late MockPlansRepository mockPlansRepository;

  const List<ListElementEntity> testList = [
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
  ];

  const testPlansEntity = PlansEntity(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    list: testList,
    appListFree: [],
  );

  const testAuthorization =
      "Cuy-oauthtoken sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko";

  setUp(() {
    mockPlansRepository = MockPlansRepository();
    getActivePlansUseCase = GetActivePlansUseCase(mockPlansRepository);
  });

  test('should get active plans from the repository', () async {
    when(
      mockPlansRepository.getActivePlans(
        authorization: testAuthorization,
      ),
    ).thenAnswer(
      (_) async => const Right(testPlansEntity),
    );

    final result = await getActivePlansUseCase(
      authorization: testAuthorization,
    );

    expect(result, const Right(testPlansEntity));
  });
}
