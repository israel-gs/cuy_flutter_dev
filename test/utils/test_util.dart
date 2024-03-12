import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/domain/repository/auth_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/login_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/plans_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_active_plans_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_token_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_auth_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_login_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/save_token_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    AuthRepository,
    LoginRepository,
    PlansRepository,
    TokenRepository,
    //
    GetActivePlansUseCase,
    //
    GetTokenUseCase,
    PostAuthUseCase,
    //
    SaveTokenUseCase,
    PostLoginUseCase,
  ],
)
@GenerateNiceMocks([
  MockSpec<RemoteDataSource>(),
])
void main() {}
