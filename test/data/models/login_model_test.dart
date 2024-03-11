import 'dart:convert';

import 'package:cuy_flutter_dev/data/models/login_model.dart';
import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/read_json.dart';

void main() {
  const testDataModel = DataModel(
    id: 3,
    name: "Demo",
    lastNameFather: "Demo",
    lastNameMother: "Demo",
    lastName: "Demo Demo",
    fullName: "Demo Demo Demo",
    email: "demo@cuy.pe",
    dni: "11111111",
    userIdentificationType: 1,
    businessName: "",
    address: "aaaaa",
    birthday: "",
    referralCode: "aaaaaaaaaa",
    referralUrl: "https://secure.cuy.pe?referralCode=aaaaaaaaaa",
    zohoId: "3292970000012610247",
    photo: "",
    hasPhoto: false,
    loggedWithPhone: "",
    loggedWithDni: "",
    region: "",
    isTourist: false,
    whiteBrand: 1,
  );

  const testLoginModel = LoginModel(
    code: "success",
    status: "success",
    message: "Has iniciado sesión correctamente",
    oauthToken:
        "user_sk_test_brand1-3u2pNiBpOAvqAytfG9OSK5lgBp3Z8lfarYDZjGND2M1TUAP",
    oauthTokenExpiresAt: 1710965944620,
    data: testDataModel,
  );

  test('should be a subclass of LoginEntity', () async {
    expect(testLoginModel, isA<LoginEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('utils/dummy_json/login.json'),
    );

    final result = LoginModel.fromJson(jsonMap);

    expect(result, testLoginModel);
  });
}
