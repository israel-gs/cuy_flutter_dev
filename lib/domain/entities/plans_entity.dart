import 'package:equatable/equatable.dart';

class PlansEntity extends Equatable {
  final String code;
  final String status;
  final String message;
  final List<ListElementEntity> list;
  final List<dynamic> appListFree;

  const PlansEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.list,
    required this.appListFree,
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

class ListElementEntity extends Equatable {
  final num id;
  final String bundleId;
  final String name;
  final String description;
  final num quantity;
  final dynamic quantityReal;
  final num price;
  final num duration;
  final bool isSelected;
  final bool isUnlimited;
  final String pricePlanId;
  final bool isPopular;
  final bool isRecommended;
  final bool repurchase;
  final bool isRollover;
  final String name2;
  final String name3;
  final bool hasFreeApps;
  final bool hasFacebookFull;
  final bool hasInstagramFull;
  final bool hasFacebookPhoto;
  final bool hasInstagramPhoto;
  final String facebookFullDesc;
  final String groupName;
  final String nameByte;
  final String nameSecond;
  final String nameSms;
  final bool isUnlimitedByte;
  final bool isUnlimitedSecond;
  final bool isUnlimitedSms;
  final int quantityByte;
  final int quantitySecond;
  final int quantitySms;
  final String bundleIds;
  final String mediumSpeed;
  final String mediumSpeedDescription;
  final int whiteBrand;
  final List<dynamic> freeApps;
  final List<dynamic> migrations;

  const ListElementEntity({
    required this.id,
    required this.bundleId,
    required this.name,
    required this.description,
    required this.quantity,
    required this.quantityReal,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.isUnlimited,
    required this.pricePlanId,
    required this.isPopular,
    required this.isRecommended,
    required this.repurchase,
    required this.isRollover,
    required this.name2,
    required this.name3,
    required this.hasFreeApps,
    required this.hasFacebookFull,
    required this.hasInstagramFull,
    required this.hasFacebookPhoto,
    required this.hasInstagramPhoto,
    required this.facebookFullDesc,
    required this.groupName,
    required this.nameByte,
    required this.nameSecond,
    required this.nameSms,
    required this.isUnlimitedByte,
    required this.isUnlimitedSecond,
    required this.isUnlimitedSms,
    required this.quantityByte,
    required this.quantitySecond,
    required this.quantitySms,
    required this.bundleIds,
    required this.mediumSpeed,
    required this.mediumSpeedDescription,
    required this.whiteBrand,
    required this.freeApps,
    required this.migrations,
  });

  @override
  List<Object?> get props => [
        id,
        bundleId,
        name,
        description,
        quantity,
        quantityReal,
        price,
        duration,
        isSelected,
        isUnlimited,
        pricePlanId,
        isPopular,
        isRecommended,
        repurchase,
        isRollover,
        name2,
        name3,
        hasFreeApps,
        hasFacebookFull,
        hasInstagramFull,
        hasFacebookPhoto,
        hasInstagramPhoto,
        facebookFullDesc,
        groupName,
        nameByte,
        nameSecond,
        nameSms,
        isUnlimitedByte,
        isUnlimitedSecond,
        isUnlimitedSms,
        quantityByte,
        quantitySecond,
        quantitySms,
        bundleIds,
        mediumSpeed,
        mediumSpeedDescription,
        whiteBrand,
        freeApps,
        migrations,
      ];
}
