import 'package:cuy_flutter_dev/data/data_sources/local_data_source.dart';
import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';

class TokenRepositoryImpl extends TokenRepository {
  final LocalDataSource _localDataSource;

  TokenRepositoryImpl(this._localDataSource);

  @override
  Future<String?> getToken() async {
    return await _localDataSource.getToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await _localDataSource.saveToken(token);
  }
}
