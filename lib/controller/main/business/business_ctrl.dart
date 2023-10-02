import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idukaan/controller/auth/auth_ctrl.dart';
import 'package:idukaan/controller/auth/auth_ctrl_mdl.dart';
import 'package:idukaan/controller/main/business/business_ctrl_api.dart';
import 'package:idukaan/controller/main/business/business_ctrl_mdl.dart';
import 'package:provider/provider.dart';

class BusinessCtrl extends BusinessCtrlMdl {
  BuildContext context;
  final BusinessCtrlApi _busApi = BusinessCtrlApi();

  BusinessCtrl({required this.context}) {
    String? token = Provider.of<AuthCtrl>(
      context,
      listen: false,
    ).appKeys[AppKey.token.key]!;
    _busApi.setToken(token);
  }

  Future<void> getOrgTypesApi({
    required BuildContext context,
  }) async {
    if (orgTypeList.isEmpty) {
      orgTypeList = await _busApi.getOrgTypesApi(
        context: context,
        showError: false,
      );
    }
    if (orgTypeList.isNotEmpty) {
      addOrg.setType(orgTypeList.first);
    }
  }

  Future<void> postOrgApi({
    required BuildContext context,
  }) async {
    addOrgRes = await _busApi.postOrgApi(
      context: context,
      showError: true,
      addOrg: addOrg,
    );
    notifyListeners();
  }

  Future<void> getOrgListApi({
    required BuildContext context,
    required bool reload,
  }) async {
    if (orgList == null || orgList!.org.isEmpty || reload) {
      orgList = null;
      orgList = await _busApi.getOrgListApi(
        context: context,
        showError: true,
      );
      notifyListeners();
    }
  }

  Future<void> getOrgInfoApi({
    required BuildContext context,
  }) async {
    orgInfo = await _busApi.getOrgInfoApi(
      context: context,
      showError: true,
      orgId: org!.id,
    );
    notifyListeners();
  }
}
