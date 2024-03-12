import 'package:bloc_test/bloc_test.dart';
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

  test('initial state should be PlansInitial', () {
    expect(plansBloc.state, equals(PlansInitial()));
  });

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
