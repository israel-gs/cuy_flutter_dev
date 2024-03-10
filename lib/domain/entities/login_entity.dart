import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? code;
  final String? status;
  final String? message;
  final String? oauthToken;
  final int? oauthTokenExpiresAt;
  final DataEntity? data;

  const LoginEntity({
    this.code,
    this.status,
    this.message,
    this.oauthToken,
    this.oauthTokenExpiresAt,
    this.data,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        oauthToken,
        oauthTokenExpiresAt,
        data,
      ];
}

class DataEntity {
  final int? id;
  final String? name;
  final String? lastNameFather;
  final String? lastNameMother;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? dni;
  final int? userIdentificationType;
  final String? businessName;
  final String? address;
  final String? birthday;
  final String? referralCode;
  final String? referralUrl;
  final String? zohoId;
  final String? photo;
  final bool? hasPhoto;
  final String? loggedWithPhone;
  final String? loggedWithDni;
  final String? region;
  final bool? isTourist;
  final int? whiteBrand;

  const DataEntity({
    this.id,
    this.name,
    this.lastNameFather,
    this.lastNameMother,
    this.lastName,
    this.fullName,
    this.email,
    this.dni,
    this.userIdentificationType,
    this.businessName,
    this.address,
    this.birthday,
    this.referralCode,
    this.referralUrl,
    this.zohoId,
    this.photo,
    this.hasPhoto,
    this.loggedWithPhone,
    this.loggedWithDni,
    this.region,
    this.isTourist,
    this.whiteBrand,
  });
}
