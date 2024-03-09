import 'package:equatable/equatable.dart';

class PlansEntity extends Equatable {
  final String? code;
  final String? status;
  final String? message;
  final List<ListElement>? list;
  final List<dynamic>? appListFree;

  const PlansEntity({
    this.code,
    this.status,
    this.message,
    this.list,
    this.appListFree,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        list,
        appListFree,
      ];
}

class ListElement {
  final int? id;
  final String? bundleId;
  final String? name;
  final String? description;
  final double? quantity;
  final dynamic quantityReal;
  final double? price;
  final int? duration;
  final bool? isSelected;
  final bool? isUnlimited;
  final String? pricePlanId;
  final bool? isPopular;
  final bool? isRecommended;
  final bool? repurchase;
  final bool? isRollover;
  final String? name2;
  final String? name3;
  final bool? hasFreeApps;
  final bool? hasFacebookFull;
  final bool? hasInstagramFull;
  final bool? hasFacebookPhoto;
  final bool? hasInstagramPhoto;
  final String? facebookFullDesc;
  final String? groupName;
  final String? nameByte;
  final String? nameSecond;
  final String? nameSms;
  final bool? isUnlimitedByte;
  final bool? isUnlimitedSecond;
  final bool? isUnlimitedSms;
  final int? quantityByte;
  final int? quantitySecond;
  final int? quantitySms;
  final String? bundleIds;
  final String? mediumSpeed;
  final String? mediumSpeedDescription;
  final BundleType? bundleType;
  final int? whiteBrand;
  final List<dynamic>? freeApps;
  final List<dynamic>? migrations;

  ListElement({
    this.id,
    this.bundleId,
    this.name,
    this.description,
    this.quantity,
    this.quantityReal,
    this.price,
    this.duration,
    this.isSelected,
    this.isUnlimited,
    this.pricePlanId,
    this.isPopular,
    this.isRecommended,
    this.repurchase,
    this.isRollover,
    this.name2,
    this.name3,
    this.hasFreeApps,
    this.hasFacebookFull,
    this.hasInstagramFull,
    this.hasFacebookPhoto,
    this.hasInstagramPhoto,
    this.facebookFullDesc,
    this.groupName,
    this.nameByte,
    this.nameSecond,
    this.nameSms,
    this.isUnlimitedByte,
    this.isUnlimitedSecond,
    this.isUnlimitedSms,
    this.quantityByte,
    this.quantitySecond,
    this.quantitySms,
    this.bundleIds,
    this.mediumSpeed,
    this.mediumSpeedDescription,
    this.bundleType,
    this.whiteBrand,
    this.freeApps,
    this.migrations,
  });
}

class BundleType {
  final int? id;
  final String? name;

  BundleType({
    this.id,
    this.name,
  });
}
