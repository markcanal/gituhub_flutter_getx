import 'package:get/get.dart';
import 'package:github_repository_getx/core/controllers/dashboard_controller.dart';
import 'package:github_repository_getx/core/controllers/tab_controller.dart';
import 'package:github_repository_getx/core/controllers/user_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<UserTabController>(() => UserTabController());
  }
}
