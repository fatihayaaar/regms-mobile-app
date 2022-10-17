import 'dart:convert';

import 'package:regms_flutter_client/constants/application_constant.dart';
import 'package:regms_flutter_client/core/services/constants/endpoints.dart';
import 'package:regms_flutter_client/core/services/helpers/request/request_helper.dart';

class AuthRequestHelper extends RequestHelper {
  AuthRequestHelper._();

  Future login({username, password}) async {
    try {
      var response = await super.client.post(
        Uri.https(ApplicationConstant.API_URL, Endpoints.login),
        body: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      }
    } finally {
      super.client.close();
    }
  }
}
