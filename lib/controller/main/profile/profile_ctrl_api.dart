import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:idukaan/controller/handle_errors_api.dart';
import 'package:idukaan/controller/rest_api.dart';
import 'package:idukaan/model/main/profile/info/profile_info_res_mdl.dart';

class ProfileCtrlApi extends HandleErrorsApi {
  late String _token;
  void setToken(String token) => _token = token;

  Future<ProfileInfoResMdl?> getProfileInfoApi({
    required BuildContext context,
  }) async {
    super.context = context;
    super.showError = true;
    ProfileInfoResMdl? res;
    if (await checkInternetConnectivity()) {
      var response = await http.get(
        Uri.parse(UserApiUri.profile.uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      var resDecode = jsonDecode(response.body);
      if (response.statusCode == 200) {
        res = ProfileInfoResMdl.fromJson(resDecode['userData']);
      } else {
        handleErrors(statusCode: response.statusCode);
      }
    }
    return res;
  }

  Future<void> postLogoutApi({
    required BuildContext context,
  }) async {
    super.context = context;
    super.showError = true;
    if (await checkInternetConnectivity()) {
      var response = await http.post(
        Uri.parse(UserApiUri.logout.uri),
        headers: {
          'Authorization': 'Token $_token',
        },
      );
      if (response.statusCode == 204) {
        await userLogout(isError: false);
      } else {
        handleErrors(statusCode: response.statusCode);
      }
    }
  }
}
