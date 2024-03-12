import 'package:cuy_flutter_dev/core/util/shared_preferences_util.dart';

class LocalDataSource {
  Future<void> saveToken(String token) async {
    await SharedPreferencesUtil.setData('token', token);
  }

  Future<String?> getToken() async {
    return await SharedPreferencesUtil.getData('token') as String?;
  }
}
