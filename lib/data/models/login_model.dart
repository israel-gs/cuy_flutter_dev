import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.code,
    required super.status,
    required super.message,
    required super.oauthToken,
    required super.oauthTokenExpiresAt,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      oauthToken: json['oauthToken'],
      oauthTokenExpiresAt: json['oauthTokenExpiresAt'],
      data: DataModel.fromJson(json['data']),
    );
  }

  LoginEntity toEntity() {
    return LoginEntity(
      code: super.code,
      status: super.status,
      message: super.message,
      oauthToken: super.oauthToken,
      oauthTokenExpiresAt: super.oauthTokenExpiresAt,
      data: super.data,
    );
  }
}

class DataModel extends DataEntity {
  const DataModel({
    required super.id,
    required super.name,
    required super.lastNameFather,
    required super.lastNameMother,
    required super.lastName,
    required super.fullName,
    required super.email,
    required super.dni,
    required super.userIdentificationType,
    required super.businessName,
    required super.address,
    required super.birthday,
    required super.referralCode,
    required super.referralUrl,
    required super.zohoId,
    required super.photo,
    required super.hasPhoto,
    required super.loggedWithPhone,
    required super.loggedWithDni,
    required super.region,
    required super.isTourist,
    required super.whiteBrand,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        lastNameFather: json["lastNameFather"],
        lastNameMother: json["lastNameMother"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        email: json["email"],
        dni: json["dni"],
        userIdentificationType: json["userIdentificationType"],
        businessName: json["businessName"],
        address: json["address"],
        birthday: json["birthday"],
        referralCode: json["referralCode"],
        referralUrl: json["referralUrl"],
        zohoId: json["zohoId"],
        photo: json["photo"],
        hasPhoto: json["hasPhoto"],
        loggedWithPhone: json["loggedWithPhone"],
        loggedWithDni: json["loggedWithDni"],
        region: json["region"],
        isTourist: json["isTourist"],
        whiteBrand: json["whiteBrand"],
      );
}
