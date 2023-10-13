import 'package:flutter/material.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_req_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/add/add_ir_shop_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_obj_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/list/ir_shop_list_res_mdl.dart';
import 'package:idukaan/model/main/business/shop/ir/patch/update_ir_shop_res_mdl.dart';
import 'package:idukaan/model/main/ir/ir_station_list_mdl.dart';

class IrCtrlMdl extends ChangeNotifier {
  IrStationListMdl? stationList;

  //add ir shop
  AddIrShopReqMdl addIrShop = AddIrShopReqMdl();
  AddIrShopResMdl? addIrShopRes;
  // ir shop list
  IrShopListResMdl? irOrgShopList;
  // selected ir shop
  IrShopListObjResMdl? irShop;
  // patch ir shop
  UpdateIrShopResMdl? updateIrShopRes;
}
