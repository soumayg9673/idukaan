import 'package:flutter/material.dart';
import 'package:idukaan/controller/main/business/business_ctrl.dart';
import 'package:idukaan/controller/main/profile/profile_ctrl.dart';
import 'package:idukaan/view/init/init_view.dart';
import 'package:idukaan/view/main/business/screens/org/add_org_screen.dart';
import 'package:idukaan/view/main/business/screens/org/emp/add_org_emp_screen.dart';
import 'package:idukaan/view/main/business/screens/org/emp/org_emp_list_screen.dart';
import 'package:idukaan/view/main/business/screens/org/org_info_screen.dart';
import 'package:idukaan/view/main/business/screens/org/org_list_screen.dart';
import 'package:idukaan/view/main/business/screens/org/org_opts_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_1_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_2_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_3_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_4_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/add/add_ir_shop_init_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/emp/add_ir_shop_emp_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/emp/ir_shop_emp_list_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/ir_shop_info_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/ir_shop_opts_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/list/ir_org_shop_list_screen.dart';
import 'package:idukaan/view/main/business/screens/shop/ir/update_ir_shop_info_screen.dart';
import 'package:idukaan/view/main/dashboard/dashboard_screen.dart';
import 'package:idukaan/view/main/profile/screens/profile/profile_info_screen.dart';
import 'package:idukaan/view/main/profile/screens/profile_screen.dart';
import 'package:idukaan/view/main/shop/shop_screen.dart';
import 'package:idukaan/view/main/util/bottom_nav_bar_util.dart';
import 'package:idukaan/view/main/util/internet_screen.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});
  static String id = '/idukaan/home/init';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BusinessCtrl(context: context)),
        ChangeNotifierProvider(create: (_) => ProfileCtrl(context: context)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          /*
          Bottom Navigation Bar - Business
           */
          OrgListScreen.id: (_) => const OrgListScreen(),
          AddOrgScreen.id: (_) => const AddOrgScreen(),
          OrgOptsScreen.id: (_) => const OrgOptsScreen(),
          // add ir shop
          AddIrShopInitScreen.id: (_) => const AddIrShopInitScreen(),
          AddIrShop1Screen.id: (_) => const AddIrShop1Screen(),
          AddIrShop2Screen.id: (_) => const AddIrShop2Screen(),
          AddIrShop3Screen.id: (_) => const AddIrShop3Screen(),
          AddIrShop4Screen.id: (_) => const AddIrShop4Screen(),
          // org emp
          OrgEmpListScreen.id: (_) => const OrgEmpListScreen(),
          AddOrgEmpScreen.id: (_) => const AddOrgEmpScreen(),
          OrgInfoScreen.id: (_) => const OrgInfoScreen(),
          // manage shop/stall(s)
          IrOrgShopListScreen.id: (_) => const IrOrgShopListScreen(),
          // ir shop
          IrShopOptsScreen.id: (_) => const IrShopOptsScreen(),
          IrShopInfoScreen.id: (_) => const IrShopInfoScreen(),
          IrShopEmpListScreen.id: (_) => const IrShopEmpListScreen(),
          AddIrShopEmpScreen.id: (_) => const AddIrShopEmpScreen(),
          UpdateIrShopInfoScreen.id: (_) => const UpdateIrShopInfoScreen(),

          /*
          Bottom Navigation Bar - Profile
           */
          ProfileInfoScreen.id: (_) => const ProfileInfoScreen(),
          InitView.id: (_) => const InitView(),
          InternetScreen.id: (_) => const InternetScreen(),
        },
        home: DefaultTabController(
          length: 4,
          initialIndex: 0,
          child: Builder(builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              if (!tabController.indexIsChanging) {
                setState(() {});
              }
            });
            return Scaffold(
              body: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  DashboardScreen(),
                  OrgListScreen(),
                  ShopScreen(),
                  ProfileScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabController.index,
                onTap: (index) {
                  setState(() {
                    tabController.index = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.dashboard.icon,
                    label: BottomNavBarUtil.dashboard.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.business.icon,
                    label: BottomNavBarUtil.business.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.shop.icon,
                    label: BottomNavBarUtil.shop.label,
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavBarUtil.profile.icon,
                    label: BottomNavBarUtil.profile.label,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
