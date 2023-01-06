import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repository_getx/core/binding/dashboard_binding.dart';
import 'package:github_repository_getx/core/controllers/dashboard_controller.dart';
import 'package:github_repository_getx/screens/dashboard.dart';
import 'package:github_repository_getx/screens/widget/drawer/menu.dart';
import 'package:github_repository_getx/utils/constants/page_constants.dart';
import 'package:github_repository_getx/utils/constants/route_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      title: 'Dashboard',
      initialRoute: RouteConstant.home,
      initialBinding: DashboardBinding(),
      getPages: getPages,
      locale: Get.deviceLocale,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DashBoardController dashboardController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const Text("Github Repository GetX Framework")),
      body: Dashboard(dashboardController: dashboardController),
    );
  }
}

