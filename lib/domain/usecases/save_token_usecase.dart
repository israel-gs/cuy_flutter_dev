import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';

class SaveTokenUseCase {
  final TokenRepository _tokenRepository;

  SaveTokenUseCase(this._tokenRepository);

  Future<void> call({required String token}) async {
    return await _tokenRepository.saveToken(token);
  }
}
