abstract class TokenRepository {
  Future<String?> getToken();

  Future<void> saveToken(String token);
}
