import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String code;
  final String status;
  final String message;
  final String oauthToken;
  final int oauthTokenExpiresAt;
  final DataEntity data;

  const LoginEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.oauthToken,
    required this.oauthTokenExpiresAt,
    required this.data,
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

class DataEntity extends Equatable {
  final int id;
  final String name;
  final String lastNameFather;
  final String lastNameMother;
  final String lastName;
  final String fullName;
  final String email;
  final String dni;
  final int userIdentificationType;
  final String businessName;
  final String address;
  final String birthday;
  final String referralCode;
  final String referralUrl;
  final String zohoId;
  final String photo;
  final bool hasPhoto;
  final String loggedWithPhone;
  final String loggedWithDni;
  final String region;
  final bool isTourist;
  final int whiteBrand;

  const DataEntity({
    required this.id,
    required this.name,
    required this.lastNameFather,
    required this.lastNameMother,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.dni,
    required this.userIdentificationType,
    required this.businessName,
    required this.address,
    required this.birthday,
    required this.referralCode,
    required this.referralUrl,
    required this.zohoId,
    required this.photo,
    required this.hasPhoto,
    required this.loggedWithPhone,
    required this.loggedWithDni,
    required this.region,
    required this.isTourist,
    required this.whiteBrand,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastNameFather,
        lastNameMother,
        lastName,
        fullName,
        email,
        dni,
        userIdentificationType,
        businessName,
        address,
        birthday,
        referralCode,
        referralUrl,
        zohoId,
        photo,
        hasPhoto,
        loggedWithPhone,
        loggedWithDni,
        region,
        isTourist,
        whiteBrand,
      ];
}
