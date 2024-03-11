import 'dart:convert';

import 'package:cuy_flutter_dev/data/models/plans_model.dart';
import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/read_json.dart';

void main() {
  const testListElementModel = ListElementModel(
    id: 1,
    bundleId: "12226",
    name: "1 GB",
    description: "Pkg_Data_1_30",
    quantity: 1,
    quantityReal: null,
    price: 1,
    duration: 30,
    isSelected: false,
    isUnlimited: false,
    pricePlanId: "110011",
    isPopular: false,
    isRecommended: false,
    repurchase: false,
    isRollover: false,
    name2: "",
    name3: "",
    hasFreeApps: false,
    hasFacebookFull: false,
    hasInstagramFull: false,
    hasFacebookPhoto: false,
    hasInstagramPhoto: false,
    facebookFullDesc: "",
    groupName: "",
    nameByte: "",
    nameSecond: "",
    nameSms: "",
    isUnlimitedByte: false,
    isUnlimitedSecond: false,
    isUnlimitedSms: false,
    quantityByte: 0,
    quantitySecond: 0,
    quantitySms: 0,
    bundleIds: "",
    mediumSpeed: "",
    mediumSpeedDescription: "",
    whiteBrand: 1,
    freeApps: [],
    migrations: [],
  );

  const testPlansModel = PlansModel(
    code: "200",
    status: "success",
    message: "Consulta realizado correctamente",
    appListFree: [],
    list: [testListElementModel],
  );

  test('should be a subclass of PlansEntity', () async {
    expect(testPlansModel, isA<PlansEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('utils/dummy_json/plans.json'),
    );

    final result = PlansModel.fromJson(jsonMap);

    expect(result, equals(testPlansModel));
  });
}
