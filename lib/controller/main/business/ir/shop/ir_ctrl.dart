import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_api.dart';
import 'package:idukaan/controller/main/business/ir/shop/ir_ctrl_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/add/add_ir_shop_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/add/add_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/delete/delete_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/patch/update_ir_shop_emp_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/emp/patch/update_ir_shop_emp_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_obj_res_mdl.dart';

class IrCtrl extends IrCtrlMdl {
  final IrCtrlApi _api = IrCtrlApi();

  void setTokenIrShopCtrl({
    required String token,
  }) {
    _api.setToken(token);
  }

  Future<bool> getIrShopLoc() async {
    LocationPermission permission = await Geolocator.requestPermission();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      await Geolocator.openLocationSettings();
      return false;
    }
    Position? position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    addIrShop.addIrShop3.setLat(position.latitude.toString());
    addIrShop.addIrShop3.setLon(position.longitude.toString());
    return true;
  }

  Future<void> getStationListApi({
    required BuildContext context,
  }) async {
    if (stationList == null || stationList!.stations.isEmpty) {
      stationList = await _api.getStationListApi(
        context: context,
        showError: true,
      );
      notifyListeners();
    }
  }

  Future<void> postIrShopApi({
    required BuildContext context,
  }) async {
    addIrShopRes = await _api.postIrShopApi(
      context: context,
      showError: true,
      req: addIrShop,
    );
    notifyListeners();
  }

  Future<void> getIrOrgShopsApi({
    required BuildContext context,
    required String orgId,
    required bool reload,
  }) async {
    if (irOrgShopList == null || irOrgShopList!.irShop.isEmpty || reload) {
      irOrgShopList = await _api.getIrOrgShopsApi(
        context: context,
        showError: true,
        orgId: orgId,
      );
      notifyListeners();
    }
  }

  Future<void> patchIrShopOcApi({
    required BuildContext context,
    required IrShopListObjResMdl shop,
  }) async {
    updateIrShopRes = await _api.patchIrShopOcApi(
      context: context,
      showError: true,
      reqShop: shop,
    );
    notifyListeners();
  }

  Future<void> getIrShopInfoApi({
    required BuildContext context,
  }) async {
    irShopInfo = await _api.getIrShopInfoApi(
      context: context,
      showError: true,
      reqShop: irShop!,
    );
    notifyListeners();
  }

  Future<void> patchIrShopInfoApi({
    required BuildContext context,
  }) async {
    updateIrShopRes = await _api.patchIrShopInfoApi(
      context: context,
      showError: true,
      reqShop: updateIrShop,
    );
    notifyListeners();
  }

  Future<void> getIrShopEmpApi({
    required BuildContext context,
    required bool reload,
  }) async {
    irShopEmpList = await _api.getIrShopEmpsApi(
      context: context,
      showError: true,
      reqShop: irShop!,
    );
    notifyListeners();
  }

  Future<void> getIrOrgShopEmpApi({
    required BuildContext context,
  }) async {
    addIrOrgShopEmpList = null;
    addIrOrgShopEmpList = await _api.getIrOrgShopEmpsApi(
      context: context,
      showError: true,
      reqShop: irShop!,
    );
    notifyListeners();
  }

  Future<AddIrShopEmpResMdl?> postIrOrgShopEmpApi({
    required BuildContext context,
    required AddIrShopEmpReqMdl reqEmp,
  }) async {
    reqEmp.orgId = irShop!.orgId;
    reqEmp.shopId = irShop!.id;
    return await _api.postIrOrgShopEmpApi(
      context: context,
      showError: true,
      reqEmp: reqEmp,
    );
  }

  Future<UpdateIrShopEmpResMdl?> patchIrShopEmpApi({
    required BuildContext context,
    required UpdateIrShopEmpReqMdl reqEmp,
  }) async {
    reqEmp.orgId = irShop!.orgId;
    reqEmp.shopId = irShop!.id;
    return await _api.patchIrShopEmpApi(
      context: context,
      showError: true,
      reqEmp: reqEmp,
    );
  }

  Future<DeleteIrShopEmpResMdl?> deleteIrShopEmpApi({
    required BuildContext context,
    required String empId,
  }) async {
    return await _api.deleteIrShopEmpApi(
      context: context,
      showError: true,
      empId: empId,
      reqShop: irShop!,
    );
  }
}
