import 'package:bloc_test/bloc_test.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:cuy_flutter_dev/presentation/bloc/plans/plans_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late MockGetActivePlansUseCase mockGetActivePlansUseCase;
  late MockGetTokenUseCase mockGetTokenUseCase;
  late PlansBloc plansBloc;

  setUp(() {
    mockGetActivePlansUseCase = MockGetActivePlansUseCase();
    mockGetTokenUseCase = MockGetTokenUseCase();
    plansBloc = PlansBloc(mockGetActivePlansUseCase, mockGetTokenUseCase);
  });

  const authorization =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';

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

  test('initial state should be PlansInitial', () {
    expect(plansBloc.state, equals(PlansInitial()));
  });

  /* blocTest<PlansBloc, PlansState>(
    'should emit [PlansLoading, PlansSuccess] when data is gotten successfully',
    build: () {
      when(mockGetTokenUseCase()).thenAnswer(
        (_) async {
          return Future.value(authorization);
        },
      );
      when(mockGetActivePlansUseCase(authorization: authorization)).thenAnswer(
        (_) async => const Right(testPlansEntity),
      );
      return plansBloc;
    },
    act: (bloc) async => bloc.add(
      const PlansStarted(),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [PlansLoading(), const PlansSuccess(testList)],
  ); */

  blocTest<PlansBloc, PlansState>(
    'should emit [PlansLoading, PlansFailure] when token is null',
    build: () {
      when(mockGetTokenUseCase()).thenAnswer(
        (_) async {
          return Future.value(null);
        },
      );
      return plansBloc;
    },
    act: (bloc) => bloc.add(
      const PlansStarted(),
    ),
    wait: const Duration(milliseconds: 500),
    expect: () => [PlansLoading(), const PlansFailure('Token not found')],
  );
}
