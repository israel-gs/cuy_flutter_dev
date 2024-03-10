import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    String? code,
    String? status,
    String? message,
    String? oauthToken,
    int? oauthTokenExpiresAt,
    DataModel? data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      oauthToken: json['oauth_token'],
      oauthTokenExpiresAt: json['oauth_token_expires_at'],
      data: DataModel.fromJson(json['data']),
    );
  }
}

class DataModel extends DataEntity {
  const DataModel({
    int? id,
    String? name,
    String? lastNameFather,
    String? lastNameMother,
    String? lastName,
    String? fullName,
    String? email,
    String? dni,
    int? userIdentificationType,
    String? businessName,
    String? address,
    String? birthday,
    String? referralCode,
    String? referralUrl,
    String? zohoId,
    String? photo,
    bool? hasPhoto,
    String? loggedWithPhone,
    String? loggedWithDni,
    String? region,
    bool? isTourist,
    int? whiteBrand,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      lastNameFather: json['last_name_father'],
      lastNameMother: json['last_name_mother'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      email: json['email'],
      dni: json['dni'],
      userIdentificationType: json['user_identification_type'],
      businessName: json['business_name'],
      address: json['address'],
      birthday: json['birthday'],
      referralCode: json['referral_code'],
      referralUrl: json['referral_url'],
      zohoId: json['zoho_id'],
      photo: json['photo'],
      hasPhoto: json['has_photo'],
      loggedWithPhone: json['logged_with_phone'],
      loggedWithDni: json['logged_with_dni'],
      region: json['region'],
      isTourist: json['is_tourist'],
      whiteBrand: json['white_brand'],
    );
  }
}
