import 'package:cuy_flutter_dev/data/data_sources/local_data_source.dart';
import 'package:cuy_flutter_dev/data/data_sources/remote_data_source.dart';
import 'package:cuy_flutter_dev/data/repository/auth_repository_impl.dart';
import 'package:cuy_flutter_dev/data/repository/login_repository_impl.dart';
import 'package:cuy_flutter_dev/data/repository/plans_repository_impl.dart';
import 'package:cuy_flutter_dev/data/repository/token_repository_impl.dart';
import 'package:cuy_flutter_dev/domain/repository/auth_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/login_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/plans_repository.dart';
import 'package:cuy_flutter_dev/domain/repository/token_repository.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_active_plans_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_token_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_auth_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_login_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/save_token_usecase.dart';
import 'package:cuy_flutter_dev/presentation/bloc/auth/auth_bloc.dart';
import 'package:cuy_flutter_dev/presentation/bloc/login/login_bloc.dart';
import 'package:cuy_flutter_dev/presentation/bloc/plans/plans_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<RemoteDataSource>(RemoteDataSource(sl()));
  sl.registerSingleton<LocalDataSource>(LocalDataSource());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<LoginRepository>(LoginRepositoryImpl(sl()));
  sl.registerSingleton<PlansRepository>(PlansRepositoryImpl(sl()));
  sl.registerSingleton<TokenRepository>(TokenRepositoryImpl(sl()));

  sl.registerSingleton<GetActivePlansUseCase>(GetActivePlansUseCase(sl()));
  sl.registerSingleton<GetTokenUseCase>(GetTokenUseCase(sl()));
  sl.registerSingleton<PostAuthUseCase>(PostAuthUseCase(sl()));
  sl.registerSingleton<PostLoginUseCase>(PostLoginUseCase(sl()));
  sl.registerSingleton<SaveTokenUseCase>(SaveTokenUseCase(sl()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl()));
  sl.registerFactory<PlansBloc>(() => PlansBloc(sl(), sl()));
}
