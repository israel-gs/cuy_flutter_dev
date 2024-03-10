import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';

class GetTokenUseCase {
  final TokenRepository _tokenRepository;

  GetTokenUseCase(this._tokenRepository);

  Future<String?> call() async {
    return await _tokenRepository.getToken();
  }
}
