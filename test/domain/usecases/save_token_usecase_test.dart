import 'package:cuy_flutter_dev/domain/usecases/save_token_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/test_util.mocks.dart';

void main() {
  late SaveTokenUseCase saveTokenUseCase;
  late MockTokenRepository mockTokenRepository;

  const testToken =
      'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko';

  setUp(() {
    mockTokenRepository = MockTokenRepository();
    saveTokenUseCase = SaveTokenUseCase(mockTokenRepository);
  });

  test('should return void from the repository', () async {
    when(
      mockTokenRepository.saveToken(testToken),
    ).thenAnswer((_) async {});
    expect(() async => await saveTokenUseCase(token: testToken), isA<void>());
  });
}
