import 'package:cuy_flutter_dev/domain/repository/auth_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/login_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/plans_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AuthRepository,
    LoginRepository,
    PlansRepository,
    TokenRepository,
  ],
  customMocks: [
    MockSpec<Dio>(
      as: #MockDio,
    ),
  ],
)
void main() {}
