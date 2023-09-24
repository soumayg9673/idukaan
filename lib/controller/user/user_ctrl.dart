import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/user/user_ctrl_api.dart';
import 'package:idukaan/controller/user/user_ctrl_mdl.dart';

class UserCtrl extends UserCtrlMdl {
  final UserCtrlApi _userApi = UserCtrlApi();

  Future<void> postUserSignupApi({
    required BuildContext context,
  }) async {
    userSignUpRes = await _userApi.postUserSignupApi(
      context: context,
      userSignupReq: userSignUpReq,
      showError: true,
    );
    notifyListeners();
  }

  Future<void> postUserLoginApi({
    required BuildContext context,
  }) async {
    userLoginRes = await _userApi.postUserLoginApi(
      context: context,
      userLoginReq: userLoginReq,
      showError: true,
    );
    notifyListeners();
  }
}
