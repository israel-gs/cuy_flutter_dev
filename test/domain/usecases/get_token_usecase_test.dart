import 'package:cuy_flutter_dev/domain/usecases/get_token_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late GetTokenUseCase getTokenUseCase;
  late MockTokenRepository mockTokenRepository;

  const testToken =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    getTokenUseCase = GetTokenUseCase(mockTokenRepository);
  });

  test('should get string token from the repository', () async {
    when(
      mockTokenRepository.getToken(),
    ).thenAnswer((_) async => testToken);

    final result = await getTokenUseCase();

    expect(result, testToken);
  });
}
