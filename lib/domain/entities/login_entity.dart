import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? code;
  final String? status;
  final String? message;
  final String? oauthToken;
  final int? oauthTokenExpiresAt;
  final Data? data;

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

class Data {
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
  final Company? company;

  Data({
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
    this.company,
  });
}

class Company {
  final int? id;
  final String? ruc;
  final String? businessName;
  final Role? role;

  Company({
    this.id,
    this.ruc,
    this.businessName,
    this.role,
  });
}

class Role {
  final int? id;
  final String? name;

  Role({
    this.id,
    this.name,
  });
}
