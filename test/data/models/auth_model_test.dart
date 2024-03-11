import 'dart:convert';

import 'package:cuy_flutter_dev/data/models/auth_model.dart';
import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/read_json.dart';

void main() {
  const testAuthModel = AuthModel(
    code: '200',
    status: 'success',
    message: 'Sesión iniciado correctamente.',
    oauthToken: 'sys_sk_test_2sIsFGVeXtSRqMOKpVQ926TMKFAbOEZyKg30WqNtjQkl5Ko',
  );

  test('should be a subclass of AuthEntity', () async {
    expect(testAuthModel, isA<AuthEntity>());
  });

  test('should return a valid model from json', () async {
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('utils/dummy_json/auth.json'),
    );

    final result = AuthModel.fromJson(jsonMap);

    expect(result, testAuthModel);
  });
}
