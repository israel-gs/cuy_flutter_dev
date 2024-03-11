import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';

class PlansModel extends PlansEntity {
  const PlansModel({
    required super.code,
    required super.status,
    required super.message,
    required super.list,
    required super.appListFree,
  });

  factory PlansModel.fromJson(Map<String, dynamic> json) {
    return PlansModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      list: List<ListElementModel>.from(
          json['list'].map((x) => ListElementModel.fromJson(x))),
      appListFree: List<dynamic>.from(json['appListFree'].map((x) => x)),
    );
  }

  @override
  String toString() {
    return 'PlansModel(code: $code, status: $status, message: $message, list: $list, appListFree: $appListFree)';
  }

  PlansEntity toEntity() {
    return PlansEntity(
      code: super.code,
      status: super.status,
      message: super.message,
      list: super.list,
      appListFree: super.appListFree,
    );
  }
}

class ListElementModel extends ListElementEntity {
  const ListElementModel({
    required super.id,
    required super.bundleId,
    required super.name,
    required super.description,
    required super.quantity,
    required super.quantityReal,
    required super.price,
    required super.duration,
    required super.isSelected,
    required super.isUnlimited,
    required super.pricePlanId,
    required super.isPopular,
    required super.isRecommended,
    required super.repurchase,
    required super.isRollover,
    required super.name2,
    required super.name3,
    required super.hasFreeApps,
    required super.hasFacebookFull,
    required super.hasInstagramFull,
    required super.hasFacebookPhoto,
    required super.hasInstagramPhoto,
    required super.facebookFullDesc,
    required super.groupName,
    required super.nameByte,
    required super.nameSecond,
    required super.nameSms,
    required super.isUnlimitedByte,
    required super.isUnlimitedSecond,
    required super.isUnlimitedSms,
    required super.quantityByte,
    required super.quantitySecond,
    required super.quantitySms,
    required super.bundleIds,
    required super.mediumSpeed,
    required super.mediumSpeedDescription,
    required super.whiteBrand,
    required super.freeApps,
    required super.migrations,
  });

  factory ListElementModel.fromJson(Map<String, dynamic> json) {
    return ListElementModel(
      id: json["id"],
      bundleId: json["bundleId"],
      name: json["name"],
      description: json["description"],
      quantity: json["quantity"],
      quantityReal: json["quantityReal"],
      price: json["price"],
      duration: json["duration"],
      isSelected: json["isSelected"],
      isUnlimited: json["isUnlimited"],
      pricePlanId: json["pricePlanID"],
      isPopular: json["isPopular"],
      isRecommended: json["isRecommended"],
      repurchase: json["repurchase"],
      isRollover: json["isRollover"],
      name2: json["name2"],
      name3: json["name3"],
      hasFreeApps: json["hasFreeApps"],
      hasFacebookFull: json["hasFacebookFull"],
      hasInstagramFull: json["hasInstagramFull"],
      hasFacebookPhoto: json["hasFacebookPhoto"],
      hasInstagramPhoto: json["hasInstagramPhoto"],
      facebookFullDesc: json["facebookFullDesc"],
      groupName: json["groupName"],
      nameByte: json["nameByte"],
      nameSecond: json["nameSecond"],
      nameSms: json["nameSms"],
      isUnlimitedByte: json["isUnlimitedByte"],
      isUnlimitedSecond: json["isUnlimitedSecond"],
      isUnlimitedSms: json["isUnlimitedSms"],
      quantityByte: json["quantityByte"],
      quantitySecond: json["quantitySecond"],
      quantitySms: json["quantitySms"],
      bundleIds: json["bundleIds"],
      mediumSpeed: json["mediumSpeed"],
      mediumSpeedDescription: json["mediumSpeedDescription"],
      whiteBrand: json["whiteBrand"],
      freeApps: json["freeApps"] == null
          ? []
          : List<dynamic>.from(json["freeApps"]!.map((x) => x)),
      migrations: json["migrations"] == null
          ? []
          : List<dynamic>.from(json["migrations"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return 'ListElementModel(id: $id, bundleId: $bundleId, name: $name, description: $description, quantity: $quantity, quantityReal: $quantityReal, price: $price, duration: $duration, isSelected: $isSelected, isUnlimited: $isUnlimited, pricePlanId: $pricePlanId, isPopular: $isPopular, isRecommended: $isRecommended, repurchase: $repurchase, isRollover: $isRollover, name2: $name2, name3: $name3, hasFreeApps: $hasFreeApps, hasFacebookFull: $hasFacebookFull, hasInstagramFull: $hasInstagramFull, hasFacebookPhoto: $hasFacebookPhoto, hasInstagramPhoto: $hasInstagramPhoto, facebookFullDesc: $facebookFullDesc, groupName: $groupName, nameByte: $nameByte, nameSecond: $nameSecond, nameSms: $nameSms, isUnlimitedByte: $isUnlimitedByte, isUnlimitedSecond: $isUnlimitedSecond, isUnlimitedSms: $isUnlimitedSms, quantityByte: $quantityByte, quantitySecond: $quantitySecond, quantitySms: $quantitySms, bundleIds: $bundleIds, mediumSpeed: $mediumSpeed, mediumSpeedDescription: $mediumSpeedDescription, whiteBrand: $whiteBrand, freeApps: $freeApps, migrations: $migrations)';
  }
}
