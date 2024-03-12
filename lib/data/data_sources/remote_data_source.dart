import 'package:cuy_flutter_dev/core/constants/constants.dart';
import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/data/models/auth_request_model.dart';
import 'package:cuy_flutter_dev/data/models/login_model.dart';
import 'package:cuy_flutter_dev/data/models/login_request_model.dart';
import 'package:cuy_flutter_dev/data/models/plans_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: cuyBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio) = _RemoteDataSource;

  @POST('/auth')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<HttpResponse<AuthModel>> auth(
    @Body() AuthRequestModel authRequestModel,
  );

  @POST('/user/login')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<HttpResponse<LoginModel>> login(
    @Header('Authorization') String authorization,
    @Body() LoginRequestModel loginRequestModel,
  );

  @GET('/service-package')
  @Headers(<String, dynamic>{'Content-Type': 'application/json'})
  Future<HttpResponse<PlansModel>> getActivePlans({
    @Header('Authorization') required String authorization,
    @Query('sort') required String sort,
    @Query('isActive') required bool isActive,
  });
}
