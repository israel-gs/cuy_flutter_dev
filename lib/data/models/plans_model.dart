import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';

class PlansModel extends PlansEntity {
  const PlansModel({
    String? code,
    String? status,
    String? message,
    List<ListElementModel>? list,
    List<dynamic>? appListFree,
  });

  factory PlansModel.fromJson(Map<String, dynamic> json) {
    return PlansModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      list: List<ListElementModel>.from(
          json['list'].map((x) => ListElementModel.fromJson(x))),
      appListFree: List<dynamic>.from(json['app_list_free'].map((x) => x)),
    );
  }
}

class ListElementModel extends ListElementEntity {
  ListElementModel({
    int? id,
    String? bundleId,
    String? name,
    String? description,
    double? quantity,
    dynamic quantityReal,
    double? price,
    int? duration,
    bool? isSelected,
    bool? isUnlimited,
    String? pricePlanId,
    bool? isPopular,
    bool? isRecommended,
    bool? repurchase,
    bool? isRollover,
    String? name2,
    String? name3,
    bool? hasFreeApps,
    bool? hasFacebookFull,
    bool? hasInstagramFull,
    bool? hasFacebookPhoto,
    bool? hasInstagramPhoto,
    String? facebookFullDesc,
    String? groupName,
    String? nameByte,
    String? nameSecond,
    String? nameSms,
    bool? isUnlimitedByte,
    bool? isUnlimitedSecond,
    bool? isUnlimitedSms,
    int? quantityByte,
    int? quantitySecond,
    int? quantitySms,
    String? bundleIds,
    String? mediumSpeed,
    String? mediumSpeedDescription,
    int? whiteBrand,
    List<dynamic>? freeApps,
    List<dynamic>? migrations,
  });

  factory ListElementModel.fromJson(Map<String, dynamic> json) {
    return ListElementModel(
      id: json['id'],
      bundleId: json['bundle_id'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
      quantityReal: json['quantity_real'],
      price: json['price'],
      duration: json['duration'],
      isSelected: json['is_selected'],
      isUnlimited: json['is_unlimited'],
      pricePlanId: json['price_plan_id'],
      isPopular: json['is_popular'],
      isRecommended: json['is_recommended'],
      repurchase: json['repurchase'],
      isRollover: json['is_rollover'],
      name2: json['name2'],
      name3: json['name3'],
      hasFreeApps: json['has_free_apps'],
      hasFacebookFull: json['has_facebook_full'],
      hasInstagramFull: json['has_instagram_full'],
      hasFacebookPhoto: json['has_facebook_photo'],
      hasInstagramPhoto: json['has_instagram_photo'],
      facebookFullDesc: json['facebook_full_desc'],
      groupName: json['group_name'],
      nameByte: json['name_byte'],
      nameSecond: json['name_second'],
      nameSms: json['name_sms'],
      isUnlimitedByte: json['is_unlimited_byte'],
      isUnlimitedSecond: json['is_unlimited_second'],
      isUnlimitedSms: json['is_unlimited_sms'],
      quantityByte: json['quantity_byte'],
      quantitySecond: json['quantity_second'],
      quantitySms: json['quantity_sms'],
      bundleIds: json['bundle_ids'],
      mediumSpeed: json['medium_speed'],
      mediumSpeedDescription: json['medium_speed_description'],
      whiteBrand: json['white_brand'],
      freeApps: List<dynamic>.from(json['free_apps'].map((x) => x)),
      migrations: List<dynamic>.from(json['migrations'].map((x) => x)),
    );
  }
}
