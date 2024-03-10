import 'package:cuy_flutter_dev/core/constants/constants.dart';
import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/data/models/auth_request_model.dart';
import 'package:cuy_flutter_dev/data/models/login_model.dart';
import 'package:cuy_flutter_dev/data/models/login_request_model.dart';
import 'package:cuy_flutter_dev/data/models/plans_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'remote_data_source.g.dart';

@RestApi(baseUrl: cuyBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio) = _RemoteDataSource;

  @POST('/auth')
  Future<HttpResponse<AuthModel>> auth(
    @Body() AuthRequestModel authRequestModel,
  );

  @POST('/user/login')
  Future<HttpResponse<LoginModel>> login(
    @Body() LoginRequestModel loginRequestModel,
  );

  @GET('/service-package')
  Future<HttpResponse<PlansModel>> getActivePlans({
    @Query('sort') required String sort,
    @Query('isActive') required bool isActive,
  });
}
